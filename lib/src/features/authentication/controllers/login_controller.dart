import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../screens/success/success_screen.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  // Controllers for the input fields
  final TextEditingController userNameEmailPhoneController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login(BuildContext context) async {
    if (loginFormKey.currentState!.validate()) {
      String input = userNameEmailPhoneController.text;
      String password = passwordController.text;

      // Check whether the input is a username, email, or phone number
      bool loginSuccess = await checkCredentials(input, password);
      if (loginSuccess) {
        Get.snackbar('Success', 'Login successful');
        // Navigate to the HomeScreen
        Get.to(() => const SuccessScreen());
      } else {
        Get.snackbar('Error', 'Invalid credentials');
      }
    }
  }

  // Method to check credentials
  Future<bool> checkCredentials(String input, String password) async {
    try {
      // Query Firestore to check if the input matches any field in the users collection
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('signup_user')
          .where('user_email', isEqualTo: input)
          .get();

      if (querySnapshot.docs.isEmpty) {
        // If no match found in email, try with username
        querySnapshot = await FirebaseFirestore.instance
            .collection('signup_user')
            .where('user_name', isEqualTo: input)
            .get();
      }

      if (querySnapshot.docs.isEmpty) {
        // If no match found in username, try with phone number
        querySnapshot = await FirebaseFirestore.instance
            .collection('signup_user')
            .where('user_PhoneNo', isEqualTo: input)
            .get();
      }

      // If any document is found, check if the password matches
      if (querySnapshot.docs.isNotEmpty) {
        var userData = querySnapshot.docs.first.data() as Map<String, dynamic>;
        if (userData['user_Password'] == password) {
          return true;
        }
      }

      return false;
    } catch (e) {
      return false;
    }
  }
}
