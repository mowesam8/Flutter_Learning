import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_4/Custom/CustomText.dart';
import 'package:project_4/Pages/Login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (c) => Login()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 650,
            child: Stack(
              children: [
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 150),
                      CustomText(text: "LOGO"),
                    ],
                  ),
                ),
                Positioned(
                  left: 70,
                  child: Image.asset("assets/Images/line.png"),
                ),
                Positioned(
                  top: 310,
                  left: 44,
                  child: Image.asset("assets/Images/light.png"),
                ),
                Positioned(
                  left: 130,
                  top: -50,
                  child: Image.asset("assets/Images/line.png"),
                ),
                Positioned(
                  top: 260,
                  left: 103,
                  child: Image.asset("assets/Images/light.png"),
                ),
                Positioned(
                  top: 260,
                  left: 25,
                  child: Image.asset("assets/Images/login.png", width: 370),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Lorem Ipsum ",
            style: GoogleFonts.inter(
              textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Lorem Ipsum is a dummy text\n used as placeholder",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Color(0xff515151),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
