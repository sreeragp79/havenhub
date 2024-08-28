import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/MainProvider.dart';
import 'Adress.dart';
import 'My Profile.dart';
import 'Home.dart';
import 'Login Page.dart';
import 'Splash 2.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  void selected(String value) {
    switch (value) {
      case "Home":
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ));
        break;
      case "Settings":
        null;
        break;
      case "LogOut":
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ));
        null;
        break;
    }
  }

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
            "Profile",
            style: TextStyle(fontSize: 27, fontFamily: "jeju2"),
          ),
          centerTitle: true,
          backgroundColor: Color(0xffFFFFFF).withOpacity(1),
          leading: Padding(
            padding:  EdgeInsets.only(left: width/34.25),
            child: IconButton(
              icon: Icon(Icons.arrow_back,
                  color:
                      Colors.black.withOpacity(0.7)), // Specify icon and color
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          actions: [
            PopupMenuButton<String>(
              onSelected: selected,
              itemBuilder: (context) => [
                PopupMenuItem<String>(
                  value: "Home",
                  child: Row(
                    children: [
                      Icon(Icons.home, color: Colors.black.withOpacity(1)),
                      SizedBox(
                        width: 8,
                      ),
                      Text("Home"),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: "Home",
                  child: Row(
                    children: [
                      Icon(Icons.settings, color: Colors.black.withOpacity(1)),
                      SizedBox(
                        width: 8,
                      ),
                      Text("Settings"),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: "Home",
                  child: Row(
                    children: [
                      Icon(Icons.logout_rounded,
                          color: Colors.black.withOpacity(1)),
                      SizedBox(
                        width: 8,
                      ),
                      Text("LogOut"),
                    ],
                  ),
                ),
              ],
              color: Colors.white10,
              elevation: 0,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<MainProvider>(
          builder: (context,value,child) {
            return Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/image/profile.png"),
                    radius: 60,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(
                    value.firstnameController.text,
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xff070D30).withOpacity(1),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    value.emailController.text,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff6B7280),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: width * 0.86,
                  height: height * 0.08,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey.withOpacity(0.10),
                      // backgroundColor: Colors.red,
                      foregroundColor: Color(0xff070D30).withOpacity(1),
                    ),
                    onPressed: () {
                      value.getEditProfile();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Edit(),
                          ));
                    },
                    child:
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Edit(),
                                ));
                          },
                          icon: ImageIcon(
                            AssetImage(
                              "assets/image/User.png",
                            ),
                            size: 31,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "My Profile",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff070D30).withOpacity(1),
                            fontFamily: "jeju2",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: width * 0.86,
                  height: height * 0.08,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey.withOpacity(0.10),
                      foregroundColor: Color(0xff070D30).withOpacity(1),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Address(),
                          ));
                    },
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Address(),
                                ));
                          },
                          icon: ImageIcon(
                            AssetImage(
                              "assets/image/Chat_alt_2_light@3x.png",
                            ),
                            size: 31,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Address",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff070D30).withOpacity(1),
                            fontFamily: "jeju2",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: width * 0.86,
                  height: height * 0.08,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey.withOpacity(0.10),
                      foregroundColor: Color(0xff070D30).withOpacity(1),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ));
                    },
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Login(),
                                ));
                          },
                          icon: ImageIcon(
                            AssetImage(
                              "assets/image/Settings.png",
                            ),
                            size: 31,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Setings",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff070D30).withOpacity(1),
                            fontFamily: "jeju2",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: width * 0.86,
                  height: height * 0.08,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey.withOpacity(0.10),
                      foregroundColor: Color(0xff070D30).withOpacity(1),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ));
                    },
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Splash2(),
                                ));
                          },
                          icon: ImageIcon(
                            AssetImage(
                              "assets/image/LogOut.png",
                            ),
                            size: 31,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Log Out",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff070D30).withOpacity(1),
                            fontFamily: "jeju2",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
