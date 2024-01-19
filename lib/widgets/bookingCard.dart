import 'package:bookme/constants/constants.dart';
import 'package:bookme/widgets/textWidget.dart';
import 'package:flutter/material.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({
    required this.title,
    required this.orderId,
    required this.price,
    required this.discount,
    required this.date,
    required this.time,
    required this.provider,
    required this.imagePath,
  });

  final title;
  final orderId;
  final price;
  final discount;
  final date;
  final time;
  final provider;
  final imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 390,
      padding: const EdgeInsets.all(16),
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 303,
            height: 130,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: NetworkImage(imagePath),
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 303,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextWidget(
                              text: title,
                              color: primaryText,
                              size: 16.0,
                              weight: FontWeight.w500,
                            ),
                            TextWidget(
                              text: orderId,
                              color: kAppbarBg,
                              size: 18.0,
                              weight: FontWeight.w700,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextWidget(
                              text: price,
                              color: kAppbarBg,
                              size: 18.0,
                              weight: FontWeight.w700,
                            ),
                            const SizedBox(width: 5),
                            TextWidget(
                              text: discount,
                              color: Color(0xFF3BA859),
                              size: 14.0,
                              weight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: ShapeDecoration(
                    color: Color(0xFFF6F7F9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 256,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: "Date",
                              color: primaryText,
                              size: 14.0,
                              weight: FontWeight.w700,
                            ),
                            TextWidget(
                              text: date,
                              color: secondaryText,
                              size: 14.0,
                              weight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: 256,
                        height: 1,
                        decoration: ShapeDecoration(
                          color: Color(0xFFEBEBEB),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: 256,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: "Time",
                              color: primaryText,
                              size: 14.0,
                              weight: FontWeight.w700,
                            ),
                            TextWidget(
                              text: time,
                              color: secondaryText,
                              size: 14.0,
                              weight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: 256,
                        height: 1,
                        decoration: ShapeDecoration(
                          color: Color(0xFFEBEBEB),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: 256,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: "Provider",
                              color: primaryText,
                              size: 14.0,
                              weight: FontWeight.w700,
                            ),
                            TextWidget(
                              text: provider,
                              color: secondaryText,
                              size: 14.0,
                              weight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
