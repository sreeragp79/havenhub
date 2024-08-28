import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Confirm Pay.dart';

class PaymentFailed extends StatefulWidget {
  const PaymentFailed({super.key});

  @override
  State<PaymentFailed> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentFailed> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffD9D9D9).withOpacity(1),
      body: Column(
        children: [
          SizedBox(
            height: 247,
          ),
          Center(
            child: Stack(
              children: [
                Container(
                  width: width * 0.70,
                  height: height * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(75),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 70),
                    child: Image.asset(
                      "assets/image/failed.png",
                      scale: 2.90,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
                Positioned(
                  left: 53,
                  top: 207,
                  child: Text(
                    "Payment Failed  ",
                    style: TextStyle(
                      fontSize: 29,
                      fontFamily: "jeju2",
                    ),
                  ),
                ),
                Positioned(left: 50,top: 250,
                  child: IconButton(
                    icon:Icon(Icons.arrow_back,color: Colors.black.withOpacity(1),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmPay(),));
                    },
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>ConfirmPay() ,));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left:94,top: 265),
                    child: Text("Back to Log In ",
                      style: TextStyle(
                        color: Color(0xff070D30),
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
