import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haven_hub/admin/Admin%20Login.dart';
import 'package:haven_hub/admin/Admin%20SignUp.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'Splash 2.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => SplashState();
}

class SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    checkPackage();
  }

  void checkPackage() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      String packageName = packageInfo.packageName;

      if (mounted) {
        Future.delayed(Duration(seconds: 3), () {
          if (packageName == "com.example.haven_hub") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Splash2()),
            );
          } else if (packageName == "com.example.haven_hub_admin") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AdminSignUp()),
            );
          }
          print("Package Name: $packageName");
        });
      }
    } catch (e) {
      print("Error getting package info: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/image/havenHubSplash.png"),
          ),
        ),
      ),
    );
  }
}