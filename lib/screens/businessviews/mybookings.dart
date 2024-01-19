import 'package:bookme/constants/constants.dart';
import 'package:bookme/screens/businessviews/bookingsummary.dart';
import 'package:bookme/widgets/bookingCard.dart';
import 'package:bookme/widgets/buttonWidget.dart';
import 'package:bookme/widgets/customAppbar.dart';
import 'package:bookme/widgets/textWidget.dart';
import 'package:flutter/material.dart';

class MyBookingsScreen extends StatefulWidget {
  const MyBookingsScreen({super.key});

  @override
  State<MyBookingsScreen> createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final PageController controller = PageController();
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: CustomAppbar(
          text: "Your Bookings",
          leading: true,
          textsize: 18.0,
          textweight: FontWeight.w500,
        ),
        body: Column(
          children: [
            TabBar(
              indicatorColor: kAppbarBg,
              unselectedLabelColor: secondaryText,
              tabs: [
                Tab(text: 'Pending'),
                Tab(text: 'Completed'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // The contents of the "Past" tab
                  PendingBookings(),
                  // The contents of the "Upcoming" tab
                  Center(child: CompletedBookings()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PendingBookings extends StatefulWidget {
  const PendingBookings({super.key});

  @override
  State<PendingBookings> createState() => _PendingBookingsState();
}

class _PendingBookingsState extends State<PendingBookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: [
              Center(
                child: BookingCard(
                  title: "Apartment Cleaning",
                  orderId: "#123",
                  price: "₹124.45",
                  discount: '(5% off)',
                  date: '25 Jan, 2022',
                  time: '12:30 PM',
                  provider: 'Kristin Watson',
                  imagePath:
                      "https://thumbor.forbes.com/thumbor/fit-in/900x510/https://www.forbes.com/advisor/wp-content/uploads/2022/02/How_To_Start_A_Cleaning_Business_-_article_image.jpg",
                ),
              ),
              SizedBox(
                height: 25,
              ),
              BookingButtons(),
              SizedBox(
                height: 35,
              ),
              BookingCard(
                title: "Apartment Cleaning",
                orderId: "#123",
                price: "₹124.45",
                discount: '(5% off)',
                date: '25 Jan, 2022',
                time: '12:30 PM',
                provider: 'Kristin Watson',
                imagePath:
                    "https://thumbor.forbes.com/thumbor/fit-in/900x510/https://www.forbes.com/advisor/wp-content/uploads/2022/02/How_To_Start_A_Cleaning_Business_-_article_image.jpg",
              ),
              SizedBox(
                height: 25,
              ),
              BookingButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

class CompletedBookings extends StatefulWidget {
  const CompletedBookings({super.key});

  @override
  State<CompletedBookings> createState() => _CompletedBookingsState();
}

class _CompletedBookingsState extends State<CompletedBookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: [
              Center(
                child: BookingCard(
                  title: "Apartment Cleaning",
                  orderId: "#123",
                  price: "₹124.45",
                  discount: '(5% off)',
                  date: '25 Jan, 2022',
                  time: '12:30 PM',
                  provider: 'Kristin Watson',
                  imagePath:
                      "https://thumbor.forbes.com/thumbor/fit-in/900x510/https://www.forbes.com/advisor/wp-content/uploads/2022/02/How_To_Start_A_Cleaning_Business_-_article_image.jpg",
                ),
              ),
              SizedBox(
                height: 35,
              ),
              BookingCard(
                title: "Apartment Cleaning",
                orderId: "#123",
                price: "₹124.45",
                discount: '(5% off)',
                date: '25 Jan, 2022',
                time: '12:30 PM',
                provider: 'Kristin Watson',
                imagePath:
                    "https://thumbor.forbes.com/thumbor/fit-in/900x510/https://www.forbes.com/advisor/wp-content/uploads/2022/02/How_To_Start_A_Cleaning_Business_-_article_image.jpg",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookingButtons extends StatelessWidget {
  const BookingButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              double screenHeight = MediaQuery.of(context).size.height;
              double dialogHeight = screenHeight * 0.65; // 50% of screen height

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
                    child: BookingSummary(),
                  ),
                ),
              );
            },
            child: ButtonWidget(text: "Accept"),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: Container(
            width: 327,
            height: 48,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            decoration: BoxDecoration(
              color: Color(0xFFF6F7F9),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: TextWidget(
                text: "Decline",
                color: primaryText,
                size: 12.0,
                weight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
