import 'package:bookme/constants/constants.dart';
import 'package:bookme/screens/businessviews/allservices.dart';
import 'package:bookme/widgets/serviceCard.dart';
import 'package:bookme/widgets/textWidget.dart';
import 'package:flutter/material.dart';

class DashboardBusinessScreen extends StatefulWidget {
  const DashboardBusinessScreen({super.key});

  @override
  State<DashboardBusinessScreen> createState() =>
      _DashboardBusinessScreenState();
}

class _DashboardBusinessScreenState extends State<DashboardBusinessScreen> {
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
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Color(0xffF6F7F9),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          children: [
                            TextWidget(
                              text: "Commision Type : ",
                              color: secondaryText,
                              size: 14.0,
                              weight: FontWeight.w500,
                            ),
                            TextWidget(
                              text: "Admin",
                              color: primaryText,
                              size: 14.0,
                              weight: FontWeight.w500,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Wrap(
                          children: [
                            TextWidget(
                              text: 'My Commision :',
                              color: secondaryText,
                              size: 14.0,
                              weight: FontWeight.w500,
                            ),
                            TextWidget(
                              text: "₹20 (fixed)",
                              color: primaryText,
                              size: 14.0,
                              weight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: kAppbarBg,
                          borderRadius: BorderRadius.circular(100)),
                      child: Icon(
                        Icons.discount,
                        color: kAppbarText,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: DashboardCard(
                          number: "96",
                          title: "Total Bookings",
                          icon: Icons.calendar_month,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: DashboardCard(
                          number: "15",
                          title: "Total Service",
                          icon: Icons.miscellaneous_services,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: DashboardCard(
                          number: "36",
                          title: "Total Chats",
                          icon: Icons.chat_bubble,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: DashboardCard(
                          number: "₹150",
                          title: "Total Earnings",
                          icon: Icons.money,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: "Services",
                    color: primaryText,
                    size: 18.0,
                    weight: FontWeight.w500,
                  ),
                  InkWell(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllServices(),
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
              SizedBox(height: 15),
              Servicecard(
                image:
                    "https://thumbor.forbes.com/thumbor/fit-in/900x510/https://www.forbes.com/advisor/wp-content/uploads/2022/02/How_To_Start_A_Cleaning_Business_-_article_image.jpg",
                price: "₹120",
                rating: "4.3",
                title: "Painting for beautiful Homes",
                sellerName: "Devon Lee",
                sellerimage:
                    "https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80",
                user: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  const DashboardCard(
      {super.key,
      required this.number,
      required this.title,
      required this.icon});

  final number;
  final title;
  final icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.50, color: Color(0xFFEBEBEB)),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: number,
                color: kAppbarBg,
                size: 22.0,
                weight: FontWeight.w700,
              ),
              TextWidget(
                text: title,
                color: secondaryText,
                size: 12.0,
                weight: FontWeight.w500,
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Color(0xffF6F7F9),
                  borderRadius: BorderRadius.circular(100)),
              child: Icon(
                icon,
                color: kAppbarBg,
                size: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
