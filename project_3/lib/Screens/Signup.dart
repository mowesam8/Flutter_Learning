import 'package:flutter/material.dart';
import 'package:project_3/Screens/Signin.dart';
import 'package:project_3/Widgets/CustomButton.dart';
import 'package:project_3/Widgets/CustomHeader.dart';
import 'package:project_3/Widgets/CustomTextFiled.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/signup.png"),

          Customheader(header: "Sign Up"),

          SizedBox(height: 20),

          Customtextfiled(
            name: 'Email',
            hintText: "Enter your email",
            suffixIcon: Icons.email_outlined,
          ),

          SizedBox(height: 10),

          Customtextfiled(
            name: 'Phone Number',
            hintText: "Enter your phone number",
            suffixIcon: Icons.phone_android_outlined,
          ),

          SizedBox(height: 10),

          Customtextfiled(
            name: 'Password',
            hintText: "Create your Password",
            suffixIcon: Icons.lock_outlined,
          ),
          SizedBox(height: 10),

          Customtextfiled(
            name: 'Confirm Password',
            hintText: "Confirm your Password",
            suffixIcon: Icons.lock_outlined,
          ),

          SizedBox(height: 30,),

          Custombutton(text: "Create Acount"),

          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an Account!",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff9E9E9E),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (c) => Signin()),
                  );
                },
                child: Text(
                  " Login",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffFF8383),
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}