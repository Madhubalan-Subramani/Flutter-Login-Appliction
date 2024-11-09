import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common_widgets/common_button.dart';
import '../../../../common_widgets/form_header_widget.dart';
import '../../../../common_widgets/input_field_widget.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../success/success_screen.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

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
                const FormHeaderWidget(
                  image: newPasswordImage,
                  title: newPassword,
                  subTitle: newPasswordSubSTitle,
                ),
                const SizedBox(height: defaultSize),
                const InputFormField(
                  prefixIcon: Icons.lock,
                  labelText: newPassword,
                  hintText: newPassword,
                ),
                const SizedBox(height: defaultSize),
                const InputFormField(
                  prefixIcon: Icons.lock,
                  labelText: confirmPassword,
                  hintText: confirmPassword,
                ),
                const SizedBox(height: defaultSize),
                SizedBox(
                  child: ButtonWidget(
                    buttonName: createPassword,
                    onTap: () => Get.to(() => const SuccessScreen()),
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
