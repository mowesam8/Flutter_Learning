import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_4/Custom/CustomText.dart';
import 'package:project_4/Custom/Custom_Button.dart';
import 'package:project_4/Custom/Custom_TextFeild.dart';
import 'package:project_4/Pages/SignUp.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userName = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 180,
            child: Stack(
              children: [
                Image.asset("assets/Images/Rectangle2.png", width: 400),
                Positioned(
                  left: -30,
                  child: Image.asset(
                    "assets/Images/Rectangle1.png",
                    width: 320,
                  ),
                ),
              ],
            ),
          ),
          CustomText(text: "LOGO"),
          Text(
            "Welcome Back!",
            style: GoogleFonts.roboto(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Log in to existing LOGO account",
            style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff515151),
            ),
          ),
          SizedBox(height: 30),
          CustomTextFeild(
            hint: "Username",
            icon: Icons.person_2_outlined,
            controller: userName,
          ),
          SizedBox(height: 20),
          CustomTextFeild(
            hint: "Password",
            icon: Icons.lock_outline,
            controller: password,
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text("Forget Password?")],
            ),
          ),
          SizedBox(height: 40),
          CustomButton(text: "LOG IN"),
          SizedBox(height: 20),
          Text(
            "Or login using",
            style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: const Color(0xff282828),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 115),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/Images/facebook.png", width: 50),
                Image.asset("assets/Images/google.png", width: 50),
                Image.asset("assets/Images/apple.png", width: 50),
              ],
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t have an account? ",
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff515151),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (c) => SignUp()),
                  ),
                  child: Text(
                    "Sign UP",
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
