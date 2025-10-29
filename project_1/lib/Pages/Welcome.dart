import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projet_1/Pages/Login.dart';
import 'package:projet_1/Pages/SignUp.dart';
import 'package:projet_1/Widgets/PrimaryColor.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image.asset("images/Top.png"),
          Gap(40),
          Text(
            "Welcome!",
            style: GoogleFonts.inter(
              fontSize: 40,
              fontWeight: FontWeight.w700,
              color: PrimaryColor,
            ),
          ),
          Text(
            "Find the things that you Love!",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          Gap(50),
          Image.asset("images/Welcome.png", width: 400),
          Gap(40),
          MaterialButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => Signup()));
            },
            color: PrimaryColor,
            minWidth: 200,
            height: 40,
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0,
            focusElevation: 0,
            highlightElevation: 0,
            child: Text(
              "Sign Up",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          Gap(20),
          MaterialButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (c) => Login()));
            },
            color: Colors.white,
            minWidth: 200,
            height: 40,
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: PrimaryColor, width: 2),
            ),
            elevation: 0,
            focusElevation: 0,
            highlightElevation: 0,
            child: Text(
              "Login",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: PrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
