import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haven_hub/user/strand.dart';
import 'All Class.dart';
import 'California.dart';
import 'ClubHouse.dart';
import 'Exclusive.dart';
import 'Favorite.dart';
import 'Meree.dart';
import 'Nester.dart';
import 'Notification.dart';
import 'Profile.dart';
import 'Strandhus.dart';
import 'Vovo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isChecked = false;


  List<String> carousalItems = [
    "assets/image/carousal 1.png",
    "assets/image/cAROUSAL 5.png",
    "assets/image/carousal 3.png",
    "assets/image/carousal 4.png",
  ];
  List<String> carousalItems2 = [
    "assets/image/ca 1.png",
    "assets/image/ca 2.png",
    "assets/image/ca 3.png",
    "assets/image/ca 4.png",
  ];
  List<String> carousaname = [
    "Beach Hotel California",
    "Hotel Strandräuber",
    "Meeresbrise",
    "Strandhus Windjammer",
  ];
  List<String> carousaname2 = [
    "Beach Hotel California",
    "Club House",
    "Nester Raga",
    "Vovo",
  ];
  List<String> rating = [
    "assets/image/4.5 rating.png",
    "assets/image/4.5 rating.png",
    "assets/image/4.5 rating.png",
    "assets/image/4.5 rating.png",
  ];
  List<String> rating2= [
    "assets/image/170 rat.png",
    "assets/image/150 rate.png",
    "assets/image/180 r.png",
    "assets/image/190m rate.png",
  ];
  List<String> logo = [
    "assets/image/exclusive logo.png",
    "assets/image/exclusive logo.png",
    "assets/image/exclusive logo.png",
    "assets/image/exclusive logo.png",
  ];
  List<String> rate = [
    "assets/image/170 rat.png",
    "assets/image/165 r.png",
    "assets/image/165 r.png",
    "assets/image/180 r.png",
  ];
  List<String> like = [
    "assets/image/Heart_01.png",
    "assets/image/Heart_01.png",
    "assets/image/Heart_01.png",
    "assets/image/Heart_01.png",
  ];
  dynamic page1(int index){
    switch(index){
      case 0: return California();
      case 1: return strand();
      case 2: return meree();
      case 3: return strandhus();
    }
  }
  dynamic page2(int index){
    switch(index){
      case 0: return California();
      case 1: return clubHouse();
      case 2: return nester();
      case 3: return  vovo();
    }
  }
  List<bool>favorite=[
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,

  ];
  // screen hight 890,
  // screen width 411,
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF).withOpacity(1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height / 20.17),
            Padding(
              padding: EdgeInsets.only(left: width / 1.20),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Noti(),
                      ));
                },
                icon: ImageIcon(
                  AssetImage("assets/image/Bell.png"),
                  size: width / 11.41,
                ),
              ),
            ),
            SizedBox(
              height: height / 600.33,
            ),
            Padding(
              padding: EdgeInsets.only(right: width / 6.7),
              child: Text(
                "WHAT ARE YOU\n"
                "GOING TO BOOK ?",
                style: TextStyle(
                  fontFamily: "aclo",
                  fontWeight: FontWeight.bold,
                  fontSize: width / 11.41,
                ),
              ),
            ),
            SizedBox(
              height: height / 44.5,
            ),
            Padding(
              padding: EdgeInsets.only(left: width / 69.68),
              child: Container(
                width: width / 1.20,
                child: TextField(
                  decoration: InputDecoration(
                      filled: true, // Set filled to true
                      fillColor: Color(0xffFFFFFF).withOpacity(1),
                      // Set the fill color// Set filled to true
                      hintText: "Search hotel",
                      hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(0.50),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: height / 42.38, horizontal: width / 13.7),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(45),
                        borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.16),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(45),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(
                            left: width / 20.55, right: width / 20.55),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey.withOpacity(0.30),
                          size: width / 12.08,
                        ),
                      )),
                ),
              ),
            ),
            SizedBox(
              height: height / 38.69,
            ),
            Padding(
              padding: EdgeInsets.only(left: width / 8.74),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AllClass(),
                          ));
                    },
                    child: Text(
                      "All Class",
                      style: TextStyle(
                        fontFamily: "jeju2",
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width / 20.55,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Exclusive(),
                          ));
                    },
                    child: Text(
                      "Exclusive",
                      style: TextStyle(
                        fontFamily: "jeju2",
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width / 2.30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AllClass(),
                          ));
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(
                          fontFamily: "jeju2",
                          color: CupertinoColors.inactiveGray),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 48.5,
            ),
            CarouselSlider.builder(
              itemCount: carousalItems.length,
              itemBuilder: (context, index, realIndex) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => page1(index),));
                      },
                      child: Container(
                        // margin: EdgeInsets.symmetric(horizontal: 3),
                        width: width / 1.1,
                        height: height / 5.99,

                        child: Row(
                          children: [
                            Image.asset(carousalItems[index]),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: height / 74.16),
                                Padding(
                                  padding: index == 2
                                      ? EdgeInsets.only(left: 15)
                                      : EdgeInsets.only(left: width / 27.4),
                                  child: Text(
                                    carousaname[index],
                                    style: TextStyle(
                                      fontSize: width / 20.8,
                                      color: Color(0xff070D30).withOpacity(1),
                                      fontFamily: "jeju2",
                                    ),
                                  ),
                                ),
                                SizedBox(height: height / 170.16),
                                Padding(
                                  padding: index == 1
                                      ? EdgeInsets.only(left: width / 27.22)
                                      : index == 2
                                          ? EdgeInsets.only(left: width / 25.25)
                                          : index == 3
                                              ? EdgeInsets.only(left: width / 26.50)
                                              : EdgeInsets.only(
                                                  left: width / 27.90),
                                  child: Image.asset(rating[index],
                                      scale: width / 119.13),
                                ),
                                SizedBox(height: width / 50.25),
                                Padding(
                                  padding: index == 1
                                      ? EdgeInsets.only(left: width / 24.32)
                                      : index == 2
                                          ? EdgeInsets.only(left: width / 24.32)
                                          : index == 3
                                              ? EdgeInsets.only(left: width / 24.32)
                                              : EdgeInsets.only(
                                                  left: width / 25.56),
                                  child: Image.asset(
                                    logo[index],
                                    scale: width / 137,
                                  ),
                                ),
                                SizedBox(height:index ==1 ?4 :height/148.33,),
                                Row(
                                  children: [
                                   Padding(
                                     padding:  EdgeInsets.only(left: width/27.4),
                                     child: Image.asset(rate[index],scale: width/137,),
                                   ),
                                    SizedBox(width: 50,),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isChecked = !isChecked;
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                            isChecked
                                                ? "Added to Favorites"
                                                : "Removed from Favorites",
                                            style: TextStyle(
                                              color: Colors.black.withOpacity(1),
                                              fontSize: 17,
                                            ),
                                          ),
                                          backgroundColor:
                                          Color(0xffFFFFFF).withOpacity(1),
                                          elevation: 5,
                                          behavior: SnackBarBehavior.floating,
                                          duration: Duration(
                                              seconds:
                                              2), // Duration of the SnackBar
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),
                                          ),
                                        ));
                                      },
                                      icon: Icon(
                                        Icons.favorite,
                                      ),
                                      color: isChecked
                                          ? Colors.red
                                          : CupertinoColors.inactiveGray,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xffFFFFFF).withOpacity(1),
                            borderRadius: BorderRadius.circular(32),
                            boxShadow: [
                              BoxShadow(
                                  color: CupertinoColors.inactiveGray
                                      .withOpacity(0.20),
                                  spreadRadius: 1,
                                  blurRadius: 9,
                                  offset: Offset(0, 3)),
                            ],
                        ),
                      ),
                    ),
                  ],
                );
              },
              options: CarouselOptions(
                height: height/4.94,
                viewportFraction: 1,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 5),
              ),

            ),
            SizedBox(height: height/800.16,),
            Padding(
              padding:  EdgeInsets.only(right: width/1.78),
              child: Text(
                "Latest Popular",
                style: TextStyle(
                  fontSize: width / 25,
                  fontFamily: "jeju2",
                  color: CupertinoColors.inactiveGray.withOpacity(0.67)
                ),
              ),
            ),
            SizedBox(height: height/59.33,),
            CarouselSlider.builder(
              itemCount: carousalItems2.length,
              itemBuilder: (context, index, realIndex) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => page2(index),));
                  },
                  child: Container(
                    width: 200,
                    margin: EdgeInsets.symmetric(vertical: height/89),
                    decoration: BoxDecoration(
                      color:Color(0xffFFFFFF).withOpacity(1),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.20),
                            spreadRadius: 1,
                            blurRadius: 9,
                            offset: Offset(0, 3)
                        ),
                      ],
                    ),
                    child:Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height/111.25,),
                        Center(
                          child: Container(
                            width: width/2.22,
                            height: height/4.81,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage(carousalItems2[index],),fit: BoxFit.fill
                              )
                            ),
                          ),
                        ),
                          SizedBox(height: height/98.88),
                          Padding(
                            padding:  EdgeInsets.only(left: width/21.63),
                            child: Text(carousaname2[index],
                              style: TextStyle(
                                fontSize: width / 23.8,
                                color: Color(0xff070D30).withOpacity(1),
                                fontFamily: "jeju2",
                              ),
                            ),
                          ),
                        SizedBox(height: height/59.33,),
                        Padding(
                          padding: EdgeInsets.only(left: width/21.63),
                          child: Image.asset(rating2[index],scale: width/137),
                        )
                      ],
                    )
                  ),
                );
              },
              options: CarouselOptions(
                // enlargeCenterPage: true,
                height: 300,
                viewportFraction: 0.53,
                // enlargeCenterPage: true,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: height * 0.08,
        // color: Colors.transparent,
        color: Colors.white,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ));
              },
              icon: ImageIcon(AssetImage("assets/image/House_01.png")),
              iconSize: height * 0.03,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Favorite(),
                    ));
              },
              icon: ImageIcon(AssetImage("assets/image/Heart_01.png")),
              iconSize: height * 0.03,
            ),
            IconButton(
              onPressed: () {

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profile(),
                    ));
              },
              icon: ImageIcon(AssetImage("assets/image/User_072.png")),
              iconSize: height * 0.03,
            )
          ],
        ),
      ),
    );
  }
}
