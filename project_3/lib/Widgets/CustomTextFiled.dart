import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Customtextfiled extends StatelessWidget {
  const Customtextfiled({
    super.key,
    required this.name,
    required this.hintText,
    required this.suffixIcon,
  });
  final String name;
  final String hintText;
  final IconData suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: GoogleFonts.rubik(
              textStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xff616161),
              ),
            ),
          ),

          TextField(
            decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
              hintStyle: TextStyle(),
              border: UnderlineInputBorder(),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 2, color: Color(0xffFF8383)),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 2, color: Color(0xffBDBDBD)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
