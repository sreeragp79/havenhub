import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:haven_hub/Provider/MainProvider.dart';
import 'package:provider/provider.dart';

import 'Confirm Code.dart';
import 'Home.dart';
import 'Login Page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool? isChecked = false;
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF).withOpacity(1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45),
        child: AppBar(
          backgroundColor: Color(0xffFFFFFF).withOpacity(1),
          leading: Padding(
            padding: EdgeInsets.only(left: width / 34.25),
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black.withOpacity(0.7)), // Specify icon and color
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: Consumer<MainProvider>(
        builder: (context, signUp, child) {
          return SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 45, fontFamily: "jeju2"),
                    ),
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.only(right: 230),
                    child: Text(
                      "Phone Number",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey.withOpacity(1),
                      ),
                    ),
                  ),
                  Container(
                    width: width * 0.86,
                    margin: EdgeInsets.symmetric(vertical: height / 59.33),
                    child: TextFormField(
                      maxLength: 10,
                      controller: signUp.signupPhoneorEmailController,
                      decoration: InputDecoration(
                        prefixIcon: ImageIcon(
                          AssetImage("assets/image/iPhone SE.png"),
                        ),
                        prefixIconConstraints: BoxConstraints(
                          minWidth: width / 6.32, // Adjust this value to increase/decrease space
                          minHeight: height / 31.78,
                        ),
                        filled: true, // Set filled to true
                        fillColor: Colors.grey.withOpacity(0.10), // Set the fill color
                        hintText: "Phone Number",
                        hintStyle: TextStyle(
                          color: Colors.grey.withOpacity(0.80),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: height / 35.6, horizontal: width / 8.22),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(45),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(45),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a phone number!";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 225),
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
                    child: TextFormField(
                      controller: signUp.signupPasswordController,
                      maxLength: 12,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: ImageIcon(
                          AssetImage("assets/image/Lock.png"),
                        ),
                        prefixIconConstraints: BoxConstraints(
                          minWidth: 65, // Adjust this value to increase/decrease space
                          minHeight: 28,
                        ),
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.10),
                        hintText: "Password",
                        hintStyle: TextStyle(
                          color: Colors.grey.withOpacity(0.80),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 25, horizontal: 50),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(45),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(45),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a password!";
                        } else if (value.length < 6) {
                          return "Password must be at least 6 characters!";
                        }
                        return null;
                      },
                    ),
                  ),
                  CheckboxListTile(
                    title: Text(
                      "Remember me",
                      style: TextStyle(
                        color: Colors.grey.withOpacity(0.80),
                        fontSize: 17,
                      ),
                    ),
                    value: isChecked,
                    onChanged: (val) {
                      setState(() {
                        isChecked = val;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.symmetric(horizontal: 34),
                    dense: true,
                    side: BorderSide(width: 17),
                  ),
                  SizedBox(height: 23),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xff061673),
                      minimumSize: Size(width * 0.85, height * 0.07),
                    ),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 24, fontFamily: "jeju2", color: Colors.white),
                    ),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        signUp.signUpDetails();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                      }
                    },
                  ),
                  SizedBox(height: 12),
                  RichText(
                    text: TextSpan(
                      text: "Already have an account",
                      style: TextStyle(
                        color: Colors.grey.withOpacity(0.90),
                        fontSize: 16,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: " Log In",
                          style: TextStyle(
                            color: Color(0xff070D30),
                            fontSize: 16,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                            },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "or",
                    style: TextStyle(
                      color: Color(0xff070D30).withOpacity(0.50),
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 26),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: width * 0.31,
                        height: height * 0.08,
                        decoration: BoxDecoration(
                          color: Color(0xff070D30).withOpacity(0.10),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Image.asset("assets/image/google.png", scale: 3.10),
                      ),
                      SizedBox(width: 39),
                      Container(
                        width: width * 0.31,
                        height: height * 0.08,
                        decoration: BoxDecoration(
                          color: Color(0xff070D30).withOpacity(0.10),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Image.asset("assets/image/apple.png", scale: 3),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
