import 'package:bookme/constants/constants.dart';
import 'package:bookme/screens/businessviews/addservice.dart';
import 'package:bookme/screens/businessviews/dashboard.dart';
import 'package:bookme/screens/businessviews/mybookings.dart';
import 'package:bookme/screens/businessviews/profile.dart';
import 'package:bookme/screens/userviews/chats.dart';
import 'package:flutter/material.dart';

class BusinessBottomNavigationHolder extends StatefulWidget {
  const BusinessBottomNavigationHolder({super.key});

  @override
  State<BusinessBottomNavigationHolder> createState() =>
      _BusinessBottomNavigationHolderState();
}

class _BusinessBottomNavigationHolderState
    extends State<BusinessBottomNavigationHolder> {
  int selectedIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const List<Widget> pages = <Widget>[
      DashboardBusinessScreen(),
      MyBookingsScreen(),
      AddServiceScreen(),
      ChatsScreen(),
      ProfileScreen()
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
              icon: FloatingActionButton.small(
                  backgroundColor: kAppbarBg,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 14,
                  ),
                  onPressed: null),
              label: ''),
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
