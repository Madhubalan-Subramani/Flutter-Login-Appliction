import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common_widgets/animation/fade_in_animation_controller.dart';
import '../../../../common_widgets/animation/fade_in_animation_design.dart';
import '../../../../common_widgets/animation/fade_in_animation_model.dart';
import '../../../../common_widgets/common_button.dart';
import '../../../../constants/font_theme.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startAnimation();

    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        final shouldExit = await showExitConfirmationDialog(context);
        return shouldExit ??
            false; // If the user presses outside the dialog, false will be returned
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(defaultSize),
            child: Stack(
              children: [
                FadeInAnimation(
                  durationInMs: 1500,
                  animate: AnimatePosition(
                    bottomAfter: 0,
                    bottomBefore: -100,
                    leftAfter: 0,
                    leftBefore: 0,
                    rightAfter: 0,
                    rightBefore: 0,
                    topAfter: 0,
                    topBefore: 0,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(
                            image: const AssetImage(welcomeScreenImage),
                            height: size.height * 0.5),
                        Column(
                          children: [
                            Text(welcomeScreenTitle,
                                style: headline1, textAlign: TextAlign.center),
                            const SizedBox(height: 10),
                            Text(welcomeScreenSubTitle,
                                style: bodyText2, textAlign: TextAlign.center),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ButtonWidget(
                                buttonName: login,
                                onTap: () => Get.toNamed('/loginScreen'),
                                nameColor: Colors.black,
                                useGradient: false,
                                borderWidth: 1,
                                borderColor: Colors.black54,
                                borderRadius: BorderRadius.circular(5),
                                textToUpperCase: true,
                                animation: true,
                              ),
                            ),
                            const SizedBox(width: md),
                            Expanded(
                              child: ButtonWidget(
                                buttonName: signUp,
                                onTap: () => Get.toNamed('/signupScreen'),
                                textToUpperCase: true,
                                animation: true,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool?> showExitConfirmationDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Exit App",
          style: headline4,
        ),
        content: Text(
          "Do you really want to exit the app?",
          style: bodyText2,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              "Stay",
              style: headline6,
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(
              "Exit",
              style: headline6,
            ),
          ),
        ],
      ),
    );
  }
}
