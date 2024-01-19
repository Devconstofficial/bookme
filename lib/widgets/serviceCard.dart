import 'package:bookme/constants/constants.dart';
import 'package:bookme/screens/userviews/sellerprofile.dart';
import 'package:bookme/screens/userviews/singlechat.dart';
import 'package:bookme/widgets/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// ignore: must_be_immutable
class Servicecard extends StatelessWidget {
  Servicecard({super.key, 
    required this.image,
    required this.price,
    required this.rating,
    required this.title,
    required this.sellerName,
    required this.sellerimage,
    required this.user,
  });

  final image;
  final price;
  final title;
  final rating;
  final sellerName;
  final sellerimage;
  bool user;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 326,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 160,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 160,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(
                top: 24,
                left: 16,
                right: 9,
                bottom: 24,
              ),
              decoration: const ShapeDecoration(
                color: Color(0xFFF6F7F9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RatingBar.builder(
                            itemSize: 15,
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 12,
                            ),
                            ignoreGestures: true,
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          const SizedBox(width: 10),
                          TextWidget(
                            text: "4.3",
                            color: secondaryText,
                            size: 14.0,
                            weight: FontWeight.w700,
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      TextWidget(
                        text: title,
                        color: primaryText,
                        size: 16.0,
                        weight: FontWeight.w700,
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  user == true
                      ? Container(
                          child: Row(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(sellerimage),
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  InkWell(
                                    onTap: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const SellerProfileScreen(),
                                        ),
                                      )
                                    },
                                    child: TextWidget(
                                      text: sellerName,
                                      color: secondaryText,
                                      size: 14.0,
                                      weight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 90,
                              ),
                              Flexible(
                                child: InkWell(
                                  onTap: () => {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SingleChatScreen(),
                                      ),
                                    )
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 13, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: kAppbarBg,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: TextWidget(
                                      text: "Chat",
                                      color: kAppbarText,
                                      size: 12.0,
                                      weight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
          Positioned(
            left: 230,
            top: 145,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: ShapeDecoration(
                color: kAppbarBg,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 1.50,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    color: kAppbarText,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: TextWidget(
                  text: price,
                  color: kAppbarText,
                  size: 16.0,
                  weight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
