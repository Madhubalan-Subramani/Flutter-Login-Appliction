import 'package:flutter/material.dart';
import 'package:login/src/features/authentication/controllers/auth_service.dart';
import 'package:get/get.dart';
import 'package:login/src/features/authentication/screens/success/success_screen.dart';

class SignupController {
  final GlobalKey<FormState> signupFromKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userEmailController = TextEditingController();
  final TextEditingController userPhoneNoController = TextEditingController();
  final TextEditingController userPasswordController = TextEditingController();

  void submitForm(BuildContext context) {
    if (signupFromKey.currentState!.validate()) {
      String email = userEmailController.text;
      String password = userPasswordController.text;
      AuthService().createAccountWithEmail(email, password).then((value) {
        if (value == "Account Created") {
          Get.snackbar('Success', 'Account Created Successfully!');
          Get.to(() => const SuccessScreen());
        }
      });
    }
  }
}
