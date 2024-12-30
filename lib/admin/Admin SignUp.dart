import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:haven_hub/Provider/LoginProvider.dart';
import 'package:provider/provider.dart';
import '../user/Login Page.dart';
import '../user/SignUp Otp.dart';
import 'Admin Login.dart';
import 'Admin Otp.dart';

class AdminSignUp extends StatefulWidget {
  const AdminSignUp({super.key});
  @override
  State<AdminSignUp> createState() => _SignUpState();
}
class _SignUpState extends State<AdminSignUp> {
  bool? isChecked = false;
  bool? isLoading = false;
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF).withOpacity(1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.05),
        child: AppBar(
          backgroundColor: Color(0xffFFFFFF).withOpacity(1),
          leading: Padding(
            padding: EdgeInsets.only(left: width * 0.03),
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black.withOpacity(0.7)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: Consumer<Loginprovider>(
        builder: (context, signUp, child) {
          return SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  SizedBox(height: height * 0.02),
                  Center(
                    child: Text(
                      "Admin SignUp",
                      style: TextStyle(fontSize: 45, fontFamily: "jeju2"),
                    ),
                  ),
                  SizedBox(height: height * 0.045),
                  Padding(
                    padding: EdgeInsets.only(right: width * 0.55),
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
                    margin: EdgeInsets.symmetric(vertical: height * 0.017),
                    child: TextFormField(
                      controller: signUp.signupPhoneorEmailController,
                      decoration: InputDecoration(
                        prefixIcon: ImageIcon(
                          AssetImage("assets/image/iPhone SE.png"),
                        ),
                        prefixIconConstraints: BoxConstraints(
                          minWidth: width * 0.16,
                          minHeight: height * 0.035,
                        ),
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.10),
                        hintText: "Phone Number",
                        hintStyle: TextStyle(
                          color: Colors.grey.withOpacity(0.80),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: height * 0.025, horizontal: width * 0.08),
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
                    padding: EdgeInsets.only(right: width * 0.55),
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
                    margin: EdgeInsets.symmetric(vertical: height * 0.017),
                    child: TextFormField(
                      controller: signUp.signupPasswordController,
                      maxLength: 12,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: ImageIcon(
                          AssetImage("assets/image/Lock.png"),
                        ),
                        prefixIconConstraints: BoxConstraints(
                          minWidth: width * 0.16,
                          minHeight: height * 0.03,
                        ),
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.10),
                        hintText: "Password",
                        hintStyle: TextStyle(
                          color: Colors.grey.withOpacity(0.80),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: height * 0.025, horizontal: width * 0.08),
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
                    contentPadding: EdgeInsets.symmetric(horizontal: width * 0.08),
                    dense: true,
                    side: BorderSide(width: 1),
                  ),
                  SizedBox(height: height * 0.025),
                  isLoading! ? CircularProgressIndicator():
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xff061673),
                      minimumSize: Size(width * 0.85, height * 0.07),
                    ),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 24, fontFamily: "jeju2", color: Colors.white),
                    ),
                    onPressed: () async {
                      signUp.signUpDetails();
                      if (formkey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        print("Phone Number: " + signUp.signupPhoneorEmailController.text.toString());
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          verificationCompleted: (PhoneAuthCredential credential) {},
                          verificationFailed: (FirebaseAuthException ex) {},
                          codeSent: (String verificationid, int? resendtoken) {
                            setState(() {
                              isLoading = false; // Stop loading before navigating
                            });
                            signUp.signupPhoneorEmailController.clear();
                            signUp.signupPasswordController.clear();

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AdminOtp(
                                  verificationid: verificationid,
                                ),
                              ),
                            );
                          },
                          codeAutoRetrievalTimeout: (String verificationid) {},
                          phoneNumber: signUp.signupPhoneorEmailController.text.toString(),
                        );
                      } else {
                        print("Form is not valid");
                      }
                    },
                  ),
                  SizedBox(height: height * 0.015),
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AdminLogin()));
                            },
                        ),
                      ],
                    ),
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
