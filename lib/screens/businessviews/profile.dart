import 'package:bookme/constants/constants.dart';
import 'package:bookme/screens/businessviews/allservices.dart';
import 'package:bookme/screens/login.dart';
import 'package:bookme/screens/userviews/changePassword.dart';
import 'package:bookme/screens/userviews/editprofile.dart';
import 'package:bookme/screens/userviews/myreviews.dart';
import 'package:bookme/widgets/buttonWidget.dart';
import 'package:bookme/widgets/textWidget.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // ignore: unused_field
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppbarBg,
        automaticallyImplyLeading: false,
        title: AppbarText(
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
                image: DecorationImage(
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
            SizedBox(
              height: 40,
            ),
            Center(
              child: CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.grey[300],
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80"),
              ),
            ),
            SizedBox(
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
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(color: Color(0xFFF6F7F9)),
              child: Text(
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
                    builder: (context) => EditProfileScreen(),
                  ),
                )
              },
              child: ProfileTile(icon: Icon(Icons.edit), text: "Edit Profile"),
            ),
            InkWell(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangePasswordScreen(),
                  ),
                )
              },
              child:
                  ProfileTile(icon: Icon(Icons.lock), text: "Change Password"),
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
              child: ProfileTile(
                  icon: Icon(Icons.calendar_month), text: "My Services"),
            ),
            InkWell(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyReviews(),
                  ),
                )
              },
              child: ProfileTile(icon: Icon(Icons.star), text: "My Reviews"),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(color: Color(0xFFF6F7F9)),
              child: Text(
                'ABOUT APP',
                style: TextStyle(
                  color: Color(0xFF009FD9),
                  fontSize: 12,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            InkWell(
                child: ProfileTile(
                    icon: Icon(Icons.policy), text: "Privacy Policy")),
            InkWell(
                child: ProfileTile(
                    icon: Icon(Icons.note), text: "Terms & Conditions")),
            InkWell(
                child:
                    ProfileTile(icon: Icon(Icons.app_shortcut), text: "About")),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                )
              },
              child: ButtonWidget(text: "Logout"),
            ),
            SizedBox(
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
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: secondaryText,
        ),
      ),
    );
  }
}
