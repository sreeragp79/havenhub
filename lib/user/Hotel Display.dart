import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haven_hub/Provider/MainProvider.dart';
import 'package:provider/provider.dart';

import '../models/userModel.dart';
import 'Book Now.dart';
import 'Review Adding.dart';
import 'Review.dart';

class Details1 extends StatefulWidget {
  ResortAddingDetails hotel;
  Details1({super.key, required this.hotel});

  @override
  State<Details1> createState() => _CaliforniaState();
}

class _CaliforniaState extends State<Details1> {
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
            "Details",
            style: TextStyle(fontSize: width * 0.065, fontFamily: "jeju2"),
          ),
          centerTitle: true,
          backgroundColor: Color(0xffFFFFFF).withOpacity(1),
          leading: Padding(
            padding: EdgeInsets.only(left: width * 0.03),
            child: IconButton(
              icon: Icon(Icons.arrow_back,
                  color: Colors.black.withOpacity(0.7)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: Consumer<MainProvider>(
        builder: (context, guestval, child) {
          return SingleChildScrollView(
            child: Stack(
              children: [
                // Main content column
                Column(
                  children: [
                    SizedBox(height: height * 0.0067),
                    Center(
                      child: Container(
                        width: width * 0.9,
                        height: height * 0.27,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(31),
                          color: Colors.white,
                          image: DecorationImage(
                              image: NetworkImage(widget.hotel.image!),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.015),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: width * 0.09),
                        child: Text(
                          widget.hotel.name!,
                          style: TextStyle(
                            fontSize: width * 0.052,
                            color: Color(0xff070D30).withOpacity(1),
                            fontFamily: "jeju2",
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: width * 0.09),
                        child: Text(
                          widget.hotel.place!,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.60),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.045),
                    Container(
                      width: width * 0.9,
                      height: height * 0.48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(31),
                        color: CupertinoColors.inactiveGray.withOpacity(0.15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: height * 0.017, left: width * 0.05),
                            child: Text(
                              "Information",
                              style: TextStyle(
                                fontSize: width * 0.05,
                                color: Color(0xff070D30).withOpacity(1),
                                fontFamily: "jeju2",
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.0083),
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.04),
                            child: Text(
                              widget.hotel.information!,
                              style: TextStyle(
                                color: Colors.blueGrey.withOpacity(0.78),
                                fontSize: width * 0.04,
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.02),
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.05),
                            child: Image.asset(
                              "assets/image/cali riv.png",
                              scale: width * 0.02,
                            ),
                          ),
                          SizedBox(height: height * 0.011),
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.05),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Review(),
                                  ),
                                );
                              },
                              child: Image.asset(
                                "assets/image/32 re.png",
                                scale: width * 0.02,
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.05),
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.05),
                            child: Row(
                              children: [
                                Text(
                                  guestval.totalAmount(widget.hotel.price),
                                  style: TextStyle(
                                    fontSize: width * 0.1,
                                    fontFamily: "jeju2",
                                  ),
                                ),
                                SizedBox(width: width * 0.04),
                                Text(
                                  "Per Day",
                                  style: TextStyle(
                                    fontFamily: "jeju2",
                                    color: CupertinoColors.inactiveGray,
                                    fontSize: width * 0.056,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: height * 0.03),
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.06),
                            child: Text(
                              "Guest",
                              style: TextStyle(
                                fontFamily: "jeju2",
                                fontSize: width * 0.056,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.04),
                            child: Container(
                              width: width * 0.31,
                              height: height * 0.056,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(23),
                                color: Color(0xffFFFFFF).withOpacity(1),
                                border: Border.all(
                                  color: Colors.grey.withOpacity(0.45),
                                  width: 0.45,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    onPressed: guestval.decrementValue,
                                    icon: Icon(Icons.remove),
                                  ),
                                  Center(
                                    child: Text(
                                      guestval.value.toString(),
                                      style: TextStyle(
                                        fontSize: width * 0.048,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: guestval.incrementValue,
                                    icon: Icon(Icons.add),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Positioned widgets moved here as direct children of Stack
                Positioned(
                  left: width * 0.71,
                  top: height * 0.34,
                  child: Container(
                    width: width * 0.22,
                    height: height * 0.52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(30),
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0.10, 0.67),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(right: width * 0.01),
                      child: Column(
                        children: [
                          SizedBox(height: height * 0.02),
                          Text(
                            guestval.totalAmount(widget.hotel.price).toString(),
                            style: TextStyle(
                              fontSize: width * 0.07,
                              fontFamily: "jeju2",
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.01),
                            child: Text(
                              "Night",
                              style: TextStyle(
                                fontFamily: "jeju2",
                                color: CupertinoColors.inactiveGray,
                                fontSize: width * 0.03,
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.03),
                          Image(
                            image: AssetImage("assets/image/wifi.png"),
                            height: height * 0.033,
                            width: width * 0.07,
                            color: Colors.grey.withOpacity(0.67),
                          ),
                          SizedBox(height: height * 0.03),
                          Image(
                            image: AssetImage("assets/image/desktop_light@3asax.png"),
                            height: height * 0.033,
                            width: width * 0.07,
                            color: Colors.grey.withOpacity(0.67),
                          ),
                          SizedBox(height: height * 0.03),
                          Image(
                            image: AssetImage("assets/image/Basket_alt_3_light@3asx.png"),
                            height: height * 0.033,
                            width: width * 0.07,
                            color: Colors.grey.withOpacity(0.67),
                          ),
                          SizedBox(height: height * 0.03),
                          Image(
                            image: AssetImage("assets/image/Book_open_lixcght.png"),
                            height: height * 0.033,
                            width: width * 0.07,
                            color: Colors.grey.withOpacity(0.67),
                          ),
                          SizedBox(height: height * 0.03),
                          Image(
                            image: AssetImage("assets/image/drink_light.png"),
                            height: height * 0.033,
                            width: width * 0.07,
                            color: Colors.grey.withOpacity(0.67),
                          ),
                          SizedBox(height: height * 0.03),
                          Image(
                            image: AssetImage("assets/image/music72.png"),
                            height: height * 0.027,
                            width: width * 0.06,
                            color: Colors.grey.withOpacity(0.67),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: width * 0.51,
                  top: height * 0.785,
                  child: Container(
                    width: width * 0.385,
                    height: height * 0.064,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xff061673).withOpacity(1),
                      ),
                      onPressed: () {
                        guestval.incrementValue();
                        guestval.decrementValue();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Book(hotel: widget.hotel),
                          ),
                        );
                      },
                      child: Text(
                        "Book Now",
                        style: TextStyle(
                          fontFamily: "jeju2",
                          fontSize: width * 0.05,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}