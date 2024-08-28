import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haven_hub/Provider/MainProvider.dart';
import 'package:provider/provider.dart';

import 'Login Page.dart';

class ConfirmPay extends StatefulWidget {

  ConfirmPay({super.key});
  @override
  State<ConfirmPay> createState() => _ConfirmPayState();
}

class _ConfirmPayState extends State<ConfirmPay> {

  String? selectPayment ="";

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
              "Confirm & Pay",
              style: TextStyle(fontSize: 27, fontFamily: "jeju2"),
            ),
            centerTitle: true,
            backgroundColor: Color(0xffFFFFFF).withOpacity(1),
            leading: Padding(
              padding:  EdgeInsets.only(left: width/34.25),
              child: IconButton(
                icon: Icon(Icons.arrow_back,
                    color: Colors.black
                        .withOpacity(0.7)), // Specify icon and color
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ),
        body: Consumer<MainProvider>(
          builder: (context,datevalue,child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 23,
                  ),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: width * 0.89,
                          height: height * 0.15,
                          decoration: BoxDecoration(
                            color: Color(0xffFFFFFF).withOpacity(1),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  color: CupertinoColors.inactiveGray
                                      .withOpacity(0.26),
                                  blurRadius: 4,
                                  offset: Offset(0, 3)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 13, left: 12),
                          child: Container(
                            height: height * 0.12,
                            width: width * 0.32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.red,
                            ),
                            child: Image.asset(
                              "assets/image/california.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 164,
                          top: 20,
                          child: Text(
                            "Beach Hotel California",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff070D30).withOpacity(1),
                              fontFamily: "jeju2",
                            ),
                          ),
                        ),
                        Positioned(
                            left: 163,
                            top: 44,
                            child: Image.asset(
                              "assets/image/Star.png",
                              scale: 3.56,
                            )),
                        Positioned(
                          left: 245,
                          top: 45,
                          child: Text(
                            "4.5",
                            style: TextStyle(
                              color: CupertinoColors.inactiveGray.withOpacity(0.80),
                              fontFamily: "jeju2",
                            ),
                          ),
                        ),
                        Positioned(
                          left: 163,
                          top: 80,
                          child: Text(
                            "\$170",
                            style: TextStyle(
                              fontSize: 29,
                              fontFamily: "jeju2",
                              color: Color(0xff070D30).withOpacity(1),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 234,
                          top: 89,
                          child: Text(
                            "Night",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "jeju2",
                              color: CupertinoColors.inactiveGray.withOpacity(0.80),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Stack(
                    children: [
                      Container(
                        width: width * 0.89,
                        height: height * 0.11,
                        decoration: BoxDecoration(
                          color: Color(0xffFFFFFF).withOpacity(1),
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                color:
                                CupertinoColors.inactiveGray.withOpacity(0.26),
                                blurRadius: 4,
                                offset: Offset(0, 3)),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 13,
                        left: 20,
                        child: Row(
                          children: [
                            Text(
                              "Check In",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "jeju2",
                                color: Color(0xff070D30).withOpacity(1),
                              ),
                            ),
                            SizedBox(
                              width: 160,
                            ),
                            Text(
                              datevalue.checkInDate,
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "jeju2",
                                color: Color(0xff070D30).withOpacity(1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 40,
                        left: 20,
                        child: Row(
                          children: [
                            Text(
                              "Guest",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "jeju2",
                                color: Color(0xff070D30).withOpacity(1),
                              ),
                            ),
                            SizedBox(
                              width: 180,
                            ),
                            Text(
                              datevalue.value.toString(),
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "jeju2",
                                color: Color(0xff070D30).withOpacity(1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 69,
                        left: 20,
                        child: Row(
                          children: [
                            Text(
                              "Check Out",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "jeju2",
                                color: Color(0xff070D30).withOpacity(1),
                              ),
                            ),
                            SizedBox(
                              width: 150,
                            ),
                            Text(
                              datevalue.checkOutDate,
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "jeju2",
                                color: Color(0xff070D30).withOpacity(1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 17),
                  Stack(
                    children: [
                      Container(
                        width: width * 0.89,
                        height: height * 0.15,
                        decoration: BoxDecoration(
                          color: Color(0xffFFFFFF).withOpacity(1),
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                color: CupertinoColors.inactiveGray
                                    .withOpacity(0.26),
                                blurRadius: 4,
                                offset: Offset(0, 3)),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 7,
                        left: 20,
                        child: Row(
                          children: [
                            Text(
                              "Amount 3 Days",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "jeju2",
                                color: Color(0xff070D30).withOpacity(1),
                              ),
                            ),
                            SizedBox(
                              width: 140,
                            ),
                            Text(
                              "\$340",
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: "jeju2",
                                color: Color(0xff070D30).withOpacity(1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: 20,
                        child: Row(
                          children: [
                            Text(
                              "Tax",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "jeju2",
                                color: Color(0xff070D30).withOpacity(1),
                              ),
                            ),
                            SizedBox(
                              width: 215,
                            ),
                            Text(
                              "\$5",
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: "jeju2",
                                color: Color(0xff070D30).withOpacity(1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 95,
                        left: 20,
                        child: Row(
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "jeju2",
                                color: Color(0xff070D30).withOpacity(1),
                              ),
                            ),
                            SizedBox(
                              width: 205,
                            ),
                            Text(
                              "\$345",
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: "jeju2",
                                color: Color(0xff070D30).withOpacity(1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 17,),
                  Stack(
                    children: [
                      Center(
                        child: Container(
                          width: width * 0.89,
                          height: height * 0.25,
                          decoration: BoxDecoration(
                            color: Color(0xffFFFFFF).withOpacity(1),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  color: CupertinoColors.inactiveGray
                                      .withOpacity(0.26),
                                  blurRadius: 4,
                                  offset: Offset(0, 3)),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 17),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Image.asset("assets/image/gpay.png",scale: 2.89,),
                              title: Text("Google Pay",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: "jeju2",
                                  color: Color(0xff070D30).withOpacity(1),
                                ),
                              ),
                              subtitle: Text("Payment",
                                style: TextStyle(
                                    fontFamily: "jeju2",
                                    fontSize: 14,
                                    color: CupertinoColors.systemGrey.withOpacity(0.80)
                                ),
                              ),
                              trailing: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Transform.scale(
                                  scale: 1.23,
                                  child: Radio(
                                    value:"gpay",
                                    groupValue: selectPayment,
                                    onChanged: (String? val) {
                                      setState(() {
                                        selectPayment = val!;
                                      });
                                    },
                                    activeColor: Color(0xff061673).withOpacity(1),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top:75),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Image.asset("assets/image/Pypal.png",scale: 2.89,),
                              title: Text("Paypal",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: "jeju2",
                                  color: Color(0xff070D30).withOpacity(1),
                                ),
                              ),
                              subtitle: Text("Payment",
                                style: TextStyle(
                                    fontFamily: "jeju2",
                                    fontSize: 14,
                                    color: CupertinoColors.systemGrey.withOpacity(0.80)
                                ),
                              ),
                              trailing: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Transform.scale(
                                  scale: 1.23,
                                  child: Radio(
                                    value:"paypal",
                                    groupValue: selectPayment,
                                    onChanged: (String? val) {
                                      setState(() {
                                        selectPayment = val!;
                                      });
                                    },
                                    activeColor: Color(0xff061673).withOpacity(1),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 14,top:150),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Image.asset("assets/image/apple pay.png",scale: 2.89,),
                              title: Text("Apple Pay",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: "jeju2",
                                  color: Color(0xff070D30).withOpacity(1),
                                ),
                              ),
                              subtitle: Text("Payment",
                                style: TextStyle(
                                    fontFamily: "jeju2",
                                    fontSize: 14,
                                    color: CupertinoColors.systemGrey.withOpacity(0.80)
                                ),
                              ),
                              trailing: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Transform.scale(
                                  scale: 1.23,
                                  child: Radio(
                                    value:"applepay",
                                    groupValue: selectPayment,
                                    onChanged: (String? val) {
                                      setState(() {
                                        selectPayment = val;
                                      });
                                    },
                                    activeColor: Color(0xff061673).withOpacity(1),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 40,),
                  Container(
                    width: width * 0.85,
                    height: height * 0.07,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xff061673).withOpacity(1),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            ));
                      },
                      child: Text(
                        "Pay",
                        style: TextStyle(
                            fontFamily: "jeju2",
                            fontSize: 28,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        ));
  }
}
