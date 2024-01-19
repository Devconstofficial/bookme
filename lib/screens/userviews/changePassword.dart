import 'package:bookme/constants/constants.dart';
import 'package:bookme/widgets/authTextField.dart';
import 'package:bookme/widgets/buttonWidget.dart';
import 'package:bookme/widgets/customAppbar.dart';
import 'package:bookme/widgets/textWidget.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController _newpasswordController = TextEditingController();
  TextEditingController _confirmpasswordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        text: "Change Password",
        leading: true,
        textsize: 18.0,
        textweight: FontWeight.w500,
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextWidget(
              text:
                  "Your new password must be different from previous used password",
              color: secondaryText,
              size: 14.0,
              weight: FontWeight.w500,
            ),
            SizedBox(
              height: 30,
            ),
            AuthTextField(
              obsecureText: _obscureText, // Use the state variable here
              text: "New Password",
              controller: _newpasswordController,
              icon: true,
              path: _obscureText
                  ? "assets/icons/Hide.png"
                  : "assets/icons/Show.png",
              // Change the icon based on _obscureText
              onTapIcon: () {
                setState(() {
                  _obscureText = !_obscureText; // Toggle password visibility
                });
              },
            ),
            SizedBox(
              height: 15,
            ),
            AuthTextField(
              obsecureText: _obscureText, // Use the state variable here
              text: "Re-Type Password",
              controller: _confirmpasswordController,
              icon: true,
              path: _obscureText
                  ? "assets/icons/Hide.png"
                  : "assets/icons/Show.png",
              // Change the icon based on _obscureText
              onTapIcon: () {
                setState(() {
                  _obscureText = !_obscureText; // Toggle password visibility
                });
              },
            ),
            Spacer(),
            InkWell(
              child: ButtonWidget(text: "Save"),
            ),
          ],
        ),
      ),
    );
  }
}
