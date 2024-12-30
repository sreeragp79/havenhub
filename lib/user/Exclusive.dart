import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haven_hub/Provider/LoginProvider.dart';
import 'package:haven_hub/Provider/MainProvider.dart';
import 'package:haven_hub/user/Hotel%20Display.dart';
import 'package:provider/provider.dart';

import '../models/userModel.dart';
import 'Favorite.dart';
import 'Home.dart';
import 'Profile.dart';

class Exclusive extends StatefulWidget {
  Exclusive({super.key});

  @override
  State<Exclusive> createState() => _allClassState();
}

class _allClassState extends State<Exclusive> {
  List<String> rating = [
    "assets/image/32 re.png",
    "assets/image/45 rev.png",
    "assets/image/55 re.png",
    "assets/image/78 re.png",
    "assets/image/89 re.png",
    "assets/image/100 re.png",
    "assets/image/500 re.png",
    "assets/image/170 re.png",
    "assets/image/250 re.png",
    "assets/image/560 re.png",
    "assets/image/540 re.png",
  ];

  List<bool> favorite = List.filled(11, false); // Initialize a list of false values

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF).withOpacity(1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.05),
        child: AppBar(
          title: Text(
            "All Class",
            style: TextStyle(fontSize: 27, fontFamily: "jeju2"),
          ),
          centerTitle: true,
          backgroundColor: Color(0xffFFFFFF).withOpacity(1),
          leading: Padding(
            padding: EdgeInsets.only(left: width / 34.25),
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black.withOpacity(0.7)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: Consumer<MainProvider>(
          builder: (context,value2,child) {
            return BottomAppBar(
              height: height * 0.07,
              color: Colors.transparent,
              elevation: 0,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));
                    },
                    icon: ImageIcon(AssetImage("assets/image/House_01.png")),
                    iconSize: height * 0.03,
                  ),
                  Consumer<MainProvider>(
                      builder: (context12, value, child) {
                        return IconButton(
                          onPressed: () async {
                            await value.getExclusiveResorts();
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Favorite(),));
                          },
                          icon: ImageIcon(AssetImage("assets/image/Heart_01.png")),
                          iconSize: height * 0.03,
                        );
                      }
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(),));
                    },
                    icon: ImageIcon(AssetImage("assets/image/User_02.png")),
                    iconSize: height * 0.03,
                  ),
                ],
              ),
            );
          }
      ),
      body: Consumer<MainProvider>(
        builder: (context, value, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  physics: ScrollPhysics(),
                  itemCount: value.ExclusiveList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    ResortAddingDetails item = value.ExclusiveList[index];
                    return Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: height / 90.25),
                        child: GestureDetector(
                          onTap: () {
                            value.clearGuestValue();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Details1(hotel: item),
                              ),
                            );
                          },
                          child: Container(
                            width: width * 0.90,
                            height: height * 0.14,
                            decoration: BoxDecoration(
                              //
                              color: Colors.white,
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
                            child: Row(
                              children: [
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Container(
                                      width: 124,
                                      height: 95,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(22)
                                      ),
                                      child: Container(
                                        width: 120,
                                        height: 130,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(item.image)
                                          ),
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(22),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: height / 74.16),
                                    Padding(
                                      padding: EdgeInsets.only(left: width / 68.5),
                                      child: Text(
                                        item.name,
                                        style: TextStyle(
                                          fontSize:15,
                                          color: Color(0xff070D30).withOpacity(1),
                                          fontFamily: "jeju2",
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: height / 350.66),
                                    Padding(
                                      padding: EdgeInsets.only(left: width / 58.71),
                                      child: Text(
                                        item.place,
                                        style: TextStyle(
                                          fontSize: width / 27.4,
                                          fontFamily: "jeju2",
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: height / 300.5),
                                    Padding(
                                      padding: EdgeInsets.only(left: width / 91.33),
                                      child: Image.asset(rating[index], scale: width / 100.44),
                                    ),
                                    SizedBox(height: height / 450.88),
                                    Padding(
                                      padding: EdgeInsets.only(left: width / 82.2),
                                      child: Row(
                                        children: [
                                          Text(
                                            item.price,
                                            style: TextStyle(
                                              fontSize: width / 15.22,
                                              fontFamily: "jeju2",
                                              color: Color(0xff070D30).withOpacity(1),
                                            ),
                                          ),
                                          SizedBox(width: 80),
                                          Consumer<Loginprovider>(
                                              builder: (context2,value2,child) {
                                                return IconButton(
                                                  onPressed: () {
                                                    // String userId= value2.signUserId[index].userId;
                                                    String resortId = item.id;
                                                    value2.addToFavoriteResorts(value2.loginUserId,resortId);
                                                    setState(() {
                                                      favorite[index] = !favorite[index];
                                                    });
                                                  },
                                                  icon: Icon(
                                                    Icons.favorite,
                                                    color: value2.favoriteResortList.contains(item.id) ? Colors.red : Colors.grey,
                                                  ),
                                                );
                                              }
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
