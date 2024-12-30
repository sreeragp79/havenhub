import 'package:flutter/material.dart';
import 'package:haven_hub/Provider/MainProvider.dart';
import 'package:haven_hub/models/userModel.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'Confirm Pay.dart';

class Book extends StatefulWidget {
  final ResortAddingDetails hotel;
  Book({super.key, required this.hotel});

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  TextEditingController checkOut = TextEditingController();
  TextEditingController checkIn = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Fixed dimensions for the target screen size
    const double fixedWidth = 411.0;
    const double fixedHeight = 890.0;

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF).withOpacity(1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0), // Fixed height for app bar
        child: AppBar(
          title: Text(
            "Book Now",
            style: TextStyle(fontSize: 27, fontFamily: "jeju2"),
          ),
          centerTitle: true,
          backgroundColor: Color(0xffFFFFFF).withOpacity(1),
          leading: Padding(
            padding: EdgeInsets.only(left: 15.0), // Fixed padding
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black.withOpacity(0.7)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: Consumer<MainProvider>(
          builder: (context, date, child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 80),
                        child: Text(
                          "Check In",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "jeju2",
                          ),
                        ),
                      ),
                      Text(
                        "Check Out",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "jeju2",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: fixedWidth * 0.37, // Fixed width
                        margin: EdgeInsets.symmetric(vertical: 15),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Select Date",
                            hintStyle: TextStyle(color: Colors.grey.withOpacity(0.89)),
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.10),
                            contentPadding: EdgeInsets.symmetric(vertical: 21, horizontal: 30),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(45),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(45),
                              borderSide: BorderSide.none,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () async {
                                final DateTime? date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2025),
                                );
                                final format = DateFormat("dd-MM-yyyy").format(date!);
                                setState(() {
                                  checkIn.text = format;
                                });
                              },
                              icon: Icon(Icons.date_range, color: Colors.black),
                            ),
                          ),
                          readOnly: true,
                          controller: checkIn,
                        ),
                      ),
                      SizedBox(width: 17),
                      Container(
                        width: fixedWidth * 0.37, // Fixed width
                        margin: EdgeInsets.symmetric(vertical: 15),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Select Date",
                            hintStyle: TextStyle(color: Colors.grey.withOpacity(0.89)),
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.10),
                            contentPadding: EdgeInsets.symmetric(vertical: 21, horizontal: 30),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(45),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(45),
                              borderSide: BorderSide.none,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () async {
                                final DateTime? date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2025),
                                );
                                final format = DateFormat("dd-MM-yyyy").format(date!);
                                setState(() {
                                  checkOut.text = format;
                                });
                              },
                              icon: Icon(Icons.date_range, color: Colors.black),
                            ),
                          ),
                          controller: checkOut,
                          readOnly: true,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Container(
                    width: fixedWidth * 0.80, // Fixed width
                    height: 50.0, // Fixed height for button
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xff061673).withOpacity(1),
                      ),
                      onPressed: () {
                        date.getDateDuration(checkIn.text, checkOut.text);
                        date.bookDate(checkIn.text, checkOut.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConfirmPay(hotel: widget.hotel),
                          ),
                        );
                      },
                      child: Text(
                        "Continue",
                        style: TextStyle(
                            fontFamily: "jeju2", fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}
