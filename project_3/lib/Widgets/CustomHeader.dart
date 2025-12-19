import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Customheader extends StatelessWidget {
  const Customheader({super.key, required this.header});
  final String header;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header,
            style: GoogleFonts.rubik(
              textStyle: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.w500,
                color: Color(0xff424242),
              ),
            ),
          ),

          Image.asset("assets/line.png", width: 74),
        ],
      ),
    );
  }
}
