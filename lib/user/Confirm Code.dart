import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import 'Adress.dart';
import 'Login Page.dart';

class ConfirmCode1 extends StatefulWidget {
  ConfirmCode1({super.key});

  @override
  State<ConfirmCode1> createState() => _OtpState();
}

class _OtpState extends State<ConfirmCode1> {

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
            SizedBox(height: height* 0.06,),
            Center(
              child: Text(
                "Confirm your code ",
                style: TextStyle(fontSize: 40, fontFamily: "jeju2"),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(right: 18),
              child: Text("    Enter the verification code",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey.withOpacity(1),
                ),
              ),
            ),
            SizedBox(height: height* 0.05,),

            Pinput(
              length: 4,
              defaultPinTheme: (
                  PinTheme(
                    textStyle: TextStyle(
                        fontFamily: "jeju2",
                        fontSize: 23
                    ),
                    width: width* 0.16,
                    height: height* 0.06,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.20),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  )
              ),
            ),
            SizedBox(height: height* 0.06,),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor:Color(0xff061673),
                minimumSize: Size(width * 0.85,height *0.07),
              ),
              child: Text(
                "Continue",
                style: TextStyle(fontSize: 24, fontFamily: "jeju2",color: Colors.white,),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Address(),));
              },
            ),
            SizedBox(height: height* 0.01,),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>Login() ,));
              },
              child: Text("Sent code again ",
                style: TextStyle(
                  color:Colors.grey.withOpacity(0.78),
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  fontFamily: "jeju2",
                ),
              ),
            ),
            SizedBox(height: height* 0.02,),
            Padding(
              padding: const EdgeInsets.only(left: 115),
              child: Row(
                children: [
                  IconButton(
                    icon:Icon(Icons.arrow_back,color: Colors.black.withOpacity(1),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                    },
                  ),

                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>Login() ,));
                    },
                    child: Text("Back to Log In ",
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
      ),
    );
  }
}
