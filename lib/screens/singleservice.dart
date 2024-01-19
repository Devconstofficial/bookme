import 'package:bookme/constants/constants.dart';
import 'package:bookme/screens/userviews/addreviews.dart';
import 'package:bookme/screens/userviews/bookservice.dart';
import 'package:bookme/screens/userviews/singlechat.dart';
import 'package:bookme/widgets/buttonWidget.dart';
import 'package:bookme/widgets/textWidget.dart';
import 'package:flutter/material.dart';

class SingleServiceScreen extends StatefulWidget {
  const SingleServiceScreen({super.key});

  @override
  State<SingleServiceScreen> createState() => _SingleServiceScreenState();
}

class _SingleServiceScreenState extends State<SingleServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.99,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://thumbor.forbes.com/thumbor/fit-in/900x510/https://www.forbes.com/advisor/wp-content/uploads/2022/02/How_To_Start_A_Cleaning_Business_-_article_image.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(0.0,
                  -100.0), // Adjust the y-offset to half of the card height
              child: SingleProductCard(),
            ),
            Transform.translate(
              offset: Offset(0, -80),
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: 'Description',
                      color: primaryText,
                      size: 18.0,
                      weight: FontWeight.w500,
                    ),
                    TextWidget(
                      text:
                          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ',
                      color: secondaryText,
                      size: 14.0,
                      weight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: ListTile(
                        tileColor: Color(0xFFF6F7F9),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80"),
                        ),
                        title: TextWidget(
                          text: 'Leslie Alexander',
                          color: primaryText,
                          size: 18.0,
                          weight: FontWeight.w500,
                        ),
                        trailing: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 13, vertical: 8),
                          decoration: BoxDecoration(
                              color: kAppbarBg,
                              borderRadius: BorderRadius.circular(15)),
                          child: InkWell(
                            onTap: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SingleChatScreen(),
                                ),
                              )
                            },
                            child: TextWidget(
                              text: 'Chat',
                              color: kAppbarText,
                              size: 10.0,
                              weight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: 'Reviews',
                          color: primaryText,
                          size: 18.0,
                          weight: FontWeight.w600,
                        ),
                        InkWell(
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddReviewsScreen(),
                              ),
                            )
                          },
                          child: TextWidget(
                            text: 'View All',
                            color: secondaryText,
                            size: 12.0,
                            weight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ProductReviewCard(
                        username: "Donna Bins",
                        imagePath:
                            "https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80",
                        dateTime: "02 December",
                        review:
                            "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet",
                        rating: 5),
                    SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookingPart1(),
                          ),
                        )
                      },
                      child: ButtonWidget(text: "Continue"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SingleProductCard extends StatelessWidget {
  const SingleProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x16000000),
            blurRadius: 94,
            offset: Offset(0, 24),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: 'Electronics',
                color: primaryText,
                size: 14.0,
                weight: FontWeight.w500,
              ),
              SizedBox(height: 5),
              TextWidget(
                text: 'TV Wall Mount Installation',
                color: primaryText,
                size: 22.0,
                weight: FontWeight.w600,
              ),
              const SizedBox(height: 13),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextWidget(
                    text: '₹500',
                    color: kAppbarBg,
                    size: 20.0,
                    weight: FontWeight.w600,
                  ),
                  const SizedBox(width: 10),
                  TextWidget(
                    text: '10% off',
                    color: secondaryText,
                    size: 14.0,
                    weight: FontWeight.w600,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                text: 'Rating: ',
                color: primaryText,
                size: 14.0,
                weight: FontWeight.w500,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 15,
                  ),
                  const SizedBox(width: 4),
                  TextWidget(
                    text: '4.5',
                    color: secondaryText,
                    size: 14.0,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
