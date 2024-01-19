import 'package:bookme/constants/constants.dart';
import 'package:bookme/widgets/authTextField.dart';
import 'package:bookme/widgets/buttonWidget.dart';
import 'package:bookme/widgets/customAppbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  String imageUrl = '';

  List<String> countries = [
    'Country 1',
    'Country 2',
    'Country 3',
  ];

  String? _selectedCountry;

  File? _imageFile;

  @override
  void initState() {
    super.initState();

    fetchUserDataFromFirestore();
  }

  Future<void> fetchUserDataFromFirestore() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        String userUid = user.uid;

        final DocumentSnapshot userData = await FirebaseFirestore.instance
            .collection('editprofile')
            .doc(userUid)
            .get();

        if (userData.exists) {
          setState(() {
            _emailController.text = userData['email'];
            _usernameController.text = userData['username'];
            _numberController.text = userData['phoneNumber'];
            _selectedCountry = userData['country'];
            _addressController.text = userData['address'];
            imageUrl = userData['imageUrl'];
          });
        }
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }

  Future<void> uploadImageToFirebaseStorage() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        File imageFile = File(pickedFile.path);

        User? user = FirebaseAuth.instance.currentUser;

        if (user != null) {
          Reference storageReference = FirebaseStorage.instance
              .ref()
              .child('profile_images/${user.uid}.jpg');
          UploadTask uploadTask = storageReference.putFile(imageFile);
          await uploadTask.whenComplete(() async {
            String downloadURL = await storageReference.getDownloadURL();

            await FirebaseFirestore.instance
                .collection('editprofile')
                .doc(user.uid)
                .update({'profileImageURL': downloadURL});
          });

          setState(() {
            _imageFile = imageFile;
          });
        }
      }
    } catch (e) {
      print("Error uploading image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        text: "Edit Profile",
        leading: true,
        textsize: 18.0,
        textweight: FontWeight.w500,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 115,
                    width: 115,
                    child: Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.expand,
                      children: [
                        _imageFile != null
                            ? CircleAvatar(
                                radius: 50.0,
                                backgroundColor: Colors.grey[300],
                                backgroundImage: _imageFile != null
                                    ? FileImage(_imageFile!)
                                    : null)
                            : CircleAvatar(
                                radius: 50.0,
                                backgroundColor: Colors.grey[300],
                                backgroundImage: NetworkImage(imageUrl),
                              ),
                        Positioned(
                          right: -16,
                          bottom: 0,
                          child: SizedBox(
                            height: 46,
                            width: 46,
                            child: GestureDetector(
                              onTap: getImage,
                              child: Center(
                                  child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white),
                                child: const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Icon(
                                    Icons.add_a_photo,
                                    color: kAppbarBg,
                                  ),
                                ),
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
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
                  DropdownButtonFormField<String>(
                    value: _selectedCountry,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedCountry = newValue;
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
                      hintText: 'Choose a country',
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
                  const SizedBox(
                    height: 15,
                  ),
                  AuthTextField(
                    obsecureText: true,
                    text: "1901 Thornridge Cir. Shiloh, Hawaii",
                    controller: _addressController,
                    icon: true,
                    path: "assets/icons/Location.png",
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () async {
                      final url = await saveUserImageToFirestore(_imageFile);

                      saveUserDataToFirestore(url);
                    },
                    child: ButtonWidget(text: "Save"),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> saveUserDataToFirestore(imageUrl) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        String userUid = user.uid;

        await FirebaseFirestore.instance
            .collection('editprofile')
            .doc(userUid)
            .set({
          'email': _emailController.text,
          'username': _usernameController.text,
          'phoneNumber': _numberController.text,
          'country': _selectedCountry,
          'address': _addressController.text,
          'imageUrl': imageUrl,
        });
      } else {}
    } catch (e) {
      print("Error saving user data: $e");
    }
  }

  Future<String> saveUserImageToFirestore(image) async {
    String imageUrl = '';
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        String userUid = user.uid;

        var storage = await FirebaseStorage.instance
            .ref()
            .child('user_images')
            .child('${userUid}.jpg');
        await storage.putFile(image);
        await storage.getDownloadURL().then((value) {
          if (value != null) {
            imageUrl = value;
          }
        });
      } else {}
      return imageUrl;
    } catch (e) {
      print("Error saving user data: $e");

      return imageUrl;
    }
  }
}
