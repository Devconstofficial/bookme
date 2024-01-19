import 'dart:async';
import 'package:bookme/constants/constants.dart';
import 'package:bookme/screens/login.dart';
import 'package:bookme/widgets/textWidget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 4),
      () => moveToNextScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppbarBg,
      body: Center(
          child: TextWidget(
        text: "Bookme",
        size: 33.0,
        weight: FontWeight.bold,
        color: kAppbarText,
      )),
    );
  }

  moveToNextScreen() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }
}
