import 'package:bookme/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthTextField extends StatelessWidget {
  AuthTextField({
    required this.obsecureText,
    required this.text,
    required this.controller,
    required this.icon,
    this.path,
    this.onTapIcon,
  });

  final bool obsecureText;
  final String text;
  final icon;
  final path;
  final TextEditingController controller;
  final void Function()? onTapIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.words,
      style: const TextStyle(
        color: primaryText,
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
      ),
      obscureText: obsecureText,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: kTextfieldBg,
        hintText: text,
        hintStyle: GoogleFonts.workSans(
          color: kTextfieldPText,
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
        ),
        suffixIcon: icon
            ? IconButton(
                icon: Image.asset(path),
                onPressed: onTapIcon,
              )
            : null,
        //Borders of textfield
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: kTextfieldBorder,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: kTextfieldBorder,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: kTextfieldBorder,
          ),
        ),
      ),
    );
  }
}
