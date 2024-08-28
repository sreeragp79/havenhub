import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'Home.dart';
import 'Login Page.dart';

class PaymentSuccess extends StatefulWidget {
  const PaymentSuccess({super.key});

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffD9D9D9).withOpacity(1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: width * 0.70,
                  height: height * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(75),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/image/success.png",
                        scale: 2.90,
                        alignment: Alignment.topCenter,
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Congratulations",
                        style: TextStyle(
                          fontSize: 29,
                          fontFamily: "jeju2",
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Payment Successful",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "jeju2",
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: width * 0.48,
                        height: height * 0.05,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Color(0xff061673).withOpacity(1),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Login(),
                              ),
                            );
                          },
                          child: Text(
                            "View Receipt",
                            style: TextStyle(
                              fontFamily: "jeju2",
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: width * 0.48,
                        height: height * 0.05,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: CupertinoColors.inactiveGray,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Home(),
                              ),
                            );
                          },
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              fontFamily: "jeju2",
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(bottom: 200),
                  child: Lottie.asset(
                    "assets/animation/pop.json",
                    width: 250,
                    height: 200,
                    repeat: false,
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
