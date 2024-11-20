import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../common_widgets/common_button.dart';
import '../../../../common_widgets/input_field_widget.dart';
import '../../../../constants/font_theme.dart';
import '../../../../constants/sizes.dart';
import 'package:get/get.dart';
import '../../../../constants/text_strings.dart';
import '../../controllers/login_controller.dart';
import '../forget_password/forget_password_model_bottomsheet.dart';

class LoginFormWidget extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginController.loginFormKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: formInputHeight),
        child: Column(
          children: [
            InputFormField(
              prefixIcon: Icons.person_outline,
              labelText: email,
              hintText: email,
              keyboardType: TextInputType.emailAddress,
              controller: loginController.userNameEmailPhoneController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter valid Name';
                }
                return null;
              },
            ),
            const SizedBox(height: formInputHeight),
            InputFormField(
              prefixIcon: Icons.fingerprint,
              labelText: password,
              hintText: password,
              obscureText: true,
              controller: loginController.passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                } else if (value.length < 6) {
                  return 'Password should be at least 6 characters long';
                } else if (!RegExp(r'^(?=.*[0-9])').hasMatch(value)) {
                  return 'Password should contain at least one number';
                }
                return null;
              },
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  ForgetPasswordScreen.buildShowModelBottomSheet(context);
                },
                style: ButtonStyle(
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                ),
                child: Text(forgetPassword, style: bodyText2),
              ),
            ),
            const SizedBox(height: md),
            SizedBox(
              child: ButtonWidget(
                buttonName: login,
                onTap: () => loginController.login(context),
                textToUpperCase: true,
                height: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
