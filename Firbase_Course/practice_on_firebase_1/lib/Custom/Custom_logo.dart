import 'package:flutter/material.dart';
import 'package:practice_on_firebase_1/Custom/App_Colors.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,

        decoration: BoxDecoration(
          color: AppColor.secondaryColor,
          borderRadius: BorderRadius.circular(50),
        ),

        child: Image.asset("assets/images/logo.png", height: 70),
      ),
    );
  }
}
