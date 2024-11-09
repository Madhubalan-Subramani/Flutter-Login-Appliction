import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../../common_widgets/common_button.dart';
import '../../../../common_widgets/form_header_widget.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../controllers/otp_controller.dart';

class OTPMailScreen extends StatelessWidget {
  const OTPMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var otpController = Get.put(OTPController());
    var otp;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: defaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: xxxl),
                const FormHeaderWidget(
                  image: otpScreenImage,
                  title: otpTitle,
                  subTitle: changeYourPasswordSubTitle,
                  heightBetween: 15,
                  imageHeight: 0.18,
                  textAlign: TextAlign.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
                const SizedBox(height: defaultSize),
                OtpTextField(
                  fillColor: Colors.black.withOpacity(0.1),
                  filled: true,
                  numberOfFields: 6,
                  onSubmit: (code) {
                    otp = code;
                    // OTPController.instance.verifyOTP(otp);
                  },
                ),
                const SizedBox(height: md),
                ButtonWidget(
                  buttonName: resendNumber,
                  onTap: () {},
                  useGradient: false,
                  nameColor: Colors.deepPurpleAccent,
                ),
                const SizedBox(height: defaultSize),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: defaultSize),
                  child: SizedBox(
                    child: ButtonWidget(
                      buttonName: next,
                      onTap: () {
                        // OTPController.instance.verifyOTP(otp);
                        Get.toNamed('/newPasswordScreen');
                      },
                      height: 12,
                    ),
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
