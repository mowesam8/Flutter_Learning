import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_4/Custom/Custom_Button.dart';
import 'package:project_4/Custom/Custom_TextFeild.dart';
import 'package:project_4/Pages/Login.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController firstName = TextEditingController();
    TextEditingController lasttName = TextEditingController();
    TextEditingController userName = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController confirmPassword = TextEditingController();

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 80),
            Text(
              "Let’s Get Started!",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "Create an account on MNZL to get all features",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff515151),
              ),
            ),
            SizedBox(height: 30),
            CustomTextFeild(hint: "First Name", controller: firstName),
            SizedBox(height: 30),
            CustomTextFeild(hint: "Last Name", controller: lasttName),
            SizedBox(height: 30),
            CustomTextFeild(hint: "User Name", controller: userName, icon: Icons.person_2_outlined,),
            SizedBox(height: 30),
            CustomTextFeild(hint: "Email", controller: email, icon: Icons.email_outlined,),
            SizedBox(height: 30),
            CustomTextFeild(hint: "Password", controller: password, icon: Icons.lock_outline,),
            SizedBox(height: 30),
            CustomTextFeild(hint: "Confirm Password", controller: confirmPassword, icon: Icons.lock_outline,),
            SizedBox(height: 25),
            CustomButton(text: "CREATE"),
            SizedBox(height: 20),
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff515151),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (c) => Login()),
                  ),
                  child: Text(
                    "Login",
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
      ),
    );
  }
}
