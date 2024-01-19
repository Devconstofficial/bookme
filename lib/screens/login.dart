// ignore_for_file: use_build_context_synchronously

import 'package:bookme/constants/constants.dart';
import 'package:bookme/screens/businessviews/bottomBar.dart';
import 'package:bookme/screens/signup.dart';
import 'package:bookme/screens/userviews/bottomBar.dart';
import 'package:bookme/widgets/authTextField.dart';
import 'package:bookme/widgets/buttonWidget.dart';
import 'package:bookme/widgets/textWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _error = '';

  Future<void> _handleLogin(BuildContext context) async {
    setState(() {
      _error = ''; 
    });

    try {
      final String email = _emailController.text.trim();
      final String password = _passwordController.text;

     

      if (email.isEmpty || password.isEmpty) {
        setState(() {
          _error = 'Email and password are required';
        });
        return;
      }

      final UserCredential authResult = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (authResult.user == null) {
        setState(() {
          _error = 'Invalid email or password';
        });
      } else {
        var data = await FirebaseFirestore.instance
            .collection('users')
            .doc(authResult.user!.uid)
            .get();

        print("Logged In User Data" + data['email']);

        if (data['type'] == 'Service Provider') {
          
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomNavigationHolder(),
            ),
          );
        } else {
          
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BusinessBottomNavigationHolder(),
            ),
          );
        }
      }
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
      print("Login error: $_error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              TextWidget(
                text: "Welcome Back!",
                color: primaryText,
                size: 33.0,
                weight: FontWeight.w700,
              ),
              const SizedBox(height: 10),
              Wrap(
                children: [
                  TextWidget(
                    text: "Don’t have an account? ",
                    color: primaryText,
                    size: 15.0,
                    weight: FontWeight.w400,
                  ),
                  InkWell(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupScreen(),
                        ),
                      )
                    },
                    child: TextWidget(
                      text: "SignUp",
                      color: kAppbarBg,
                      size: 15.0,
                      weight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 100),
              AuthTextField(
                obsecureText: false,
                text: "Email",
                controller: _emailController,
                icon: true,
                path: "assets/icons/Message.png",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 2),
                child: Text(
                  _error,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.red,
                  ),
                ),
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
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () => {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          padding: const EdgeInsets.only(
                              top: 10, left: 22, bottom: 0, right: 22),
                          child: const ForgetPassword(),
                        );
                      },
                    )
                  },
                  child: TextWidget(
                    text: "Forget Password?",
                    color: kAppbarBg,
                    size: 12.0,
                    weight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 100),
              InkWell(
                onTap: () {
                  _handleLogin(context);
                },
                child: ButtonWidget(text: "Login"),
              ),
              const SizedBox(height: 40),
              Center(
                child: TextWidget(
                  text: "Or login using",
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
        ),
      ),
    );
  }
}

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 70,
                height: 4,
                decoration: ShapeDecoration(
                  color: const Color(0xFF1C1C28),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextWidget(
              text: "Forget Password",
              color: primaryText,
              size: 25.0,
              weight: FontWeight.w700,
            ),
            const SizedBox(
              height: 20,
            ),
            AuthTextField(
              obsecureText: false,
              text: "Email",
              controller: _emailController,
              icon: true,
              path: "assets/icons/Message.png",
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              child: ButtonWidget(text: "Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
