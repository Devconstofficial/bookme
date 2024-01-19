import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    required this.text,
    required this.icon,
  });

  final String text;
  final icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 98,
      height: 109,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 98,
              height: 109,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 0.50,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    color: Color(0xFFEBEBEB),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 75,
            child: Container(
              width: 98,
              height: 34,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 98,
              height: 75,
              decoration: ShapeDecoration(
                color: Color(0x11009FD9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
              ),
              child: Image.asset(icon),
            ),
          ),
          Positioned(
            left: 24,
            top: 85,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF1C1F34),
                fontSize: 12,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
