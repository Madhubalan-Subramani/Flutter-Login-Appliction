import 'package:flutter/material.dart';
import '../../../../common_widgets/form_header_widget.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../controllers/signup_controller.dart';
import 'signup_footer_widget.dart';
import 'signup_form_widget.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupController signupController = SignupController();
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed('/welcomeScreen');
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FormHeaderWidget(
                    image: signUpScreenImage,
                    title: signupTitle,
                    subTitle: signupSubTitle,
                  ),
                  const SizedBox(height: xxxl),
                  SignUpForm(
                    signupController: signupController,
                  ),
                  const SignUpFormFooter(),
                  const SizedBox(height: md),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
