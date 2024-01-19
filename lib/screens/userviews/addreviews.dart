import 'package:bookme/constants/constants.dart';
import 'package:bookme/widgets/customAppbar.dart';
import 'package:bookme/widgets/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/buttonWidget.dart';

class AddReviewsScreen extends StatefulWidget {
  const AddReviewsScreen({super.key});

  @override
  State<AddReviewsScreen> createState() => _AddReviewsScreenState();
}

class _AddReviewsScreenState extends State<AddReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        text: "My Reviews",
        leading: true,
        textsize: 18.0,
        textweight: FontWeight.w500,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: [
              ProductReviewCard(
                username: "Kurt Hollins",
                imagePath:
                    "https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80",
                dateTime: "10 min ago",
                review:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                rating: 5,
              ),
              SizedBox(height: 20),
              ProductReviewCard(
                username: "Kurt Hollins",
                imagePath:
                    "https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80",
                dateTime: "10 min ago",
                review:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                rating: 4.5,
              ),
              SizedBox(height: 20),
              ProductReviewCard(
                username: "Kurt Hollins",
                imagePath:
                    "https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80",
                dateTime: "10 min ago",
                review:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                rating: 3,
              ),
              SizedBox(height: 20),
              ProductReviewCard(
                username: "Kurt Hollins",
                imagePath:
                    "https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80",
                dateTime: "10 min ago",
                review:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                rating: 3,
              ),
              SizedBox(height: 35),
              InkWell(
                onTap: () {
                  double screenHeight = MediaQuery.of(context).size.height;
                  double dialogHeight =
                      screenHeight * 0.48; // 50% of screen height

                  showDialog<String>(
                    useSafeArea: false,
                    context: context,
                    builder: (BuildContext context) => Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.white,
                      child: Container(
                        height: dialogHeight,
                        child: GiveFeebackAlert(),
                      ),
                    ),
                  );
                },
                child: ButtonWidget(text: "Give Feedback"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductReviewCard extends StatelessWidget {
  const ProductReviewCard({
    required this.username,
    required this.imagePath,
    required this.dateTime,
    required this.review,
    required this.rating,
  });

  final imagePath;
  final dateTime;
  final review;
  final rating;
  final username;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.99,
      padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        color: Color(0xFFF5F4F7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 53,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: NetworkImage(imagePath),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1.50, color: Colors.white),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 5,
                      height: 9,
                      decoration:
                          BoxDecoration(color: Colors.white.withOpacity(0)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextWidget(
                              text: username,
                              color: primaryText,
                              size: 12.0,
                              weight: FontWeight.w700,
                            ),
                            SizedBox(
                              width: 63,
                            ),
                            RatingBar.builder(
                              itemSize: 15,
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 1.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 12,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        SizedBox(
                          width: 227,
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                            style: TextStyle(
                              color: Color(0xFF53577A),
                              fontSize: 10,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w400,
                              height: 2,
                              letterSpacing: 0.30,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        TextWidget(
                          text: '10 mins ago',
                          color: secondaryText,
                          size: 8.0,
                          weight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GiveFeebackAlert extends StatelessWidget {
  const GiveFeebackAlert({super.key});

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
                  text: 'Review',
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
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 14),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: kTextfieldBg,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        text: 'Give Rating',
                        color: kTextfieldPText,
                        size: 14.0,
                        weight: FontWeight.w500,
                      ),
                      RatingBar.builder(
                        itemSize: 20,
                        initialRating: 0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 12,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: kTextfieldBg,
                    hintText: "Review",
                    hintStyle: GoogleFonts.workSans(
                      color: kTextfieldPText,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
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
                ),
                SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () => {
                    Navigator.pop(
                      context,
                    )
                  },
                  child: ButtonWidget(text: "Submit"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
