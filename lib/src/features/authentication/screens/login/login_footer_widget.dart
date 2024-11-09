import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../constants/font_theme.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import 'package:get/get.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: defaultSize),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(dontHaveAccount, style: bodyText2),
            TextButton(
              onPressed: () => Get.toNamed('/signupScreen'),
              child: Text(
                signUp,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.deepPurpleAccent,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: lg),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  color: Colors.grey,
                  height: 1,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              orSignInWith,
              style: bodyText2,
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  color: Colors.grey,
                  height: 1,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: xxl),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.black12),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 4),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: const Padding(
                padding: EdgeInsets.all(6.0),
                child: Image(image: AssetImage(fbLogo)),
              ),
            ),
            const SizedBox(width: 20),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.black12),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 4),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Image(image: AssetImage(googleLogo)),
              ),
            ),
            const SizedBox(width: 20),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.black12),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 4),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: const Padding(
                padding: EdgeInsets.all(12),
                child: Image(image: AssetImage(twitterLogo)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
