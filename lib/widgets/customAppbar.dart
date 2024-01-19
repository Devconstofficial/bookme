import 'package:bookme/constants/constants.dart';
import 'package:bookme/widgets/textWidget.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar(
      {super.key, required this.text, this.leading, this.textweight, this.textsize});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  
  final text;
  
  final leading;
  final textweight;
  final textsize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kAppbarBg,
      automaticallyImplyLeading: leading,
      iconTheme: const IconThemeData(color: kAppbarText),
      title: AppbarText(
        text: text,
        color: kAppbarText,
        size: textsize,
        weight: textweight,
      ),
    );
  }
}
