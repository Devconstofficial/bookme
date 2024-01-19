import 'package:flutter/material.dart';
import 'package:bookme/widgets/categorycard.dart';
import 'package:bookme/widgets/customAppbar.dart';
import 'package:bookme/widgets/searchbar.dart';

class AllCategories extends StatefulWidget {
  const AllCategories({Key? key}) : super(key: key);

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        text: "Categories",
        leading: true,
        textsize: 18.0,
        textweight: FontWeight.w500,
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          children: [
            SearchbarWidget(
              controller: _searchController,
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: 20,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0),
                itemBuilder: (BuildContext context, int index) {
                  return CategoryCard(
                    text: "Plumber",
                    icon: "assets/icons/plumber.png",
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
