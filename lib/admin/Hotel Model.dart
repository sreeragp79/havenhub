import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haven_hub/Provider/MainProvider.dart';
import 'package:provider/provider.dart';

import '../user/Book Now.dart';
import '../user/Review.dart';

class HotelModel extends StatefulWidget {
  const HotelModel({super.key});

  @override
  State<HotelModel> createState() => _CaliforniaState();
}

class _CaliforniaState extends State<HotelModel> {
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
            "HotelModel",
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
                        child: Container(
                          width: width / 1.11,
                          height: height / 3.70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(31),
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage("assets/image/List 1.png"),
                                  fit: BoxFit.fill)),
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
                            "Beach Hotel California",
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
                            "Deichweg 3, 24217 Kalifornien",
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
                                    " Located only 100 m away from the\n"
                                        " white sandy beaches of the Baltic Sea,\n"
                                        " modern rooms with free WiFi access\n"
                                        " and a design restaurant.",
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
                                Positioned(
                                  left: width / 1.40,
                                  top: height / 3.07,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: width / 22.83),
                                    child: Image.asset(
                                      "assets/image/170 rat.png",
                                      scale: width / 200.75,),
                                  ),
                                ),
                                SizedBox(height: height / 20.02,),
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
                    left: width / 1.40,
                    top: height / 3.07,
                    child: Image.asset(
                      "assets/image/Cal list.png", scale: width / 102.75,),
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
                            builder: (context) => Book(),));
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
    );
  }
}

