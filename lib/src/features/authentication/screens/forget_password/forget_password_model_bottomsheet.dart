import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/src/constants/colors.dart';
import '../../../../constants/font_theme.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import 'forget_password_btn_widget.dart';
import 'forget_password_mail_screen.dart';

class ForgetPasswordScreen {
  static PersistentBottomSheetController buildShowModelBottomSheet(
      BuildContext context) {
    return showBottomSheet(
      context: context,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.4,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
            horizontal: defaultSize, vertical: buttonHeight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 3,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: MColors.buttonSecondary,
                ),
              ),
            ),
            const SizedBox(height: xl),
            Text(forgetPasswordTitle, style: headline3),
            Text(forgetPasswordSubTitle, style: bodyText2),
            const SizedBox(height: xl),
            ForgetPasswordBtnWidget(
              title: email,
              subTitle: resetViaEmail,
              btnIcon: Icons.email_outlined,
              onTap: () {
                Navigator.pop(context);
                Get.toNamed('/forgetEmailScreen');
              },
            ),
            const SizedBox(height: md),
            ForgetPasswordBtnWidget(
              title: phoneNo,
              subTitle: resetViaPhone,
              btnIcon: Icons.mobile_friendly,
              onTap: () {
                Navigator.pop(context);
                Get.toNamed('/forgetMobNumberScreen');
              },
            ),
          ],
        ),
      ),
    );
  }
}
