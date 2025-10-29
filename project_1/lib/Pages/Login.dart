import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projet_1/Pages/SignUp.dart';
import 'package:projet_1/Widgets/PrimaryColor.dart';

class Login extends StatelessWidget {
  Login({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController Password = TextEditingController();
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
            "Welcome Back!",
            style: GoogleFonts.inter(
              fontSize: 40,
              fontWeight: FontWeight.w700,
              color: PrimaryColor,
            ),
          ),
          Text(
            "Login",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          Gap(20),
          Image.asset("images/Welcome.png", width: 270),
          Gap(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              controller: email,
              decoration: InputDecoration(
                hintText: "Email",
                hintStyle: GoogleFonts.poppins(
                  fontSize: 10,
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
          Gap(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              controller: Password,
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: GoogleFonts.poppins(
                  fontSize: 10,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  onPressed: () {},
                  child: Text(
                    "Forget Password?",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      color: PrimaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor: PrimaryColor,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),
          MaterialButton(
            onPressed: () {},
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
              "Login",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an Account? ",
                style: GoogleFonts.poppins(fontSize: 10, color: Colors.black),
              ),
              MaterialButton(
                padding: EdgeInsets.all(0),
                minWidth: 0,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onPressed: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (c) => Signup()));
                },
                child: Text(
                  "Signup",
                  style: GoogleFonts.poppins(
                    fontSize: 10,
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
