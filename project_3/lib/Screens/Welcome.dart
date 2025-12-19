import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_3/Screens/Signin.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/welcome.png"),

          SizedBox(height: 50,),

          Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              "Welcome",
              textAlign: TextAlign.start,
              style: GoogleFonts.rubik(
                textStyle: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              "Lorem ipsum dolor sit amet consectetur.\nLorem id sit ",
              style: GoogleFonts.rubik(
                textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                color: Color(0xffBDBDBD),
                letterSpacing: 0.2,
              ),
            ),
          ),

          SizedBox(height: 60),

          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (c) => Signin()),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Continue",
                  style: GoogleFonts.rubik(
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    color: Color(0xffBDBDBD),
                    letterSpacing: 0.2,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Image.asset("assets/arrow.png", height: 40),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
