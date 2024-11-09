import 'package:get/get_navigation/src/routes/get_route.dart';
import '../features/authentication/screens/forget_password/forget_password_mail_screen.dart';
import '../features/authentication/screens/forget_password/forget_password_number_screen.dart';
import '../features/authentication/screens/forget_password/new_password_screen.dart';
import '../features/authentication/screens/forget_password/otp_mail_screen.dart';
import '../features/authentication/screens/forget_password/otp_number_screen.dart';
import '../features/authentication/screens/login/login_screen.dart';
import '../features/authentication/screens/signup/signup_screen.dart';
import '../features/authentication/screens/welcome/welcome_screen.dart';

class AuthRoutes {
  static const String welcomeScreen = '/welcomeScreen';
  static const String loginScreen = '/loginScreen';
  static const String signupScreen = '/signupScreen';
  static const String forgetEmailScreen = '/forgetEmailScreen';
  static const String forgetMobNumberScreen = '/forgetMobNumberScreen';
  static const String emailOtpScreen = '/emailOtpScreen';
  static const String numberOtpScreen = '/numberOtpScreen';
  static const String newPasswordScreen = '/newPasswordScreen';

  static final routes = [
    GetPage(name: welcomeScreen, page: () => const WelcomeScreen()),
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: signupScreen, page: () => const SignupScreen()),
    GetPage(name: forgetEmailScreen, page: () => ForgetPasswordMailScreen()),
    GetPage(
        name: forgetMobNumberScreen,
        page: () => ForgetPasswordMobileNumberScreen()),
    GetPage(name: emailOtpScreen, page: () => const OTPMailScreen()),
    GetPage(name: numberOtpScreen, page: () => const OtpNumberScreen()),
    GetPage(name: newPasswordScreen, page: () => const NewPasswordScreen()),
  ];
}
