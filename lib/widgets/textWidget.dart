import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  TextWidget({
    required this.text,
    this.size,
    this.color,
    this.weight,
    this.align,
  });
  final text;
  final size;
  final color;
  final weight;
  final align;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: GoogleFonts.dmSans(
        fontSize: size,
        color: color,
        fontWeight: weight,
      ),
    );
  }
}

class AppbarText extends StatelessWidget {
  const AppbarText({
    required this.text,
    this.size,
    this.color,
    this.weight,
    this.align,
  });

  final text;
  final size;
  final color;
  final weight;
  final align;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: GoogleFonts.rubik(
        fontSize: size,
        color: color,
        fontWeight: weight,
      ),
    );
  }
}
