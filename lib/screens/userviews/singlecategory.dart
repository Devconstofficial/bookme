import 'package:bookme/constants/constants.dart';
import 'package:bookme/widgets/customAppbar.dart';
import 'package:bookme/widgets/searchbar.dart';
import 'package:bookme/widgets/serviceCard.dart';
import 'package:flutter/material.dart';

class SingleCategory extends StatefulWidget {
  const SingleCategory({super.key});

  @override
  State<SingleCategory> createState() => _SingleCategoryState();
}

class _SingleCategoryState extends State<SingleCategory> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        text: "Smart Home",
        leading: true,
        textsize: 18.0,
        textweight: FontWeight.w500,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
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
            SizedBox(height: 40),
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
            SizedBox(height: 30),
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
      )),
    );
  }
}
