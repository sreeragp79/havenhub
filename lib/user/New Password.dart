import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Login Page.dart';

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color(0xffFFFFFF).withOpacity(1),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height* 0.05),
          child: AppBar(
            backgroundColor: Color(0xffFFFFFF).withOpacity(1),
            leading: Padding(
              padding:  EdgeInsets.only(left:width/34.25),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black.withOpacity(0.7)), // Specify icon and color
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
            height: 70,
          ),
          Center(
            child: Text(
              "Set new password",
              style: TextStyle(fontSize: 45, fontFamily: "jeju2"),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 210),
            child: Text(
              "Create Password",
              style: TextStyle(
                fontSize: 17,
                color: Colors.grey.withOpacity(1),
              ),
            ),
          ),
          Container(
            width: width * 0.86,
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Center(
              child: TextField(
                maxLength: 12,
                decoration: InputDecoration(
                  prefixIcon: ImageIcon(
                    AssetImage("assets/image/Lock.png"),
                  ),
                  prefixIconConstraints: BoxConstraints(
                    minWidth:
                        65, // Adjust this value to increase/decrease space
                    minHeight: 27,
                  ),
                  filled: true, // Set filled to true
                  fillColor: Colors.grey.withOpacity(
                      0.10), // Set the fill color// Set filled to true
                  hintText: "Password",
                  hintStyle: TextStyle(
                    color: Colors.grey.withOpacity(0.80),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 25, horizontal: 50),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(45),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(45),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 205),
            child: Text(
              "Confirm Password",
              style: TextStyle(
                fontSize: 17,
                color: Colors.grey.withOpacity(1),
              ),
            ),
          ),
          Container(
            width: width * 0.86,
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Center(
              child: TextField(
                maxLength: 12,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: ImageIcon(
                    AssetImage("assets/image/Lock.png"),
                  ),
                  prefixIconConstraints: BoxConstraints(
                    minWidth:
                        65, // Adjust this value to increase/decrease space
                    minHeight: 28,
                  ),
                  filled: true, // Set filled to true
                  fillColor: Colors.grey.withOpacity(
                      0.10), // Set the fill color// Set filled to true
                  hintText: "Password",
                  hintStyle: TextStyle(
                    color: Colors.grey.withOpacity(0.80),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 25, horizontal: 50),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(45),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(45),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Color(0xff061673),
              minimumSize: Size(width * 0.85, height * 0.07),
            ),
            child: Text(
              "Reset your password",
              style: TextStyle(
                fontSize: 24,
                fontFamily: "jeju2",
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ));
            },
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 115),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black.withOpacity(1),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ));
                  },
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ));
                  },
                  child: Text(
                    "Back to Log In ",
                    style: TextStyle(
                      color: Color(0xff070D30),
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
