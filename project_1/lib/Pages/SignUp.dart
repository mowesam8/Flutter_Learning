import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projet_1/Pages/Login.dart';
import 'package:projet_1/Widgets/PrimaryColor.dart';

class Signup extends StatelessWidget {
  Signup({super.key});
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController createPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset("images/Top.png"),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                ),
              ),
            ],
          ),
          Gap(40),
          Text(
            "Create Account",
            style: GoogleFonts.inter(
              fontSize: 40,
              fontWeight: FontWeight.w700,
              color: PrimaryColor,
            ),
          ),
          Text(
            "Enter your Personal Data",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          Gap(50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              controller: firstname,
              decoration: InputDecoration(
                hintText: "First Name",
                hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Color(0xffACA7A7),
                ),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: PrimaryColor, width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: PrimaryColor, width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          Gap(14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              controller: lastname,
              decoration: InputDecoration(
                hintText: "Last Name",
                hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Color(0xffACA7A7),
                ),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: PrimaryColor, width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: PrimaryColor, width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          Gap(14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              controller: email,
              decoration: InputDecoration(
                hintText: "Email",
                hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Color(0xffACA7A7),
                ),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: PrimaryColor, width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: PrimaryColor, width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          Gap(14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              controller: phone,
              decoration: InputDecoration(
                hintText: "Phone Number",
                hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Color(0xffACA7A7),
                ),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: PrimaryColor, width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: PrimaryColor, width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          Gap(14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              controller: createPassword,
              decoration: InputDecoration(
                hintText: "Create Password",
                hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Color(0xffACA7A7),
                ),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: PrimaryColor, width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: PrimaryColor, width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                suffixIcon: Icon(Icons.visibility_outlined),
              ),
            ),
          ),
          Gap(14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              controller: confirmPassword,
              decoration: InputDecoration(
                hintText: "Confirm Password",
                hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Color(0xffACA7A7),
                ),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: PrimaryColor, width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: PrimaryColor, width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                suffixIcon: Icon(Icons.visibility_outlined),
              ),
            ),
          ),
          Gap(20),
          MaterialButton(
            onPressed: () {
              
            },
            color: PrimaryColor,
            minWidth: 200,
            height: 40,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            elevation: 0,
            focusElevation: 0,
            highlightElevation: 0,
            child: Text(
              "Sign Up",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an Account? ",
                style: GoogleFonts.poppins(fontSize: 12, color: Colors.black),
              ),
              MaterialButton(
                padding: EdgeInsets.all(0),
                minWidth: 0,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (c) => Login()));
                },
                child: Text(
                  "Login",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: PrimaryColor,
                    decoration: TextDecoration.underline,
                    decorationColor: PrimaryColor,
                    decorationThickness: 2,
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
