import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haven_hub/Provider/MainProvider.dart';
import 'package:haven_hub/models/userModel.dart';
import 'package:provider/provider.dart';
import 'Home.dart';

class Receipt extends StatefulWidget {
  ResortAddingDetails hotel;
  Receipt({super.key, required this.hotel});
  @override
  State<Receipt> createState() => _ReceiptState();
}

class _ReceiptState extends State<Receipt> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF).withOpacity(1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.05),
        child: AppBar(
          title: Text(
            "Receipt",
            style: TextStyle(fontSize: 27, fontFamily: "jeju2"),
          ),
          centerTitle: true,
          backgroundColor: Color(0xffFFFFFF).withOpacity(1),
          leading: Padding(
            padding: EdgeInsets.only(left: width / 34.25),
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black.withOpacity(0.7)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: Consumer<MainProvider>(builder: (context, value, child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 23),
              Center(
                child: Container(
                  width: width * 0.89,
                  height: height * 0.15,
                  decoration: BoxDecoration(
                    color: Color(0xffFFFFFF).withOpacity(1),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 2,
                          color: CupertinoColors.inactiveGray.withOpacity(0.26),
                          blurRadius: 4,
                          offset: Offset(0, 3)),
                    ],
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only( left: 12),
                        child: Container(
                          height: height * 0.12,
                          width: width * 0.32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.red,
                          ),
                          child: Image.network(
                            widget.hotel.image,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            Text(
                              widget.hotel.name,
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xff070D30).withOpacity(1),
                                fontFamily: "jeju2",
                              ),
                            ),
                            SizedBox(height: 10),
                            Image.asset(
                              "assets/image/500 re.png",
                              scale: 3.56,
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  widget.hotel.price,
                                  style: TextStyle(
                                    fontSize: 29,
                                    fontFamily: "jeju2",
                                    color: Color(0xff070D30).withOpacity(1),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Night",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "jeju2",
                                    color: CupertinoColors.inactiveGray
                                        .withOpacity(0.80),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 17),
              Container(
                width: width * 0.89,
                height: height * 0.11,
                decoration: BoxDecoration(
                  color: Color(0xffFFFFFF).withOpacity(1),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 2,
                        color: CupertinoColors.inactiveGray.withOpacity(0.26),
                        blurRadius: 4,
                        offset: Offset(0, 3)),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Check In",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "jeju2",
                              color: Color(0xff070D30).withOpacity(1),
                            ),
                          ),
                          Text(
                            value.checkInDate,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "jeju2",
                              color: Color(0xff070D30).withOpacity(1),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Guest",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "jeju2",
                              color: Color(0xff070D30).withOpacity(1),
                            ),
                          ),
                          Text(
                            value.value.toString(),
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "jeju2",
                              color: Color(0xff070D30).withOpacity(1),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Check Out",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "jeju2",
                              color: Color(0xff070D30).withOpacity(1),
                            ),
                          ),
                          Text(
                            value.checkOutDate,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "jeju2",
                              color: Color(0xff070D30).withOpacity(1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 17),
              Container(
                width: width * 0.89,
                height: height * 0.22,
                decoration: BoxDecoration(
                  color: Color(0xffFFFFFF).withOpacity(1),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 2,
                        color: CupertinoColors.inactiveGray.withOpacity(0.26),
                        blurRadius: 4,
                        offset: Offset(0, 3)),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Amount ${value.duration} Days",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "jeju2",
                              color: Color(0xff070D30).withOpacity(1),
                            ),
                          ),
                          Text(
                            value.calculateTotalAmount(value.value,
                                value.duration, widget.hotel.price),
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: "jeju2",
                              color: Color(0xff070D30).withOpacity(1),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Tax",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "jeju2",
                              color: Color(0xff070D30).withOpacity(1),
                            ),
                          ),
                          Text(
                            "\$5",
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: "jeju2",
                              color: Color(0xff070D30).withOpacity(1),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "jeju2",
                              color: Color(0xff070D30).withOpacity(1),
                            ),
                          ),
                          Text(
                            value.includeTax(value.value, value.duration,
                                widget.hotel.price),
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: "jeju2",
                              color: Color(0xff070D30).withOpacity(1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 17),
              Container(
                width: width * 0.89,
                height: height * 0.15,
                decoration: BoxDecoration(

                  color: Color(0xffFFFFFF).withOpacity(1),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 2,
                      color: CupertinoColors.inactiveGray.withOpacity(0.26),
                      blurRadius: 4,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "jeju2",
                              color: Color(0xff070D30).withOpacity(1),
                            ),
                          ),
                          Spacer(),
                          Text(
                              value.firstnameController.text,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "jeju2",
                              color: Color(0xff070D30).withOpacity(1),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            "Number",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "jeju2",
                              color: Color(0xff070D30).withOpacity(1),
                            ),
                          ),
                          Spacer(),
                          Text(
                            value.phoneController.text,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "jeju2",
                              color: Color(0xff070D30).withOpacity(1),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            "Transaction id",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "jeju2",
                              color: Color(0xff070D30).withOpacity(1),
                            ),
                          ),
                          Spacer(),
                          Text(
                            "2345567878678",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "jeju2",
                              color: Color(0xff070D30).withOpacity(1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 17),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 14),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                            (Route<dynamic> route) => false,
                      );
                    },
                    child: Container(
                      width: width * 0.81,
                      height: height * 0.065,
                      decoration: BoxDecoration(
                        color: Color(0xff070D30).withOpacity(1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Return to home",
                          style: TextStyle(
                            fontFamily: "jeju2",
                            fontSize: 18,
                            color: Colors.white.withOpacity(1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
