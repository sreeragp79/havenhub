import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../user/Home.dart';



class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _ReceiptState();
}

class _ReceiptState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF).withOpacity(1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height* 0.05),
        child: AppBar(
          title: Text(
            "User",
            style: TextStyle(fontSize: 27, fontFamily: "jeju2"),
          ),
          centerTitle: true,
          backgroundColor: Color(0xffFFFFFF).withOpacity(1),
          leading: Padding(
            padding: EdgeInsets.only(left: width/34.25),
            child: IconButton(
              icon: Icon(Icons.arrow_back,
                  color: Colors.black
                      .withOpacity(0.7)), // Specify icon and color
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 23,
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                    width: width * 0.89,
                    height: height * 0.15,
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF).withOpacity(1),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            color: CupertinoColors.inactiveGray
                                .withOpacity(0.26),
                            blurRadius: 4,
                            offset: Offset(0, 3)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 13, left: 12),
                    child: Container(
                      height: height * 0.12,
                      width: width * 0.32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.red,
                      ),
                      child: Image.asset(
                        "assets/image/california.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 164,
                    top: 20,
                    child: Text(
                      "Beach Hotel California",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff070D30).withOpacity(1),
                        fontFamily: "jeju2",
                      ),
                    ),
                  ),
                  Positioned(
                      left: 163,
                      top: 44,
                      child: Image.asset(
                        "assets/image/Star.png",
                        scale: 3.56,
                      )),
                  Positioned(
                    left: 245,
                    top: 45,
                    child: Text(
                      "4.5",
                      style: TextStyle(
                        color: CupertinoColors.inactiveGray.withOpacity(0.80),
                        fontFamily: "jeju2",
                      ),
                    ),
                  ),
                  Positioned(
                    left: 163,
                    top: 80,
                    child: Text(
                      "\$170",
                      style: TextStyle(
                        fontSize: 29,
                        fontFamily: "jeju2",
                        color: Color(0xff070D30).withOpacity(1),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 234,
                    top: 89,
                    child: Text(
                      "Night",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "jeju2",
                        color: CupertinoColors.inactiveGray.withOpacity(0.80),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 17,
            ),
            Stack(
              children: [
                Container(
                  width: width * 0.89,
                  height: height * 0.11,
                  decoration: BoxDecoration(
                    color: Color(0xffFFFFFF).withOpacity(1),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 2,
                          color:
                          CupertinoColors.inactiveGray.withOpacity(0.26),
                          blurRadius: 4,
                          offset: Offset(0, 3)),
                    ],
                  ),
                ),
                Positioned(
                  top: 13,
                  left: 20,
                  child: Row(
                    children: [
                      Text(
                        "Check In",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "jeju2",
                          color: Color(0xff070D30).withOpacity(1),
                        ),
                      ),
                      SizedBox(
                        width: 160,
                      ),
                      Text(
                        "October 12,2024",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "jeju2",
                          color: Color(0xff070D30).withOpacity(1),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  child: Row(
                    children: [
                      Text(
                        "Guest",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "jeju2",
                          color: Color(0xff070D30).withOpacity(1),
                        ),
                      ),
                      SizedBox(
                        width: 180,
                      ),
                      Text(
                        "2",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "jeju2",
                          color: Color(0xff070D30).withOpacity(1),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 69,
                  left: 20,
                  child: Row(
                    children: [
                      Text(
                        "Check Out",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "jeju2",
                          color: Color(0xff070D30).withOpacity(1),
                        ),
                      ),
                      SizedBox(
                        width: 150,
                      ),
                      Text(
                        "October 12,2024",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "jeju2",
                          color: Color(0xff070D30).withOpacity(1),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 17),
            Stack(
              children: [
                Container(
                  width: width * 0.89,
                  height: height * 0.22,
                  decoration: BoxDecoration(
                    color: Color(0xffFFFFFF).withOpacity(1),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 2,
                          color: CupertinoColors.inactiveGray
                              .withOpacity(0.26),
                          blurRadius: 4,
                          offset: Offset(0, 3)),
                    ],
                  ),
                ),
                Positioned(
                  top: 7,
                  left: 20,
                  child: Row(
                    children: [
                      Text(
                        "Amount ",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "jeju2",
                          color: Color(0xff070D30).withOpacity(1),
                        ),
                      ),
                      SizedBox(
                        width: 160,
                      ),
                      Text(
                        "\$340",
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: "jeju2",
                          color: Color(0xff070D30).withOpacity(1),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: Row(
                    children: [
                      Text(
                        "Tax",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "jeju2",
                          color: Color(0xff070D30).withOpacity(1),
                        ),
                      ),
                      SizedBox(
                        width: 192,
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
                ),
                Positioned(
                  top: 100,
                  left: 20,
                  child: Row(
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "jeju2",
                          color: Color(0xff070D30).withOpacity(1),
                        ),
                      ),
                      SizedBox(
                        width: 183,
                      ),
                      Text(
                        "\$345",
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: "jeju2",
                          color: Color(0xff070D30).withOpacity(1),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 150,
                  left: 20,
                  child: Row(
                    children: [
                      Text(
                        "Status",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "jeju2",
                          color: Color(0xff070D30).withOpacity(1),
                        ),
                      ),
                      SizedBox(
                        width: 177,
                      ),
                      Container(
                        width: width*0.12,
                        height: height* 0.03,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                            border: Border.all(color: Colors.blue,width: 2)
                        ),
                        child:  Center(
                          child: Text("Paid",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "jeju2",
                              color: Color(0xff070D30).withOpacity(1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
            SizedBox(height: 17,),
            Stack(
              children: [
                Container(
                  width: width * 0.89,
                  height: height * 0.15,
                  decoration: BoxDecoration(
                    color: Color(0xffFFFFFF).withOpacity(1),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 2,
                          color:
                          CupertinoColors.inactiveGray.withOpacity(0.26),
                          blurRadius: 4,
                          offset: Offset(0, 3)),
                    ],
                  ),
                ),
                Positioned(
                  top: 13,
                  left: 20,
                  child: Row(
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "jeju2",
                          color: Color(0xff070D30).withOpacity(1),
                        ),
                      ),
                      SizedBox(
                        width: 185,
                      ),
                      Text(
                        "Jhon",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "jeju2",
                          color: Color(0xff070D30).withOpacity(1),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: Row(
                    children: [
                      Text(
                        "Number",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "jeju2",
                          color: Color(0xff070D30).withOpacity(1),
                        ),
                      ),
                      SizedBox(
                        width: 170,
                      ),
                      Text(
                        "7994152461",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "jeju2",
                          color: Color(0xff070D30).withOpacity(1),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 80,
                  left: 20,
                  child: Row(
                    children: [
                      Text(
                        "Transaction id",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "jeju2",
                          color: Color(0xff070D30).withOpacity(1),
                        ),
                      ),
                      SizedBox(
                        width: 133,
                      ),
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
