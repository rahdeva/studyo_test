import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileController extends GetxController {
  TextEditingController usernameC = TextEditingController();
  RxBool isNull = true.obs; 
  RxBool isCondition1 = true.obs; 
  RxBool isCondition2 = true.obs; 
  RxBool isCondition3 = false.obs; 
  RxBool isCondition4 = false.obs; 
  RegExp regex = RegExp(r'^[a-zA-Z0-9]+$');

  void onChangedUsername(String value){
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
      isCondition2.value = false;
    } else{
      isCondition2.value = true;
    }
    update();
  }

  void getUser(String userId) async {
    DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(userId).get();
    if (userDoc.exists) {
      var data = userDoc.data() as Map<String, dynamic>;
      print('Username: ${data['username']}');
      print('Is Review: ${data['isReview']}');
    } else {
      print('User not found');
    }
  }

  // void getUser(String userId) async {
  //   DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(userId).get();
  //   if (userDoc.exists) {
  //     var data = userDoc.data() as Map<String, dynamic>;
  //     debugPrint('Username: ${data['username']}');
  //     debugPrint('Is Review: ${data['isReview']}');
  //   } else {
  //     debugPrint('User not found');
  //   }
  // }

}
