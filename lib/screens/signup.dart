// ignore_for_file: use_build_context_synchronously

import 'package:bookme/constants/constants.dart';
import 'package:bookme/screens/login.dart';
import 'package:bookme/widgets/authTextField.dart';
import 'package:bookme/widgets/buttonWidget.dart';
import 'package:bookme/widgets/textWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  String _error = '';

  bool isEmailValid(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  Future<void> _handleSignup(BuildContext context, String? selectedRole) async {
    setState(() {
      _error = '';
    });

    try {
      final String email = _emailController.text.trim();
      final String password = _passwordController.text;
      final String username = _usernameController.text.trim();
      final String phoneNumber = _numberController.text.trim();

      if (!_isValidPassword(password) ||
          !isEmailValid(email) ||
          username.isEmpty ||
          phoneNumber.isEmpty ||
          selectedRole == null) {
        setState(() {
          _error = 'Please fill in all fields correctly';
        });
        return;
      }

      final UserCredential authResult =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firestore.collection('users').doc(authResult.user!.uid).set({
        'email': email,
        'type': selectedRole,
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
      print("Registration error: $_error");
    }
  }

  bool _isValidPassword(String password) {
    return password.length >= 8;
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _numberController.dispose();
    _usernameController.dispose();
  }

  List<String> countries = [
    'Customer',
    'Service Provider',
  ];

  String? _selectedRole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 70,
                left: 24,
                bottom: 32,
              ),
              width: double.infinity,
              decoration: const BoxDecoration(color: kAppbarBg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: "SignUp",
                    color: kAppbarText,
                    size: 33.0,
                    weight: FontWeight.w700,
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    children: [
                      TextWidget(
                        text: "Already have an account? ",
                        color: kAppbarText,
                        size: 15.0,
                        weight: FontWeight.w400,
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
                        child: TextWidget(
                          text: "Login",
                          color: kAppbarText,
                          size: 15.0,
                          weight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                children: [
                  AuthTextField(
                    obsecureText: false,
                    text: "Username",
                    controller: _usernameController,
                    icon: true,
                    path: "assets/icons/Profile.png",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AuthTextField(
                    obsecureText: false,
                    text: "Email",
                    controller: _emailController,
                    icon: true,
                    path: "assets/icons/Message.png",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AuthTextField(
                    obsecureText: false,
                    text: "Contact Number",
                    controller: _numberController,
                    icon: true,
                    path: "assets/icons/Calling.png",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AuthTextField(
                    obsecureText: true,
                    text: "Password",
                    controller: _passwordController,
                    icon: true,
                    path: "assets/icons/Hide.png",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DropdownButtonFormField<String>(
                    value: _selectedRole,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedRole = newValue;
                      });
                    },
                    items: countries.map((String country) {
                      return DropdownMenuItem<String>(
                        value: country,
                        child: Text(
                          country,
                          style: GoogleFonts.workSans(
                            color: kTextfieldPText,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: kTextfieldBg,
                      hintText: 'Select user role',
                      hintStyle: GoogleFonts.workSans(
                        color: kTextfieldPText,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: kTextfieldBorder,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: kTextfieldBorder,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: kTextfieldBorder,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          _error,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      _handleSignup(context, _selectedRole!);
                    },
                    child: ButtonWidget(text: "SignUp"),
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: TextWidget(
                      text: "Or signup using",
                      color: primaryText,
                      size: 14.0,
                      weight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        child: SizedBox(
                          width: 91,
                          height: 75,
                          child: Column(
                            children: [
                              Image.asset("assets/icons/Google.png"),
                              TextWidget(
                                text: "Google",
                                color: primaryText,
                                size: 12.0,
                                weight: FontWeight.w700,
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        child: SizedBox(
                          width: 91,
                          height: 75,
                          child: Column(
                            children: [
                              Image.asset("assets/icons/Facebook.png"),
                              TextWidget(
                                text: "Facebook",
                                color: primaryText,
                                size: 12.0,
                                weight: FontWeight.w700,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
