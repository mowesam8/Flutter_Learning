import 'package:flutter/material.dart';
import 'package:practice_on_firebase_1/Custom/App_Colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.title});

  final void Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: AppColor.primaryColor,

      height: 48,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),

      onPressed: onPressed,
      
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
