import 'package:bookme/constants/constants.dart';
import 'package:bookme/screens/userviews/chats.dart';
import 'package:bookme/screens/userviews/home.dart';
import 'package:bookme/screens/userviews/profile.dart';
import 'package:bookme/screens/userviews/userbookings.dart';
import 'package:flutter/material.dart';

class BottomNavigationHolder extends StatefulWidget {
  const BottomNavigationHolder({super.key});

  @override
  State<BottomNavigationHolder> createState() => _BottomNavigationHolderState();
}

class _BottomNavigationHolderState extends State<BottomNavigationHolder> {
  int selectedIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const List<Widget> pages = <Widget>[
      HomeScreenUser(),
      UserBookingsScreen(),
      ChatsScreen(),
      UserProfileScreen(),
    ];

    return Scaffold(
      body: Center(
        child: pages.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 11,
        selectedFontSize: 11,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: kTextfieldBg,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
              size: 25,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month,
              size: 25,
            ),
            label: 'My Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_rounded,
              size: 25,
            ),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 25,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedIndex,
        unselectedItemColor: secondaryText,
        selectedItemColor: kAppbarBg,
        onTap: onItemTapped,
      ),
    );
  }
}
