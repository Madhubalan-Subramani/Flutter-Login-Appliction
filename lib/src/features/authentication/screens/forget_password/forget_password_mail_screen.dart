import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common_widgets/common_button.dart';
import '../../../../common_widgets/form_header_widget.dart';
import '../../../../common_widgets/input_field_widget.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../controllers/password_reset_mail_controller.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  final ForgetPasswordMailController forgetPasswordMailController =
      Get.put(ForgetPasswordMailController());

  ForgetPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: defaultSize),
            child: Column(
              children: [
                const SizedBox(height: defaultSize * 0.6),
                const FormHeaderWidget(
                  image: forgetPasswordScreenImage,
                  title: forgetPasswordScreenTitle,
                  subTitle: forgetPasswordEmailScreenSubTitle,
                  heightBetween: 30,
                  textAlign: TextAlign.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
                const SizedBox(height: defaultSize),
                InputFormField(
                  prefixIcon: Icons.email_outlined,
                  labelText: email,
                  hintText: email,
                  keyboardType: TextInputType.emailAddress,
                  controller: forgetPasswordMailController.emailController,
                ),
                const SizedBox(height: defaultSize),
                SizedBox(
                  child: ButtonWidget(
                    buttonName: 'Sent Reset Link',
                    onTap: () =>
                        forgetPasswordMailController.verifyEmail(context),
                    textToUpperCase: false,
                    height: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
