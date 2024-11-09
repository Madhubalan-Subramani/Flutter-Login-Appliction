import 'package:flutter/material.dart';
import '../../../../constants/font_theme.dart';
import '../../../../constants/sizes.dart';

class ForgetPasswordBtnWidget extends StatelessWidget {
  const ForgetPasswordBtnWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.btnIcon,
    required this.onTap,
  });

  final String title, subTitle;
  final IconData btnIcon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(btnIcon, size: 30),
            const SizedBox(width: defaultSize),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: headline6),
                Text(subTitle, style: bodyText2),
              ],
            )
          ],
        ),
      ),
    );
  }
}
