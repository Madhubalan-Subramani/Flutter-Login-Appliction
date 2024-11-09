import 'package:flutter/material.dart';
import '../../../../common_widgets/form_header_widget.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import 'login_footer_widget.dart';
import 'login_form_widget.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Get.offAllNamed('/welcome');
        Get.back();
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(defaultSize),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FormHeaderWidget(
                    image: loginScreenImage,
                    title: loginTitle,
                    subTitle: loginScreenSubTitle,
                  ),
                  const SizedBox(height: xxxl),
                  LoginFormWidget(),
                  const LoginFooterWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
