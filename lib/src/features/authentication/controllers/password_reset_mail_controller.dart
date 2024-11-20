import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:login/src/features/authentication/controllers/auth_service.dart';

class ForgetPasswordMailController extends GetxController {
  final TextEditingController emailController = TextEditingController();

  // Method to verify if the email exists in Firestore
  Future<void> verifyEmail(BuildContext context) async {
    String email = emailController.text.trim();

    try {
      if (email.isEmpty) {
        Get.snackbar('Error', 'Enter Email Id');
      } else if (!email.endsWith('@gmail.com')) {
        Get.snackbar('Error', 'Enter valid Email Id');
      } else {
        await AuthService().resetPasswordEmail(email).then((value) {
          if (value == "reset Password Successfully") {
            Get.snackbar('Success', 'OTP sent to $email');
            Get.toNamed("loginScreen");
          } else {
            Get.snackbar('Error', value);
          }
        });
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to verify email: $e');
    }
  }

  // Method to verify OTP to the email
  Future<void> verifyOtp(String email, String otpCode) async {
    try {
      var res = EmailAuth(sessionName: '')
          .validateOtp(recipientMail: email, userOtp: otpCode);
    } catch (e) {
      Get.snackbar('Error', 'Error while generate otp: $e');
    }
  }
}
