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
    // print(height);
    // print(width);
    // screen hight 890,
    // screen width 411,
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height / 1.64,
                  width: width/1.98,
                  decoration:BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(100),
                      bottomLeft: Radius.circular(100),
                    ),
                    image: DecorationImage(
                      image: AssetImage("assets/image/blue.png"),fit: BoxFit.fill
                    )
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: height/3.20,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          image: DecorationImage(
                            image: AssetImage("assets/image/yellow.png"),fit: BoxFit.fill
                          )
                        ),
                      ),
                      SizedBox(height: height/130),
                      Text(" >> >> >> >> >> >> >>   ",
                      style: TextStyle(
                        fontFamily: "jeju2",
                        fontSize: width/20.86,
                        color: Colors.grey.withOpacity(0.70)
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
                           fontSize: height/18.54,
                           height: height/770.66,
                           color: Color(0xff070D30),
                         ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 6,),
            Text(
              "  The easiest way to discover your  havens.\n"
                  "  book hotels &  find attractions and\n "
                  " restaurants,",
            style: TextStyle(
                fontSize: width/17.86,
                fontFamily: "jeju",
                color: Colors.black.withOpacity(1),
                wordSpacing:height/887,
                fontWeight: FontWeight.w600,
            ),
            ),
            SizedBox(height: height/89,),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:  EdgeInsets.all(height/50),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));
                  },
                  child: Container(
                    width: width/3.425,
                    height:height/5.93,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xff070D30), Color(0xff162996)],
                        ),
                  ),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
                        },
                        child: Text(
                          "Explore",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "jeju2",
                            fontSize: width/13.67,
                          ),

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
