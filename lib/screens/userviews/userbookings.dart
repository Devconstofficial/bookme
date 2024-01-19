import 'package:bookme/constants/constants.dart';
import 'package:bookme/widgets/bookingCard.dart';
import 'package:bookme/widgets/customAppbar.dart';
import 'package:flutter/material.dart';

class UserBookingsScreen extends StatefulWidget {
  const UserBookingsScreen({super.key});

  @override
  State<UserBookingsScreen> createState() => _UserBookingsScreenState();
}

class _UserBookingsScreenState extends State<UserBookingsScreen> {
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
        body: const Column(
          children: [
            TabBar(
              indicatorColor: kAppbarBg,
              unselectedLabelColor: secondaryText,
              tabs: [
                Tab(text: 'Past'),
                Tab(text: 'Upcoming'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // The contents of the "Past" tab
                  PastBookings(),
                  // The contents of the "Upcoming" tab
                  UpcomingBooings(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PastBookings extends StatefulWidget {
  const PastBookings({super.key});

  @override
  State<PastBookings> createState() => _PastBookingsState();
}

class _PastBookingsState extends State<PastBookings> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
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

class UpcomingBooings extends StatefulWidget {
  const UpcomingBooings({super.key});

  @override
  State<UpcomingBooings> createState() => _UpcomingBooingsState();
}

class _UpcomingBooingsState extends State<UpcomingBooings> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
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
