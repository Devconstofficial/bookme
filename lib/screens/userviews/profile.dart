import 'package:bookme/constants/constants.dart';
import 'package:bookme/screens/login.dart';
import 'package:bookme/screens/userviews/changePassword.dart';
import 'package:bookme/screens/userviews/editprofile.dart';
import 'package:bookme/screens/userviews/myreviews.dart';
import 'package:bookme/screens/userviews/userbookings.dart';
import 'package:bookme/widgets/buttonWidget.dart';
import 'package:bookme/widgets/textWidget.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  // ignore: unused_field
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppbarBg,
        automaticallyImplyLeading: false,
        title: const AppbarText(
          text: "Profile",
          color: kAppbarText,
          size: 20.0,
          weight: FontWeight.w600,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: Container(
              width: 44,
              height: 44,
              decoration: ShapeDecoration(
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80"),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Center(
              child: CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.grey[300],
                backgroundImage: const NetworkImage(
                    "https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextWidget(
              text: "Ashutosh Pandey",
              size: 22.0,
              weight: FontWeight.w500,
              color: primaryText,
            ),
            TextWidget(
              text: "Ashutosh@gmail.com",
              size: 15.0,
              weight: FontWeight.w500,
              color: secondaryText,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: const BoxDecoration(color: Color(0xFFF6F7F9)),
              child: const Text(
                'GENERAL',
                style: TextStyle(
                  color: Color(0xFF009FD9),
                  fontSize: 12,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            InkWell(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditProfileScreen(),
                  ),
                )
              },
              child: const ProfileTile(
                  icon: Icon(Icons.edit), text: "Edit Profile"),
            ),
            InkWell(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChangePasswordScreen(),
                  ),
                )
              },
              child: const ProfileTile(
                  icon: Icon(Icons.lock), text: "Change Password"),
            ),
            InkWell(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserBookingsScreen(),
                  ),
                )
              },
              child: const ProfileTile(
                  icon: Icon(Icons.calendar_month), text: "Your Bookings"),
            ),
            InkWell(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyReviews(),
                  ),
                )
              },
              child:
                  const ProfileTile(icon: Icon(Icons.star), text: "My Reviews"),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: const BoxDecoration(color: Color(0xFFF6F7F9)),
              child: const Text(
                'ABOUT APP',
                style: TextStyle(
                  color: Color(0xFF009FD9),
                  fontSize: 12,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const InkWell(
                child: ProfileTile(
                    icon: Icon(Icons.policy), text: "Privacy Policy")),
            const InkWell(
                child: ProfileTile(
                    icon: Icon(Icons.note), text: "Terms & Conditions")),
            const InkWell(
                child:
                    ProfileTile(icon: Icon(Icons.app_shortcut), text: "About")),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                )
              },
              child: ButtonWidget(text: "Logout"),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({required this.icon, required this.text});

  final icon;
  final text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: icon,
        iconColor: secondaryText,
        title: TextWidget(
          text: text,
          color: primaryText,
          weight: FontWeight.w500,
          size: 14.0,
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: secondaryText,
        ),
      ),
    );
  }
}
