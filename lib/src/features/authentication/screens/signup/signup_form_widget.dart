import 'package:flutter/material.dart';
import '../../../../common_widgets/common_button.dart';
import '../../../../common_widgets/input_field_widget.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../controllers/signup_controller.dart';

class SignUpForm extends StatelessWidget {
  final SignupController signupController;

  const SignUpForm({super.key, required this.signupController});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: signupController.signupFromKey,
      child: Column(
        children: [
          InputFormField(
            prefixIcon: Icons.person_outline_rounded,
            labelText: name,
            hintText: name,
            controller: signupController.userNameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your user name';
              }
              return null;
            },
          ),
          const SizedBox(height: formInputHeight),
          InputFormField(
            prefixIcon: Icons.mail_outlined,
            labelText: email,
            hintText: email,
            keyboardType: TextInputType.emailAddress,
            controller: signupController.userEmailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              } else if (!value.endsWith('@gmail.com')) {
                return 'Email should end with @gmail.com';
              }
              return null;
            },
          ),
          const SizedBox(height: formInputHeight),
          InputFormField(
            prefixIcon: Icons.phone,
            labelText: phoneNo,
            hintText: phoneNo,
            keyboardType: TextInputType.phone,
            controller: signupController.userPhoneNoController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your phone number';
              } else if (value.length != 10) {
                return 'Enter valid phone number';
              } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                return 'Phone number should contain only digits';
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
            controller: signupController.userPasswordController,
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
          const SizedBox(height: xl),
          SizedBox(
            child: ButtonWidget(
              buttonName: signUp,
              onTap: () => signupController.submitForm(context),
              textToUpperCase: true,
              height: 16,
            ),
          ),
        ],
      ),
    );
  }
}
