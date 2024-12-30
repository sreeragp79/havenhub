import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haven_hub/Provider/MainProvider.dart';
import 'package:haven_hub/user/Hotel%20Display.dart';
import 'package:provider/provider.dart';
import '../models/userModel.dart';
import '../user/Favorite.dart';
import '../user/Home.dart';
import '../user/Profile.dart';
import 'Add Option.dart';
import 'List of Bookings.dart';
import 'Update option.dart';


class AdminList extends StatefulWidget {
  AdminList({super.key});

  @override
  State<AdminList> createState() => _allClassState();
}

class _allClassState extends State<AdminList> {
  List<String> rating = [
    "assets/image/32 re.png",
    "assets/image/45 rev.png",
    "assets/image/55 re.png",
    "assets/image/78 re.png",
    "assets/image/89 re.png",
    "assets/image/100 re.png",
    "assets/image/500 re.png",
    "assets/image/170 re.png",
    "assets/image/78 re.png",
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
            "Admin List",
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
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      value2.clearField1();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddAdmin(),));
                    },
                    icon: Icon(Icons.add),
                    iconSize: height * 0.03,
                  ),
                  IconButton(
                    onPressed: () {
                      value2.getBookingDetails();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Listofbooking(),));
                    },
                    icon: Icon(Icons.list_alt),
                    iconSize: height * 0.03,
                  ),
                ],
              ),
            );
          },
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AdminUpdate(hotel: item),
                              ),
                            );
                          },
                          child: Container(
                            width: width * 0.90,
                            height: height * 0.14,
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
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(height / 98.8),
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
                                Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: height / 74.16),
                                    Padding(
                                      padding: EdgeInsets.only(left: width / 68.5),
                                      child: Text(
                                        item.name,
                                        style: TextStyle(
                                          fontSize: width / 22.8,
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
                                    // SizedBox(height: height / 300.5),
                                    Padding(
                                      padding: EdgeInsets.only(left: width / 91.33),
                                      child: Image.asset(rating[index], scale: width / 100.44),
                                    ),
                                    // SizedBox(height: height / 400.88),
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
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                favorite[index] = !favorite[index];
                                              });
                                            },
                                            icon: Icon(
                                              Icons.favorite,
                                              color: favorite[index] ? Colors.red : Colors.grey,
                                            ),
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
