import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../constants/font_theme.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    super.key,
    required this.image,
    required this.title,
    this.subTitle = '',
    this.imageHeight = 0.2,
    this.heightBetween,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.textAlign,
    this.repeatAnimation = true,
  });

  final String image, title, subTitle;
  final double imageHeight;
  final double? heightBetween;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign? textAlign;
  final bool repeatAnimation;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    Widget displayImage;
    if (image.endsWith('.json')) {
      displayImage = Lottie.asset(image, repeat: repeatAnimation);
    } else {
      displayImage = Image.asset(image);
    }

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          SizedBox(
            height: size.height * imageHeight,
            child: displayImage,
          ),
          SizedBox(height: heightBetween),
          Text(title, style: headline1),
          Text(subTitle, style: bodyText2, textAlign: textAlign),
        ],
      ),
    );
  }
}
