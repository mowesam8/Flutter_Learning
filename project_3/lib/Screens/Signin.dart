import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_3/Screens/Signup.dart';
import 'package:project_3/Widgets/CustomButton.dart';
import 'package:project_3/Widgets/CustomHeader.dart';
import 'package:project_3/Widgets/CustomTextFiled.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/signin.png"),

          Customheader(header: "Sign in"),

          SizedBox(height: 20),

          Customtextfiled(
            name: 'Email',
            hintText: "Enter your email",
            suffixIcon: Icons.email_outlined,
          ),

          SizedBox(height: 10),

          Customtextfiled(
            name: "Password",
            hintText: "Enter your password",
            suffixIcon: Icons.lock_outline,
          ),

          SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Checkbox(
                  onChanged: (value) {
                    setState(() {
                      rememberMe = value!;
                    });
                  },
                  value: rememberMe,
                  activeColor: Color(0xffFF8383),
                  checkColor: Colors.white,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  side: BorderSide(color: Color(0xffFF8383), width: 1.5),
                ),

                Text(
                  "Remember Me",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff424242),
                  ),
                ),

                SizedBox(width: 90),

                Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffFF8383),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10),

          Custombutton(text: "Login"),

          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don’t have an Account ?",
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
                    MaterialPageRoute(builder: (c) => Signup()),
                  );
                },
                child: Text(
                  " Sign up",
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
