import 'package:get/get.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(otpCode) {}

  // void verifyOTP(String otp) async {
  //   var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
  //   isVerified ? Get.offAll(const HomeScreen()) : Get.back();
  // }
}
