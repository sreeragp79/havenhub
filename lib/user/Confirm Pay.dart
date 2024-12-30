
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haven_hub/Provider/MainProvider.dart';
import 'package:provider/provider.dart';
import '../admin/List of Bookings.dart';
import '../models/userModel.dart';
import 'Login Page.dart';
import 'Paymet Successful.dart';
import 'Receipt.dart';

  class ConfirmPay extends StatefulWidget {
    ResortAddingDetails hotel;
    ConfirmPay({super.key,required this.hotel});
    @override
    State<ConfirmPay> createState() => _ConfirmPayState();
  }

  class _ConfirmPayState extends State<ConfirmPay> {
    String? selectPayment ="";
    TextEditingController firstnameController = TextEditingController();

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
              builder: (context, datevalue, child) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 23),
                      Center(
                        child: Container(
                          width: width * 0.89,
                          height: height * 0.15,
                          decoration: BoxDecoration(
                            color: Color(0xffFFFFFF).withOpacity(1),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  color: CupertinoColors.inactiveGray.withOpacity(0.26),
                                  blurRadius: 4,
                                  offset: Offset(0, 3)),
                            ],
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only( left: 12),
                                child: Container(
                                  height: height * 0.12,
                                  width: width * 0.32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.white,
                                  ),
                                  child: Container(
                                    width: 89,
                                    height: 78,
                                    decoration: BoxDecoration(
                                      color:Colors.white,
                                      borderRadius: BorderRadius.circular(22),
                                      image: DecorationImage(
                                        fit:BoxFit.fill,
                                        image: NetworkImage(widget.hotel.image,)
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 20),
                                  Text(
                                    widget.hotel.name,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff070D30).withOpacity(1),
                                      fontFamily: "jeju2",
                                    ),
                                  ),
                                  SizedBox(height: 7),
                                  Image.asset(
                                    "assets/image/4.5 rating.png",
                                    scale: 3.56,
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Text(
                                        widget.hotel.price,
                                        style: TextStyle(
                                          fontSize: 29,
                                          fontFamily: "jeju2",
                                          color: Color(0xff070D30).withOpacity(1),
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                      Text(
                                        "Per Day",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: "jeju2",
                                          color: CupertinoColors.inactiveGray.withOpacity(0.80),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 17),
                      Container(
                        width: width * 0.89,
                        height: height * 0.11,
                        decoration: BoxDecoration(
                          color: Color(0xffFFFFFF).withOpacity(1),
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2,
                              color: CupertinoColors.inactiveGray.withOpacity(0.26),
                              blurRadius: 4,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 13, left: 20),
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
                                  SizedBox(width: 190,),
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
                            Padding(
                              padding: EdgeInsets.only(top: height * 0.0112,left:width * 0.0486,),
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
                                  SizedBox(width: 209,),
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
                            Padding(
                              padding: EdgeInsets.only(top: 10, left: 20),
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
                                  SizedBox(width: 180,),
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
                      ),
                      SizedBox(height: 17),
                      Container(
                        width: width * 0.89,
                        height: height * 0.15,
                        decoration: BoxDecoration(
                          color: Color(0xffFFFFFF).withOpacity(1),
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2,
                              color: CupertinoColors.inactiveGray.withOpacity(0.26),
                              blurRadius: 4,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: height * 0.018,left: width * 0.0486),
                              child: Row(
                                children: [
                                  Text(
                                    "Amount ${datevalue.duration} Days",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "jeju2",
                                      color: Color(0xff070D30).withOpacity(1),
                                    ),
                                  ),
                                  SizedBox(width: 153,),
                                  Text(
                                    datevalue.calculateTotalAmount(datevalue.value,
                                        datevalue.duration, widget.hotel.price),
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: "jeju2",
                                      color: Color(0xff070D30).withOpacity(1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only( left: 20),
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
                                  SizedBox(width: 225,),
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
                            Padding(
                              padding: EdgeInsets.only( left: 20),
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
                                  SizedBox(width: 216,),
                                  Text(
                                    datevalue.includeTax(datevalue.value,
                                        datevalue.duration, widget.hotel.price),
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
                      ),
                      SizedBox(height: 17),
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
                                color: CupertinoColors.inactiveGray.withOpacity(0.26),
                                blurRadius: 4,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                leading: Image.asset("assets/image/gpay.png", scale: 3.50),
                                title: Text(
                                  "Google Pay",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: "jeju2",
                                    color: Color(0xff070D30).withOpacity(1),
                                  ),
                                ),
                                subtitle: Text(
                                  "Payment",
                                  style: TextStyle(
                                    fontFamily: "jeju2",
                                    fontSize: 14,
                                    color: CupertinoColors.systemGrey.withOpacity(0.80),
                                  ),
                                ),
                                trailing: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Transform.scale(
                                    scale: 1.23,
                                    child: Radio(
                                      value: "gpay",
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
                              ListTile(
                                leading: Image.asset("assets/image/ASC.png", scale: 4.90),
                                title: Text(
                                  "Paypal",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: "jeju2",
                                    color: Color(0xff070D30).withOpacity(1),
                                  ),
                                ),
                                subtitle: Text(
                                  "Payment",
                                  style: TextStyle(
                                    fontFamily: "jeju2",
                                    fontSize: 14,
                                    color: CupertinoColors.systemGrey.withOpacity(0.80),
                                  ),
                                ),
                                trailing: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Transform.scale(
                                    scale: 1.23,
                                    child: Radio(
                                      value: "paypal",
                                      groupValue: selectPayment,
                                      onChanged: (String? value) {
                                        setState(() {
                                          selectPayment = value!;
                                        });
                                      },
                                      activeColor: Color(0xff061673).withOpacity(1),
                                    ),
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: Image.asset("assets/image/apple pay.png", scale: 3.50),
                                title: Text(
                                  "Apple Pay",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: "jeju2",
                                    color: Color(0xff070D30).withOpacity(1),
                                  ),
                                ),
                                subtitle: Text(
                                  "Payment",
                                  style: TextStyle(
                                    fontFamily: "jeju2",
                                    fontSize: 14,
                                    color: CupertinoColors.systemGrey.withOpacity(0.80),
                                  ),
                                ),
                                trailing: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Transform.scale(
                                    scale: 1.23,
                                    child: Radio(
                                      value: "applepay",
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
                      ),
                    SizedBox(height: 40,),
                      Container(
                        width: width * 0.85,
                        height: height * 0.07,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Color(0xff061673).withOpacity(1),
                          ),
                          onPressed:()async{
                           await datevalue.showBookingSuccessNotification();
                           await datevalue.userBookingDetails(widget.hotel);
                           await datevalue.getNotification();
                           await Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PaymentSuccess(hotel: widget.hotel,),
                                )
                            );
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
        )
      );
  }
}
