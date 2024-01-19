import 'package:bookme/constants/constants.dart';
import 'package:bookme/widgets/buttonWidget.dart';
import 'package:bookme/widgets/textWidget.dart';
import 'package:flutter/material.dart';

class BookingSummary extends StatelessWidget {
  const BookingSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(color: kAppbarBg),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: 'Booking Summary',
                  color: kAppbarText,
                  size: 14.0,
                  weight: FontWeight.w700,
                ),
                InkWell(
                  onTap: () => {
                    Navigator.pop(
                      context,
                    )
                  },
                  child: Icon(
                    Icons.cancel,
                    color: kAppbarText,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Image(
                  width: MediaQuery.of(context).size.width * 0.8,
                  image: NetworkImage(
                    "https://thumbor.forbes.com/thumbor/fit-in/900x510/https://www.forbes.com/advisor/wp-content/uploads/2022/02/How_To_Start_A_Cleaning_Business_-_article_image.jpg",
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: TextWidget(
                        text: "Car wash and cleaning",
                        size: 16.0,
                        weight: FontWeight.w500,
                        color: primaryText,
                      ),
                    ),
                    Expanded(
                      child: TextWidget(
                        align: TextAlign.right,
                        text: "₹120",
                        size: 22.0,
                        weight: FontWeight.w700,
                        color: kAppbarBg,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                TextRows(text1: "Date", text2: "25 Feb, 2022"),
                TextRows(text1: "Time", text2: "08:30 AM"),
                TextRows(
                    text1: "Location",
                    text2: "4517 Washington Ave. Manchester, Kentucky 39495"),
                TextRows(text1: "Quantity", text2: "*1"),
                TextRows(text1: "Payment Status", text2: "Pending"),
                SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () => {
                    Navigator.pop(
                      context,
                    )
                  },
                  child: ButtonWidget(text: "Confirm"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TextRows extends StatelessWidget {
  const TextRows({super.key, required this.text1, required this.text2});
  final text1;
  final text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget(
          text: text1,
          size: 12.0,
          weight: FontWeight.w500,
          color: primaryText,
        ),
        Expanded(
          child: TextWidget(
            align: TextAlign.right,
            text: text2,
            size: 12.0,
            weight: FontWeight.w500,
            color: secondaryText,
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
