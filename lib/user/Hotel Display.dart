import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haven_hub/Provider/MainProvider.dart';
import 'package:provider/provider.dart';

import '../models/userModel.dart';
import 'Book Now.dart';
import 'Review Adding.dart';
import 'Review.dart';



class Details1 extends StatefulWidget {
  ResortAddingDetails hotel;
  Details1({super.key,required this.hotel});

  @override
  State<Details1> createState() => _CaliforniaState();

}

class _CaliforniaState extends State<Details1> {


  @override
  Widget build(BuildContext context) {

    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF).withOpacity(1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.05),
        child: AppBar(
          title: Text(
            "Details",
            style: TextStyle(fontSize: 27, fontFamily: "jeju2"),
          ),
          centerTitle: true,
          backgroundColor: Color(0xffFFFFFF).withOpacity(1),
          leading: Padding(
            padding: EdgeInsets.only(left: width / 34.25),
            child: IconButton(
              icon: Icon(Icons.arrow_back,
                  color:
                  Colors.black.withOpacity(0.7)), // Specify icon and color
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: Consumer<MainProvider>(
          builder: (context, guestval, child) {
            return SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: height / 150.33,
                      ),
                      Center(
                        child: InkWell(
                          child: Container(
                            width: width / 1.11,
                            height: height / 3.70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(31),
                                color: Colors.white,
                                image: DecorationImage(
                                    image: NetworkImage(widget.hotel.image!),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height / 63.57,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: width / 10.81),
                          child: Text(
                           widget.hotel.name!,
                            style: TextStyle(
                              fontSize: width / 18.8,
                              color: Color(0xff070D30).withOpacity(1),
                              fontFamily: "jeju2",
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: width / 10.81),
                          child: Text(
                           widget.hotel.place!,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.60)
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height / 22.54,
                      ),
                      Stack(
                        children: [
                          Container(
                            width: width / 1.11,
                            height: height / 2.07,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(31),
                                color: CupertinoColors.inactiveGray.withOpacity(
                                    0.15)
                            ),
                            child: Column(crossAxisAlignment: CrossAxisAlignment
                                .start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: height / 59.5, left: width / 20.86),
                                  child: Text("Information",
                                    style: TextStyle(
                                      fontSize: width / 20.8,
                                      color: Color(0xff070D30).withOpacity(1),
                                      fontFamily: "jeju2",
                                    ),
                                  ),
                                ),
                                SizedBox(height: height / 120.16,),
                                Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Text(
                                      widget.hotel.information!,
                                    style: TextStyle(
                                        color: Colors.blueGrey.withOpacity(
                                            0.78),
                                        fontSize: 16
                                    ),
                                  ),
                                ),
                                SizedBox(height: height / 49.44,),
                                Padding(
                                  padding: EdgeInsets.only(left: width / 22.83),
                                  child: Image.asset(
                                    "assets/image/cali riv.png",
                                    scale: width / 100.75,),
                                ),
                                SizedBox(height: height / 90.44,),
                                Padding(
                                  padding: EdgeInsets.only(left: width/19.83),
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => Review(),));
                                      },
                                      child: Image.asset("assets/image/32 re.png",scale: width/100.75,)),
                                ),
                                SizedBox(height: height / 20.02,),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: width / 22.83),
                                  child: Row(
                                    children: [
                                      Text( guestval.totalAmount(widget.hotel.price).toString(),
                                        style: TextStyle(
                                            fontSize: 40,
                                            fontFamily: "jeju2"
                                        ),
                                      ),
                                      SizedBox(width: 16,),
                                      Text("Night",
                                        style: TextStyle(
                                            fontFamily: "jeju2",
                                            color: CupertinoColors.inactiveGray,
                                          fontSize: 23
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: height / 30.02,),
                                Positioned(
                                  left: width / 1.40,
                                  top: height / 3.07,
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          left: width / 15.83),
                                      child: Text("Guest",
                                        style: TextStyle(
                                            fontFamily: "jeju2",
                                            fontSize: 22,
                                            color: Colors.black
                                        ),
                                      )
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Container(
                                    width: 125,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(23),
                                        color: Color(0xffFFFFFF).withOpacity(1),
                                        border: Border.all(
                                            color: Colors.grey.withOpacity(
                                                0.45), width: 0.45)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceEvenly,
                                      children: [
                                        IconButton(
                                          onPressed: guestval.decrementValue,
                                          icon: Icon(Icons.remove),
                                        ),
                                        Center(child: Text(guestval.value.toString(),
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),

                                        ),
                                        IconButton(
                                          onPressed: guestval.incrementValue,
                                          icon: Icon(Icons.add),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    left: width / 1.41,
                    top: height / 3.07,
                    // child: Image.asset(
                    //   "assets/image/Cal list.png", scale: width / 102.75,),
                    child: Container(
                      width: 90,
                      height: 479,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(30)
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0.10,0.67),
                          ),
                        ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: Column(
                          children: [
                            SizedBox(height: 18,),
                            Text(
                              guestval.totalAmount(widget.hotel.price).toString(),
                              style: TextStyle(
                                  fontSize: 28,
                                  fontFamily: "jeju2"
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: Text("Night",
                                style: TextStyle(
                                    fontFamily: "jeju2",
                                    color: CupertinoColors.inactiveGray,
                                    fontSize: 13
                                ),
                              ),
                            ),
                            SizedBox(height: 23,),
                            Image(image: AssetImage("assets/image/wifisd.png",),
                              height: 30,width: 30,color: Colors.grey.withOpacity(0.67)
                            ), SizedBox(height: 23,),
                            Image(image: AssetImage("assets/image/desktop_light@3asax.png",),
                              height: 30,width: 30,color: Colors.grey.withOpacity(0.67)
                            ), SizedBox(height: 23,),
                            Image(image: AssetImage("assets/image/Basket_alt_3_light@3asx.png",),
                              height: 30,width: 30,color: Colors.grey.withOpacity(0.67)
                            ), SizedBox(height: 23,),
                            Image(image: AssetImage("assets/image/Book_open_lixcght.png",),
                              height: 30,width: 30,color: Colors.grey.withOpacity(0.67)
                            ), SizedBox(height: 23,),
                            Image(image: AssetImage("assets/image/drink_light.png",),
                              height: 30,width: 30,color: Colors.grey.withOpacity(0.67)
                            ), SizedBox(height: 26,),
                            Image(image: AssetImage("assets/image/Vector 72.png",),
                              height: 24,width: 24,color: Colors.grey.withOpacity(0.67)
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(left: 210,
                    top: 698,
                    child: Container(
                      width: 158,
                      height: 57,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xff061673).withOpacity(1),
                        ),
                        onPressed: () {
                          guestval.incrementValue();
                          guestval.decrementValue();
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Book(hotel: widget.hotel,),));
                        },
                        child: Text("Book Now",
                          style: TextStyle(
                              fontFamily: "jeju2",
                              fontSize: 20,
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => ReviewAdd(),
      //       ),
      //     );
      //   },
      //   child: Icon(Icons.add),
      //   backgroundColor: Colors.blue,
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(23)),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

