
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:haven_hub/Provider/LoginProvider.dart';
import 'package:provider/provider.dart';

import '../Provider/MainProvider.dart';


class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _LoginState();
}

class _LoginState extends State<AdminLogin> {
  bool? isChecked = false;
  TextEditingController nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF).withOpacity(1),
      body: Consumer<MainProvider>(builder: (context, value, child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.1236, // height: height / 8.09
              ),
              Center(
                child: Text(
                  "AdminLogin",
                  style: TextStyle(
                    fontSize: width * 0.109, // fontSize: width / 9.13
                    fontFamily: "jeju2",
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.045, // height: height / 22.25
              ),
              Padding(
                padding: EdgeInsets.only(right: width * 0.562), // padding: EdgeInsets.only(right: width / 1.78)
                child: Text(
                  "Phone Number",
                  style: TextStyle(
                    fontSize: width * 0.0415, // fontSize: width / 24.17
                    color: Colors.grey.withOpacity(1),
                  ),
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      width: width * 0.86,
                      margin: EdgeInsets.symmetric(vertical: height * 0.0168), // margin: vertical height / 59.33
                      child: Center(
                        child: TextFormField(
                          controller: value.nameController,
                          decoration: InputDecoration(
                            prefixIcon: ImageIcon(
                              AssetImage("assets/image/iPhone SE.png"),
                            ),
                            prefixIconConstraints: BoxConstraints(
                              minWidth: width * 0.158, // minWidth: width / 6.32
                              minHeight: height * 0.0315, // minHeight: height / 31.78
                            ),
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.10),
                            hintText: "Phone Number",
                            hintStyle: TextStyle(
                              color: Colors.grey.withOpacity(0.80),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: height * 0.028, // vertical: height / 35.6
                                horizontal: width * 0.122), // horizontal: width / 8.22
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
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: width * 0.657), // right: 270 converted
                      child: Text(
                        "Password",
                        style: TextStyle(
                          fontSize: width * 0.0415, // fontSize: 17 converted
                          color: Colors.grey.withOpacity(1),
                        ),
                      ),
                    ),
                    Container(
                      width: width * 0.86,
                      margin: EdgeInsets.symmetric(vertical: height * 0.0168), // vertical height / 59.33
                      child: Center(
                        child: TextFormField(
                          controller: value.passwordController,
                          maxLength: 12,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: ImageIcon(
                              AssetImage("assets/image/Lock.png"),
                            ),
                            prefixIconConstraints: BoxConstraints(
                              minWidth: width * 0.158, // minWidth: width / 6.32
                              minHeight: height * 0.0315, // minHeight: height / 31.78
                            ),
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.10),
                            hintText: "Password",
                            hintStyle: TextStyle(
                              color: Colors.grey.withOpacity(0.80),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: height * 0.028, // vertical: height / 35.6
                                horizontal: width * 0.122), // horizontal: width / 8.22
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
                    ),
                  ],
                ),
              ),

              SizedBox(height: height * 0.026), // height: 23 converted
              Consumer<Loginprovider>(builder: (context, value2, child) {
                return TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xff061673),
                      minimumSize: Size(width * 0.85, height * 0.07),
                    ),
                    child: Text(
                      "Log In",
                      style: TextStyle(
                        fontSize: width * 0.058, // fontSize: 24 converted
                        fontFamily: "jeju2",
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () async {
                      String phone = value.nameController.text;
                      String password = value.passwordController.text;
                      await value2.userDataStore(context, phone, password);
                    });
              }),
              SizedBox(height: height * 0.0056), // height: 5 converted

              SizedBox(height: height * 0.0292), // height: 26 converted
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
                    child: Image.asset(
                      "assets/image/google.png",
                      scale: 3.10,
                    ),
                  ),
                  SizedBox(width: width * 0.095), // width: 39 converted
                  Container(
                    width: width * 0.31,
                    height: height * 0.08,
                    decoration: BoxDecoration(
                      color: Color(0xff070D30).withOpacity(0.10),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Image.asset(
                      "assets/image/apple.png",
                      scale: 3,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
