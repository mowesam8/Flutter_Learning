import 'package:flutter/material.dart';
import 'package:practice_on_firebase_1/Custom/App_Colors.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.labelText,
    required this.hintText, required this.controller,required this.validator,
  });

  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),

        Text(
          labelText,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        SizedBox(height: 5),

        TextFormField(
          controller: controller,

          validator: validator,
          
          cursorColor: AppColor.secondaryColor,

          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),

            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 14),

            filled: true,
            fillColor: Colors.grey[200],

            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none,
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: AppColor.secondaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
