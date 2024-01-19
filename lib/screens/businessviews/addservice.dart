import 'package:bookme/constants/constants.dart';
import 'package:bookme/widgets/authTextField.dart';
import 'package:bookme/widgets/buttonWidget.dart';
import 'package:bookme/widgets/customAppbar.dart';
import 'package:bookme/widgets/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddServiceScreen extends StatefulWidget {
  const AddServiceScreen({super.key});

  @override
  State<AddServiceScreen> createState() => _AddServiceScreenState();
}

class _AddServiceScreenState extends State<AddServiceScreen> {
  TextEditingController _title = TextEditingController();
  TextEditingController _price = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _minutes = TextEditingController();
  TextEditingController _hours = TextEditingController();
  TextEditingController _location = TextEditingController();
  TextEditingController _discount = TextEditingController();

  // ignore: unused_field
  File? _imageFile;

  List<String> category = [
    'Cat 1',
    'Cat 2',
  ];

  String? _category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        text: "Add Service",
        leading: false,
        textsize: 18.0,
        textweight: FontWeight.w500,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: [
              InkWell(
                onTap: getImage,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 130,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 0.75,
                        strokeAlign: BorderSide.strokeAlignOutside,
                        color: kAppbarBg,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image_outlined,
                        color: secondaryText,
                        size: 28,
                      ),
                      SizedBox(height: 10),
                      TextWidget(
                        text: "Choose Image",
                        size: 16.0,
                        weight: FontWeight.w500,
                        color: primaryText,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextWidget(
                text: "Support : JPG , PNG, JPEG",
                size: 12.0,
                weight: FontWeight.w500,
                color: secondaryText,
              ),
              SizedBox(height: 30),
              Column(
                children: [
                  AuthTextField(
                    obsecureText: false,
                    text: "Service Title",
                    controller: _title,
                    icon: false,
                  ),
                  SizedBox(height: 15),
                  DropdownButtonFormField<String>(
                    value: _category,
                    onChanged: (String? newValue) {
                      setState(() {
                        _category = newValue;
                      });
                    },
                    items: category.map((String country) {
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
                      hintText: 'Select Category',
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
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    ),
                  ),
                  SizedBox(height: 15),
                  AuthTextField(
                    obsecureText: false,
                    text: "Enter Location",
                    controller: _location,
                    icon: false,
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: AuthTextField(
                          obsecureText: false,
                          text: "Price",
                          controller: _price,
                          icon: false,
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: AuthTextField(
                          obsecureText: false,
                          text: "Discount",
                          controller: _discount,
                          icon: false,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: AuthTextField(
                          obsecureText: false,
                          text: "Duration Hours",
                          controller: _hours,
                          icon: false,
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: AuthTextField(
                          obsecureText: false,
                          text: "Duration Minutes",
                          controller: _minutes,
                          icon: false,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: _description,
                    maxLines: 3,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: kTextfieldBg,
                      hintText: "Description",
                      hintStyle: GoogleFonts.workSans(
                        color: kTextfieldPText,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                      //Borders of textfield
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
                    ),
                  ),
                ],
              ),
              SizedBox(height: 35),
              ButtonWidget(text: "Add Service")
            ],
          ),
        ),
      ),
    );
  }

  Future getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
        source: ImageSource.gallery); // Use ImageSource.camera for the camera.

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }
}
