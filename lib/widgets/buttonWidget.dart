import 'package:bookme/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({required this.text});

  final text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 327,
        height: 48,
        decoration: BoxDecoration(
          color: kButtonBac,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2.5, horizontal: 4),
            child: Text(
              text,
              style: GoogleFonts.dmSans(
                color: kButtonText,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
