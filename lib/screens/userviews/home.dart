import 'package:bookme/constants/constants.dart';
import 'package:bookme/screens/singleservice.dart';
import 'package:bookme/screens/userviews/allcategories.dart';
import 'package:bookme/screens/userviews/singlecategory.dart';
import 'package:bookme/widgets/categorycard.dart';
import 'package:bookme/widgets/searchbar.dart';
import 'package:bookme/widgets/serviceCard.dart';
import 'package:bookme/widgets/textWidget.dart';
import 'package:flutter/material.dart';

class HomeScreenUser extends StatefulWidget {
  const HomeScreenUser({super.key});

  @override
  State<HomeScreenUser> createState() => _HomeScreenUserState();
}

class _HomeScreenUserState extends State<HomeScreenUser> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppbarBg,
        automaticallyImplyLeading: false,
        title: AppbarText(
          text: "James Butler",
          color: kAppbarText,
          size: 20.0,
          weight: FontWeight.w700,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: Container(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80"),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: SearchbarWidget(
                      controller: _searchController,
                    ),
                  ),
                  SizedBox(width: 15),
                  Container(
                    width: 48,
                    height: 48,
                    padding: const EdgeInsets.all(12),
                    decoration: ShapeDecoration(
                      color: kAppbarBg,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Icon(
                      Icons.filter_list,
                      color: kAppbarText,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: "Category",
                    color: primaryText,
                    size: 18.0,
                    weight: FontWeight.w500,
                  ),
                  InkWell(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllCategories(),
                        ),
                      )
                    },
                    child: TextWidget(
                      text: "View All",
                      color: kTextfieldPText,
                      size: 14.0,
                      weight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SingleCategory()),
                      ),
                    },
                    child: CategoryCard(
                      text: "Plumber",
                      icon: "assets/icons/plumber.png",
                    ),
                  ),
                  CategoryCard(
                    text: "Plumber",
                    icon: "assets/icons/plumber.png",
                  ),
                  CategoryCard(
                    text: "Plumber",
                    icon: "assets/icons/plumber.png",
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryCard(
                    text: "Plumber",
                    icon: "assets/icons/plumber.png",
                  ),
                  CategoryCard(
                    text: "Plumber",
                    icon: "assets/icons/plumber.png",
                  ),
                  CategoryCard(
                    text: "Plumber",
                    icon: "assets/icons/plumber.png",
                  ),
                ],
              ),
              SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: "Featured",
                    color: primaryText,
                    size: 18.0,
                    weight: FontWeight.w500,
                  ),
                  TextWidget(
                    text: "View All",
                    color: kTextfieldPText,
                    size: 14.0,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
              SizedBox(height: 25),
              InkWell(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SingleServiceScreen(),
                    ),
                  )
                },
                child: Servicecard(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
