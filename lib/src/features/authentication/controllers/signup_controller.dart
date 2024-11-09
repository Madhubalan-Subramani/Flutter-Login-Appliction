import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/signup_user_model.dart';
import 'package:get/get.dart';
import '../screens/success/success_screen.dart';

class SignupController {
  final GlobalKey<FormState> signupFromKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userEmailController = TextEditingController();
  final TextEditingController userPhoneNoController = TextEditingController();
  final TextEditingController userPasswordController = TextEditingController();

  void submitForm(BuildContext context) {
    if (signupFromKey.currentState!.validate()) {
      _signupUser(context);
    }
  }

  Future<void> _signupUser(BuildContext context) async {
    try {
      SignUpUserModel newSignupUser = SignUpUserModel(
        userName: userNameController.text,
        userEmail: userEmailController.text,
        userPhoneNo: userPhoneNoController.text,
        userPassword: userPasswordController.text,
      );

      // Upload the user data to Firebase
      await FirebaseFirestore.instance
          .collection('signup_user')
          .add(newSignupUser.toMap());

      // Show success message
      Get.snackbar('Success', 'User signed up successfully!');

      Get.to(() => const SuccessScreen());
    } catch (e) {
      Get.snackbar('Error', 'Failed to sign up user: $e');
    }
  }
}
