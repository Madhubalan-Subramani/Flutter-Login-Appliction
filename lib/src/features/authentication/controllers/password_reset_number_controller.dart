import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ForgetPasswordPhoneNoController extends GetxController {
  final TextEditingController phoneNoController = TextEditingController();

  // Method to verify if the phone number exists in Firestore
  Future<void> verifyPhoneNo(BuildContext context) async {
    String phoneNo = phoneNoController.text.trim();

    try {
      // Check if the phone number exists in Firestore
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('signup_user')
          .where('user_PhoneNo', isEqualTo: phoneNo)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // If phone number exists, send an OTP to the phone number
        await sendOtp(phoneNo, context);
      } else {
        Get.snackbar('Error', 'Phone number does not exist');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to verify phone number: $e');
    }
  }

  // Method to send OTP to the phone number
  Future<void> sendOtp(String phoneNo, BuildContext context) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91$phoneNo',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential);
          Get.snackbar('Success', 'Phone number automatically verified');
        },
        verificationFailed: (FirebaseAuthException e) {
          Get.snackbar('Error', 'Failed to send OTP: ${e.message}');
        },
        codeSent: (String verificationId, int? resendToken) {
          // Navigate to OTP screen and pass verificationId
          Get.toNamed('/numberOtpScreen',
              arguments: {'verificationId': verificationId});
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Auto-retrieval timed out
        },
      );
      Get.snackbar('Success', 'OTP sent to your phone number');
    } catch (e) {
      Get.snackbar('Error', 'Failed to send OTP: $e');
    }
  }
}
