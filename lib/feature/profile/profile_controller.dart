import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:studyo_test/resources/resources.dart';
import 'package:studyo_test/utills/widget/snackbar/snackbar_widget.dart';

class ProfileController extends GetxController {
  TextEditingController usernameC = TextEditingController();
  RxBool isNull = true.obs; 
  RxBool isCondition1 = false.obs; 
  RxBool isCondition2 = false.obs; 
  RxBool isCondition3 = false.obs; 
  RxBool isReview = true.obs; 
  RxBool isCompleted = false.obs; 
  RegExp regex = RegExp(r'^[a-zA-Z0-9]+$');

  String? uid;
  
  @override
  void onInit() {
    uid = Get.arguments;
    getUsername(uid ?? "");
    super.onInit();
  }

  void onChangedUsername(String value) async {
    if (value.isNotEmpty) {
      isNull.value = false;
    } else{
      isNull.value = true;
    }
    
    if (!regex.hasMatch(value)) {
      isCondition1.value = false;
    } else{
      isCondition1.value = true;
    }

    if (value.length > 8) {
      isCondition2.value = true;
    } else{
      isCondition2.value = false;
    }

    await checkUsernameExists(value);

    update();
  }

  Future<void> checkUsernameExists(String username) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('username', isEqualTo: username)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      isCondition3.value = false;
    } else {
      isCondition3.value = true;
    }
  }

  void getUsername(String userId) async {
    DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(userId).get();
    if (userDoc.exists) {
      var data = userDoc.data() as Map<String, dynamic>;
      usernameC.text = data['username'];
      isCompleted.value = true;
      isNull.value = false;
      isReview.value = data['isReview'];
      isCondition1.value = true;
      isCondition2.value = true;
      debugPrint('Username: ${data['username']}');
      debugPrint('Is Review: ${data['isReview']}');
    } else {
      debugPrint('User not found');
    }
    update();
  }

  void confirmUsername() async {
    if(isCondition1.value && isCondition2.value && isCondition3.value && isReview.value){
      if (isCompleted.value) {
        await updateUser();
      } else {
        await addUser();
      }
      showSnackbar(
        title: "Success!",
        subtitle: "Your username is updated",
        icon: const Icon(
          Icons.check,
          color: AppColors.green,
        ),
      );
    } else {
      showSnackbar(
        title: "Oops!",
        subtitle: "Please make sure all conditions are okay (blue color)",
        icon: const Icon(
          Icons.close,
          color: AppColors.red,
        ),
      );
    }
  }

  Future<void> updateUser() async {
    if (uid != null) {
      try {
        await FirebaseFirestore.instance.collection('users').doc(uid).update({
          'username': usernameC.text,
          'isReview': false,
        });
        isReview.value = false;
        isCondition3.value = false;
        debugPrint('Username updated successfully');
      } catch (e) {
        debugPrint('Failed to update username: $e');
      }
    }
    update();
  }

  Future<void> addUser() async {
    if (uid != null) {
      try {
        await FirebaseFirestore.instance.collection('users').doc(uid).set({
          'username': usernameC.text,
          'isReview': true,
        });
        isCompleted.value = true;
        isCondition3.value = false;
        debugPrint('User added successfully');
      } catch (e) {
        debugPrint('Failed to add user: $e');
      }
    }
    update();
  }
}
