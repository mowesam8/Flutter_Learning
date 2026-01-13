import 'package:flutter/material.dart';
import 'package:project_4/Custom/AppColors.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [AppColors.Primary, AppColors.Secondary],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 80,
          fontWeight: FontWeight.w400,
          fontFamily: "Prime",
          color: Colors.white,
        ),
      ),
    );
  }
}
