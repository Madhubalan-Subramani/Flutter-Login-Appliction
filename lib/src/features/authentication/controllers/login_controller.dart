import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/src/features/authentication/controllers/auth_service.dart';

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

      // Check whether the input email and password is correct or wrong
      AuthService().loginWithEmail(input, password).then((value) {
        if (value == "LoggedIn Successfully") {
          Get.snackbar('Success', 'Login successful');
          Navigator.restorablePushNamedAndRemoveUntil(
              context, 'homeScreen', (route) => false);
        } else {
          Get.snackbar('Error', 'Invalid credentials');
        }
      });
    }
  }
}
