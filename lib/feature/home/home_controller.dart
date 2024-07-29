import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final Rx<User?> currentUser = Rx<User?>(null);
  String userName = "";

  @override
  void onInit(){
    super.onInit();
    currentUser.bindStream(auth.authStateChanges());
    ever(currentUser, initialSignInCheck);
  }

  void initialSignInCheck(User? user) {
    if (user == null) {
      signInAnonymously();
    } else {
      debugPrint('User already signed in: ${user.uid}');
      currentUser.value = user;
      if(currentUser.value != null){
        checkUserInFirestore(currentUser.value!);
      }
    }
  }

  Future<void> signInAnonymously() async {
    try {
      UserCredential userCredential = await auth.signInAnonymously();
      User? user = userCredential.user;
      if (user != null) {
        currentUser.value = user;
        debugPrint('Signed in anonymously as user: ${user.uid}');
        await checkUserInFirestore(user);
      }
    } catch (e) {
      debugPrint('Failed to sign in anonymously: $e');
    }
  }

  Future<void> checkUserInFirestore(User user) async {
    try{
      final userDoc = await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid).get();
      if (userDoc.exists) {
        var data = userDoc.data() as Map<String, dynamic>;
        userName = data['username'];
        debugPrint('User already exists in Firestore');
      } else {
        userName = "Guest";
        debugPrint('User does not exist in Firestore, creating new user');
      }
    } catch (e) {
      debugPrint('Error checking user in Firestore: $e');
    }
    update();
  }

  void newAccount() async {
    try {
      logout();
      await auth.signOut();
      currentUser.value = null;
      signInAnonymously();
    } catch (e) {
      debugPrint('Failed to create new account in Firestore: $e');
    }
  }

  Future<void> logout() async {
    try {
      
      userName = "";
      debugPrint('User signed out successfully');
    } catch (e) {
      debugPrint('Failed to sign out: $e');
    }
  }
}
