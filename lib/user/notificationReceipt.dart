import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haven_hub/Provider/MainProvider.dart';
import 'package:haven_hub/models/userModel.dart';
import 'package:provider/provider.dart';
import 'Home.dart';

class notificatioReceipt extends StatefulWidget {
  BookingGetAdmin noti;

  notificatioReceipt({super.key,required this.noti});
  @override
  State<notificatioReceipt> createState() => _ReceiptState();
}

class _ReceiptState extends State<notificatioReceipt> {
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
            "Receipt",
            style: TextStyle(fontSize: 27, fontFamily: "jeju2"),
          ),
          centerTitle: true,
          backgroundColor: Color(0xffFFFFFF).withOpacity(1),
          leading: Padding(
            padding: EdgeInsets.only(left: width/34.25),
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
          builder: (context,value,child) {
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
                              color: Colors.white,
                            ),
                            child: Image.network(
                              widget.noti.image,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 164,
                          top: 20,
                          child: Text(
                            widget.noti.resortName,
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff070D30).withOpacity(1),
                              fontFamily: "jeju2",
                            ),
                          ),
                        ),
                        Positioned(
                            left: 163,
                            top: 50,
                            child: Image.asset(
                              "assets/image/500 re.png",
                              scale: 3.56,
                            )),
                        Positioned(
                          left: 163,
                          top: 80,
                          child: Text(
                            widget.noti.price,
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
                              value.checkInDate,
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
                              value.value.toString(),
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
                              value.checkOutDate,
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
                        height: height * 0.22,
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
                              "Amount ${value.duration} Days",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "jeju2",
                                color: Color(0xff070D30).withOpacity(1),
                              ),
                            ),
                            SizedBox(
                              width: 118,
                            ),
                            Text(
                              value.calculateTotalAmount(value.value, value.duration,widget.noti.price),
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
                              width: 192,
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
                        top: 100,
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
                              width: 183,
                            ),
                            Text(
                              value.includeTax(value.value, value.duration,widget.noti.price),
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
                        top: 150,
                        left: 20,
                        child: Row(
                          children: [
                            Text(
                              "Status",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "jeju2",
                                color: Color(0xff070D30).withOpacity(1),
                              ),
                            ),
                            SizedBox(
                              width: 177,
                            ),
                            Container(
                              width: width*0.12,
                              height: height* 0.03,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                  border: Border.all(color: Colors.blue,width: 2)
                              ),
                              child:  Center(
                                child: Text("Paid",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "jeju2",
                                    color: Color(0xff070D30).withOpacity(1),
                                  ),
                                ),
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
                      Container(
                        width: width * 0.89,
                        height: height * 0.15,
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
                              "Name",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "jeju2",
                                color: Color(0xff070D30).withOpacity(1),
                              ),
                            ),
                            SizedBox(
                              width: 185,
                            ),
                            Text(
                              value.firstnameController.text,
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
                        top: 50,
                        left: 20,
                        child: Row(
                          children: [
                            Text(
                              "Number",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "jeju2",
                                color: Color(0xff070D30).withOpacity(1),
                              ),
                            ),
                            SizedBox(
                              width: 170,
                            ),
                            Text(
                              value.phoneController.text,
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
                        top: 80,
                        left: 20,
                        child: Row(
                          children: [
                            Text(
                              "Transaction id",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "jeju2",
                                color: Color(0xff070D30).withOpacity(1),
                              ),
                            ),
                            SizedBox(
                              width: 133,
                            ),
                            Text(
                              "2345567878678",
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
                  SizedBox(height: 23,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon:Icon(Icons.arrow_back,color: Colors.black.withOpacity(1),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));
                        },
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>Home() ,));
                        },
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 35),
                            child: Text("Back to Home ",
                              style: TextStyle(
                                color: Color(0xff070D30),
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
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
