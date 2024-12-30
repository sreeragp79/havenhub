import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haven_hub/user/Home.dart';

import 'Login Page.dart';
import 'Sign Up.dart';

class Splash2 extends StatefulWidget {
  const Splash2({super.key});

  @override
  State<Splash2> createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height / 1.64, // Adjusted based on 890 height
                  width: width / 1.98,   // Adjusted based on 411 width
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(100),
                      bottomLeft: Radius.circular(100),
                    ),
                    image: DecorationImage(
                      image: AssetImage("assets/image/blue.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: height / 3.20, // Adjusted based on 890 height
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          image: DecorationImage(
                            image: AssetImage("assets/image/Rectangle 15.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(height: height / 130), // Adjusted based on 890 height
                      Text(
                        " >> >> >> >> >> >> >>   ",
                        style: TextStyle(
                          fontFamily: "jeju2",
                          fontSize: width / 20.86, // Adjusted based on 411 width
                          color: Colors.grey.withOpacity(0.70),
                        ),
                      ),
                      Text(
                        "The best\n"
                            " haven\n "
                            "guide for\n"
                            " your\n"
                            " pocket.\n",
                        style: TextStyle(
                          fontFamily: "jeju",
                         fontSize: 33,
                         // Adjusted based on 890 height
                          color: Color(0xff070D30),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 6),
            Text(
              "  The easiest way to discover your  havens.\n"
                  "  book hotels &  find attractions and\n "
                  " restaurants,",
              style: TextStyle(
                fontSize: 20, // Adjusted based on 411 width
                fontFamily: "jeju",
                color: Colors.black.withOpacity(1),
                fontWeight: FontWeight.w300,
                wordSpacing: height / 887, // Adjusted based on 890 height
              ),
            ),
            SizedBox(height: height / 89), // Adjusted based on 890 height
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(height / 50), // Adjusted based on 890 height
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Container(
                    width: width / 3.425,  // Adjusted based on 411 width
                    height: height / 5.93, // Adjusted based on 890 height
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xff070D30), Color(0xff162996)],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Explore",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "jeju2",
                          fontSize: width / 13.67, // Adjusted based on 411 width
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
