import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common_widgets/common_button.dart';
import '../../../../common_widgets/form_header_widget.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(defaultSize),
          child: Column(
            children: [
              const FormHeaderWidget(
                image: successAnimation,
                repeatAnimation: false,
                title: '',
                subTitle: passwordResetSuccess,
                imageHeight: 0.25,
                textAlign: TextAlign.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
              const SizedBox(height: defaultSize),
              ButtonWidget(
                buttonName: 'Go Back to Login',
                onTap: () => Get.offAllNamed('/loginScreen'),
                textToUpperCase: false,
                height: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
