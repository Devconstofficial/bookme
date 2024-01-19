import 'package:bookme/constants/constants.dart';
import 'package:bookme/widgets/customAppbar.dart';
import 'package:bookme/widgets/searchbar.dart';
import 'package:bookme/widgets/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AllServices extends StatefulWidget {
  const AllServices({Key? key});

  @override
  State<AllServices> createState() => _AllServicesState();
}

class _AllServicesState extends State<AllServices> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        text: "Services",
        leading: true,
        textsize: 18.0,
        textweight: FontWeight.w500,
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchbarWidget(
              controller: _searchController,
            ),
            SizedBox(height: 30),
            BusinessServiceCard(
              title: "Fixing Smart Devices",
              image:
                  "https://thumbor.forbes.com/thumbor/fit-in/900x510/https://www.forbes.com/advisor/wp-content/uploads/2022/02/How_To_Start_A_Cleaning_Business_-_article_image.jpg",
              price: "₹120",
              rating: "4.3",
            ),
            SizedBox(height: 35),
            BusinessServiceCard(
              title: "Fixing Smart Devices",
              image:
                  "https://thumbor.forbes.com/thumbor/fit-in/900x510/https://www.forbes.com/advisor/wp-content/uploads/2022/02/How_To_Start_A_Cleaning_Business_-_article_image.jpg",
              price: "₹120",
              rating: "4.3",
            ),
            SizedBox(height: 35),
            BusinessServiceCard(
              title: "Fixing Smart Devices",
              image:
                  "https://thumbor.forbes.com/thumbor/fit-in/900x510/https://www.forbes.com/advisor/wp-content/uploads/2022/02/How_To_Start_A_Cleaning_Business_-_article_image.jpg",
              price: "₹120",
              rating: "4.3",
            ),
          ],
        ),
      ),
    );
  }
}

class BusinessServiceCard extends StatelessWidget {
  const BusinessServiceCard({
    Key? key,
    required this.title,
    required this.image,
    required this.price,
    required this.rating,
  });

  final title;
  final image;
  final price;
  final rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Image(
              width: MediaQuery.of(context).size.width * 0.35,
              image: NetworkImage(image),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: kAppbarBg,
                  borderRadius: BorderRadius.circular(70),
                ),
                child: TextWidget(
                  text: price,
                  color: kAppbarText,
                  size: 12.0,
                  weight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: RatingBar.builder(
                      itemSize: 15,
                      initialRating: 3,
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
                      ignoreGestures: true,
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextWidget(
                      text: rating,
                      color: secondaryText,
                      size: 14.0,
                      weight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              TextWidget(
                text: title,
                color: primaryText,
                size: 16.0,
                weight: FontWeight.w700,
              ),
              SizedBox(height: 10),
              Buttons(),
            ],
          ),
        ),
      ],
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({Key? key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: kTextfieldBg,
            borderRadius: BorderRadius.circular(50),
          ),
          child: TextWidget(
            text: "Edit",
            color: primaryText,
            size: 12.0,
            weight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(50),
          ),
          child: TextWidget(
            text: "Delete",
            color: kAppbarText,
            size: 12.0,
            weight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
