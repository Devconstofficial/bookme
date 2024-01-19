import 'package:bookme/constants/constants.dart';
import 'package:bookme/widgets/buttonWidget.dart';
import 'package:bookme/widgets/customAppbar.dart';
import 'package:bookme/widgets/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingPart1 extends StatefulWidget {
  const BookingPart1({super.key});

  @override
  State<BookingPart1> createState() => _BookingPart1State();
}

class _BookingPart1State extends State<BookingPart1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        text: "Book Service",
        leading: true,
        textsize: 18.0,
        textweight: FontWeight.w500,
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: ShapeDecoration(
                    color: kAppbarBg,
                    shape: OvalBorder(),
                  ),
                  child: Center(
                    child: TextWidget(
                      text: '01',
                      color: kAppbarText,
                      size: 16.0,
                      weight: FontWeight.w400,
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: ShapeDecoration(
                    color: Color(0xFFF6F7F9),
                    shape: OvalBorder(),
                  ),
                  child: Center(
                    child: TextWidget(
                      text: '02',
                      color: secondaryText,
                      size: 16.0,
                      weight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            TextWidget(
              text: 'Enter Detail Information',
              color: secondaryText,
              size: 18.0,
              weight: FontWeight.w500,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Color(0xFFF6F7F9),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Enter Date & Time",
                      hintStyle: GoogleFonts.workSans(
                        color: kTextfieldPText,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                      ),
                      prefixIcon: Icon(Icons.calendar_month),
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
                  SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    maxLines: 2,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Your Address",
                      hintStyle: GoogleFonts.workSans(
                        color: kTextfieldPText,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                      ),
                      prefixIcon: Icon(Icons.pin_drop_outlined),
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
            ),
            Spacer(),
            InkWell(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookPart2(),
                  ),
                )
              },
              child: ButtonWidget(text: "Next"),
            ),
          ],
        ),
      ),
    );
  }
}

class BookPart2 extends StatefulWidget {
  const BookPart2({super.key});

  @override
  State<BookPart2> createState() => _BookPart2State();
}

class _BookPart2State extends State<BookPart2> {
  int _quantity = 0; // Quantity of product

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        text: "Book Service",
        leading: true,
        textsize: 18.0,
        textweight: FontWeight.w500,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: ShapeDecoration(
                      color: Color(0xFFF6F7F9),
                      shape: OvalBorder(),
                    ),
                    child: Center(
                      child: TextWidget(
                        text: '01',
                        color: secondaryText,
                        size: 16.0,
                        weight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: ShapeDecoration(
                      color: kAppbarBg,
                      shape: OvalBorder(),
                    ),
                    child: Center(
                      child: TextWidget(
                        text: '02',
                        color: kAppbarText,
                        size: 16.0,
                        weight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.99,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                decoration: ShapeDecoration(
                  color: Color(0xFFF6F7F9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: 'Apartment Cleaning',
                            color: primaryText,
                            size: 16.0,
                            weight: FontWeight.w700,
                          ),
                          const SizedBox(height: 16),
                          Container(
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Icons.remove,
                                    size: 14,
                                    color: kAppbarBg,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (_quantity > 0) {
                                        _quantity--;
                                      }
                                    });
                                  },
                                ),
                                TextWidget(
                                  text: _quantity.toString(),
                                  color: secondaryText,
                                  size: 15.0,
                                  weight: FontWeight.w500,
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color: kAppbarBg,
                                    size: 14,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _quantity++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 39),
                    Expanded(
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://thumbor.forbes.com/thumbor/fit-in/900x510/https://www.forbes.com/advisor/wp-content/uploads/2022/02/How_To_Start_A_Cleaning_Business_-_article_image.jpg"),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextWidget(
                text: 'Price Details',
                color: primaryText,
                size: 16.0,
                weight: FontWeight.w700,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.99,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                decoration: BoxDecoration(
                    color: Color(0xFFF6F7F9),
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PriceRows(
                              text1: "Price",
                              text2: "₹112",
                              color: Color(0xFF6C757D),
                            ),
                            const SizedBox(height: 10),
                            const Divider(
                              color: Color(0xFFEBEBEB),
                              thickness: 1,
                              height: 1,
                            ),
                            const SizedBox(height: 10),
                            PriceRows(
                              text1: 'Sub Total',
                              text2: '₹120 * 2 = ₹240',
                              color: Color(0xFF6C757D),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              width: 295,
                              height: 1,
                              decoration:
                                  BoxDecoration(color: Color(0xFFEBEBEB)),
                            ),
                            const SizedBox(height: 10),
                            PriceRows(
                                text1: 'Discount (5% off)',
                                text2: '- ₹15.12',
                                color: Color(0xFF3BA859)),
                            const SizedBox(height: 10),
                            Container(
                              width: 295,
                              height: 1,
                              decoration:
                                  BoxDecoration(color: Color(0xFFEBEBEB)),
                            ),
                            const SizedBox(height: 10),
                            PriceRows(
                                text1: 'Date & Time',
                                text2: '28-07-23 | 12:30 pm',
                                color: Color(0xFFFA2F2F)),
                            const SizedBox(height: 10),
                            Container(
                              width: 295,
                              height: 1,
                              decoration:
                                  BoxDecoration(color: Color(0xFFEBEBEB)),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 295,
                                height: 1,
                                decoration:
                                    BoxDecoration(color: Color(0xFFEBEBEB)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 295,
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextWidget(
                                text: 'Total Amount',
                                color: Color(0xFF1C1F34),
                                size: 16.0,
                                weight: FontWeight.w600,
                              ),
                              TextWidget(
                                text: '₹255.12',
                                color: Color(0xFF5F60B9),
                                size: 16.0,
                                weight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  double screenHeight = MediaQuery.of(context).size.height;
                  double dialogHeight =
                      screenHeight * 0.55; // 50% of screen height

                  showDialog<String>(
                    useSafeArea: false,
                    context: context,
                    builder: (BuildContext context) => Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.white,
                      child: Container(
                        height: dialogHeight,
                        child: ConfirmBookingDialogue(),
                      ),
                    ),
                  );
                },
                child: ButtonWidget(text: "Book"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PriceRows extends StatelessWidget {
  const PriceRows(
      {super.key,
      required this.text1,
      required this.text2,
      required this.color});

  final text1;
  final text2;
  final color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(
            text: text1,
            color: primaryText,
            size: 14.0,
            weight: FontWeight.w500,
          ),
          TextWidget(
            text: text2,
            color: color,
            size: 14.0,
            weight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}

class ConfirmBookingDialogue extends StatelessWidget {
  const ConfirmBookingDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kAppbarText,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage("assets/icons/Check.png")),
          SizedBox(height: 30),
          TextWidget(
            text: "Confirm Booking?",
            color: primaryText,
            size: 22.0,
            weight: FontWeight.w700,
          ),
          SizedBox(height: 10),
          TextWidget(
            align: TextAlign.center,
            text: "Are you sure you want to confirm the booking",
            color: secondaryText,
            size: 14.0,
            weight: FontWeight.w500,
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => {Navigator.pop(context)},
                  child: TextWidget(
                    text: "Cancel",
                    color: primaryText,
                    size: 16.0,
                    weight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: InkWell(
                  onTap: () => {Navigator.pop(context)},
                  child: ButtonWidget(text: "Confirm"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
