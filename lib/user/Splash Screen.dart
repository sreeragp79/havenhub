import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Splash 2.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 3),() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Splash2(),));
    },);
  }
  Widget build(BuildContext context) {
    return Scaffold(
            body: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xff070D30), Color(0xff162996)],
                        ),
                      ),
                      child: Image.asset("assets/image/Haven logo.png",
                          color: Colors.white, scale: 3),
                    ),
                    Positioned(
                      bottom: 30,
                      left: 145,

                      child: Text(
                        "HavenHub",
                        style: TextStyle(
                          fontFamily: "oregano",
                          color: Colors.white,
                          fontSize: 37,
                        ),
                      ),
                    ),
                  ],
                ),
              ],

            ),
    );
  }
}
