import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/MainProvider.dart';
import 'Adress.dart';
import 'Confirm Code.dart';
import 'Forgot Password.dart';
import 'Home.dart';
import 'Sign Up.dart';
import 'Splash 2.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool? isChecked = false;
  TextEditingController nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override 
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // screen height 890,
    // screen width 411,
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF).withOpacity(1),
      body: Consumer<MainProvider>(
          builder: (context, value, child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: height / 8.09,
                  ),
                  Center(
                    child: Text(
                      "Log In",
                      style: TextStyle(fontSize: width / 9.13, fontFamily: "jeju2"),
                    ),
                  ),
                  SizedBox(height: height / 22.25,),
                  Padding(
                    padding: EdgeInsets.only(right: width / 1.78),
                    child: Text(
                      "Phone Number",
                      style: TextStyle(
                        fontSize: width / 24.17,
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
                          margin: EdgeInsets.symmetric(vertical: height / 59.33),
                          child: Center(
                            child: TextFormField(
                              controller: value.nameController,
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
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 270),
                          child: Text(
                            "Password",
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
                            child: TextFormField(
                              controller: value.passwordController,
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
                                filled: true, // Set filled to true
                                fillColor: Colors.grey.withOpacity(0.10), // Set the fill color
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
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 140,),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Forgot(),));
                      },
                      child: Text(
                        "Forgot your password?",
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.80),
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  CheckboxListTile(
                    title: Text(
                      "Remember me ",
                      style: TextStyle(
                        color: Colors.grey.withOpacity(0.80),
                        fontSize: 17,
                      ),
                    ),
                    value: isChecked, onChanged: (val) {
                    setState(() {
                      isChecked = val;
                    });
                  },
                    controlAffinity: ListTileControlAffinity.leading, /////////////////
                    contentPadding: EdgeInsets.symmetric(horizontal: 34),
                    dense: true,
                    side: BorderSide(width: 17),
                  ),
                  SizedBox(height: 23,),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xff061673),
                      minimumSize: Size(width * 0.85, height * 0.07),
                    ),
                    child: Text(
                      "Log In",
                      style: TextStyle(fontSize: 24, fontFamily: "jeju2", color: Colors.white),
                    ),
                    onPressed: () async{
                       await FirebaseAuth.instance.verifyPhoneNumber(
                           verificationCompleted: (PhoneAuthCredential credential){},
                           verificationFailed: (FirebaseAuthException ex){},
                           codeSent: (String verificationid,int? resendtoeken){},
                           codeAutoRetrievalTimeout: (String verificationid){},
                           phoneNumber: nameController.text.toString(),
                       );
                      if (formKey.currentState!.validate()) {
                        value.details();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmCode1(),));
                      }
                    },
                  ),
                  SizedBox(height: 12,),
                  RichText(
                    text: TextSpan(
                      text: "Don't have an account",
                      style: TextStyle(
                        color: Colors.grey.withOpacity(0.90),
                        fontSize: 16,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: " Sign Up",
                            style: TextStyle(
                              color: Color(0xff070D30),
                              fontSize: 16,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
                              }
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    "or ",
                    style: TextStyle(
                      color: Color(0xff070D30).withOpacity(0.50),
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 26,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: width * 0.31,
                        height: height * 0.08,
                        decoration: BoxDecoration(
                          color: Color(0xff070D30).withOpacity(0.10),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Image.asset("assets/image/google.png", scale: 3.10,),
                      ),
                      SizedBox(width: 39,),
                      Container(
                        width: width * 0.31,
                        height: height * 0.08,
                        decoration: BoxDecoration(
                          color: Color(0xff070D30).withOpacity(0.10),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Image.asset("assets/image/apple.png", scale: 3,),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}
