import 'package:bookme/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchbarWidget extends StatelessWidget {
  SearchbarWidget({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.words,
      style: const TextStyle(
        color: primaryText,
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
      ),
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search_rounded),
        prefixIconColor: kTextfieldPText,
        filled: true,
        fillColor: Color(0xFFF6F7F9),
        hintText: "Search here...",
        hintStyle: GoogleFonts.workSans(
          color: kTextfieldPText,
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),

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
