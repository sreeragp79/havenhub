import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:haven_hub/Provider/MainProvider.dart';
import 'package:haven_hub/user/Home.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'Adress.dart';

class ConfirmCode2 extends StatefulWidget {
  String verificationid;
  ConfirmCode2({super.key,required this.verificationid});
  @override
  State<ConfirmCode2> createState() => _OtpState();
}
class _OtpState extends State<ConfirmCode2> {
  TextEditingController pinputController = TextEditingController();
  bool? isLoading= false;
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
      body: Consumer<MainProvider>(
        builder: (context,value,child) {
          return SingleChildScrollView(
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
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Pinput(
                    controller: pinputController,
                    length: 6,
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
                ),
                SizedBox(height: 37,),
                isLoading! ? CircularProgressIndicator():
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor:Color(0xff061673),
                    minimumSize: Size(width * 0.85,height *0.07),
                  ),
                  child: Text(
                    "Continue",
                    style: TextStyle(fontSize: 24, fontFamily: "jeju2",color: Colors.white,),
                  ),
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                      PhoneAuthCredential credential =
                      await PhoneAuthProvider.credential(
                          verificationId: widget.verificationid,
                          smsCode: pinputController.text.toString());
                      FirebaseAuth.instance.signInWithCredential(credential).then((value){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Address(),));
                      }
                      ).catchError((erorr){
                        print("erorrrrrrrrrrrrrrrr:$erorr");
                      });
                  },
                ),
                SizedBox(height: height* 0.01,),
                InkWell(
                  // onTap: () {
                  //   Navigator.push(context, MaterialPageRoute(builder: (context) =>Login() ,));
                  // },
                  child: Text("Sent code again ",
                    style: TextStyle(
                      color:Colors.grey.withOpacity(0.78),
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      fontFamily: "jeju2",
                    ),
                  ),
                ),

              ],
            ),
          );
        }
      ),
    );
  }
}
