import 'package:bookme/constants/constants.dart';
import 'package:bookme/widgets/serviceCard.dart';
import 'package:bookme/widgets/textWidget.dart';
import 'package:flutter/material.dart';

class SellerProfileScreen extends StatefulWidget {
  const SellerProfileScreen({super.key});

  @override
  State<SellerProfileScreen> createState() => _SellerProfileScreenState();
}

class _SellerProfileScreenState extends State<SellerProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppbarBg,
        iconTheme: IconThemeData(color: kAppbarText),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80"),
            ),
            SizedBox(width: 10),
            TextWidget(
              text: "Sylvan Strosin",
              color: kAppbarText,
              size: 14.0,
              weight: FontWeight.w400,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: "About",
                color: primaryText,
                size: 16.0,
                weight: FontWeight.w700,
              ),
              SizedBox(height: 5),
              TextWidget(
                text:
                    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
                color: secondaryText,
                size: 14.0,
                weight: FontWeight.w500,
              ),
              SizedBox(height: 25),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(24),
                decoration: ShapeDecoration(
                  color: Color(0xFFF6F7F9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "Email",
                      color: primaryText,
                      size: 14.0,
                      weight: FontWeight.w700,
                    ),
                    const SizedBox(height: 8),
                    TextWidget(
                      text: "example@gmail.com",
                      color: secondaryText,
                      size: 14.0,
                      weight: FontWeight.w500,
                    ),
                    const SizedBox(height: 24),
                    TextWidget(
                      text: "Number",
                      color: primaryText,
                      size: 14.0,
                      weight: FontWeight.w700,
                    ),
                    const SizedBox(height: 8),
                    TextWidget(
                      text: "(201) 555-0124",
                      color: secondaryText,
                      size: 14.0,
                      weight: FontWeight.w500,
                    ),
                    const SizedBox(height: 24),
                    TextWidget(
                      text: "Member Since",
                      color: primaryText,
                      size: 14.0,
                      weight: FontWeight.w700,
                    ),
                    const SizedBox(height: 8),
                    TextWidget(
                      text: "2019",
                      color: secondaryText,
                      size: 14.0,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              TextWidget(
                text: "Services",
                color: primaryText,
                size: 16.0,
                weight: FontWeight.w700,
              ),
              SizedBox(height: 20),
              Servicecard(
                image:
                    "https://thumbor.forbes.com/thumbor/fit-in/900x510/https://www.forbes.com/advisor/wp-content/uploads/2022/02/How_To_Start_A_Cleaning_Business_-_article_image.jpg",
                price: "₹120",
                rating: "4.3",
                title: "Painting for beautiful Homes",
                sellerName: "Devon Lee",
                sellerimage:
                    "https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80",
                user: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
