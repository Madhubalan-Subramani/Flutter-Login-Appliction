import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ForgetPasswordMailController extends GetxController {
  final TextEditingController emailController = TextEditingController();

  // Method to verify if the email exists in Firestore
  Future<void> verifyEmail(BuildContext context) async {
    String email = emailController.text.trim();

    try {
      // Check if the email exists in Firestore
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('signup_user')
          .where('user_email', isEqualTo: email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // If email exists, send an OTP to the email
        await sendOtp(email);
        // Navigate to the email OTP screen
        Get.toNamed('/emailOtpScreen');
      } else {
        Get.snackbar('Error', 'Email does not exist');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to verify email: $e');
    }
  }

  // Method to send OTP to the email
  Future<void> sendOtp(String email) async {
    try {
      print('Sending OTP to email: $email');
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Get.snackbar('Success', 'OTP sent to your email');
    } catch (e) {
      Get.snackbar('Error', 'Failed to send OTP: $e');
      print('Error sending OTP: $e');
    }
  }
}
