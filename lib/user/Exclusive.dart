import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haven_hub/user/strand.dart';

import 'Am Seagle.dart';
import 'California.dart';
import 'ClubHouse.dart';
import 'Conti.dart';
import 'Favorite.dart';
import 'Home.dart';
import 'Klaus.dart';
import 'Meree.dart';
import 'Nester.dart';
import 'Profile.dart';
import 'Stay Vista.dart';
import 'Strandhus.dart';
import 'Vovo.dart';

class Exclusive extends StatefulWidget {
  const Exclusive({super.key});

  @override
  State<Exclusive> createState() => _allClassState();
}

class _allClassState extends State<Exclusive> {
  bool isChecked= true;

  int currentIndex = 0;

  List<String>image=[
    "assets/image/california2.png",
    "assets/image/strand.png",
    "assets/image/meres.png",
    "assets/image/strand2.png",
    "assets/image/clubHouse.png",
    "assets/image/nesterrr.png",
    "assets/image/vovo.png",
    "assets/image/stayvista.png",
    "assets/image/klaudr.png",
    "assets/image/contihasna.png",
    "assets/image/amsige.png",
  ];
  List<String>titile=[
    "Beach Hotel California",
    "Hotel Strandrauber",
    "Meeresbrise",
    "Strandhus Windjammer",
    "Club House",
    "Nester Raga",
    "Vovo",
    "Stay Vista",
    "Klausdorfer Hof",
    "Conti Hansa",
    "Am Segelhafen",
  ];
  List<String>subTitile=[
    "Deichweg,Kalifornien",
    "Alabama",
    "Kalifornien",
    "Arkansas",
    "Colorado",
    "Michigan",
    "Missouri",
    "Missouri",
    "Germany",
    "Germany",
    "Germany",
  ];
  List<String>rating=[
    "assets/image/32 re.png",
    "assets/image/45 rev.png",
    "assets/image/55 re.png",
    "assets/image/78 re.png",
    "assets/image/89 re.png",
    "assets/image/100 re.png",
    "assets/image/500 re.png",
    "assets/image/170 re.png",
    "assets/image/570 re.png",
    "assets/image/560 re.png",
    "assets/image/540 re.png",
  ];
  List<String>price=[
    "\$170",
    "\$165",
    "\$165",
    "\$180",
    "\$150",
    "\$180",
    "\$190",
    "\$170",
    "\$178",
    "\$178",
    "\$167",
  ];
  List<String>heart=[
    "assets/image/Favorite_.png",
    "assets/image/Favorite_.png",
    "assets/image/Favorite_.png",
    "assets/image/Favorite_.png",
    "assets/image/Favorite_.png",
    "assets/image/Favorite_.png",
    "assets/image/Favorite_.png",
    "assets/image/Favorite_.png",
    "assets/image/Favorite_.png",
    "assets/image/Favorite_.png",
    "assets/image/Favorite_.png",
  ];
  List<String>night=[
    "Night",
    "Night",
    "Night",
    "Night",
    "Night",
    "Night",
    "Night",
    "Night",
    "Night",
    "Night",
    "Night",
  ];
  dynamic pages1 (int index){
    switch(index){
      case 0: return California();
      case 1: return strand();
      case 2: return meree();
      case 3: return strandhus();
      case 4: return clubHouse();
      case 5: return nester();
      case 6: return vovo();
      case 7: return vista();
      case 8: return klaus();
      case 9: return conti();
      case 10: return amSeagal();
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


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // screen hight 890,
    // screen width 411,
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF).withOpacity(1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height* 0.05),
        child: AppBar(
          title: Text(
            "Exclusive",
            style: TextStyle(fontSize: 27, fontFamily: "jeju2"),
          ),
          centerTitle: true,
          backgroundColor: Color(0xffFFFFFF).withOpacity(1),
          leading: Padding(
            padding:  EdgeInsets.only(left:width/34.25),
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
      bottomNavigationBar: BottomAppBar(
        height: height*0.07,
        color: Colors.transparent,
        elevation: 0,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));
              },
              icon: ImageIcon(AssetImage("assets/image/House_01.png")),iconSize: height*0.03,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Favorite(),));
              },
              icon: ImageIcon(AssetImage("assets/image/Heart_01.png")),iconSize: height*0.03,
            ), IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(),));
              },
              icon: ImageIcon(AssetImage("assets/image/User_072.png")),iconSize: height*0.03,
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              physics: ScrollPhysics(),
              itemCount: image.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return  Align(alignment: Alignment.center,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(vertical: height/90.25),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => pages1(index),));
                      },
                      child: Container(
                        width: width * 0.90,
                        height: height * 0.14,
                        decoration: BoxDecoration(
                          // color: Color(0xffFFFFFF).withOpacity(1),
                          color:  Color(0xffFFFFFF).withOpacity(1),
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
                        child: Row(
                          children: [
                            Padding(
                              padding:  EdgeInsets.all(height/98.8),
                              child: Image.asset(image[index],),
                            ),
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: height/74.16,),
                                Padding(
                                  padding:  EdgeInsets.only(left:  width/68.5),
                                  child: Text(titile[index],
                                    style: TextStyle(
                                      fontSize: width/22.8,
                                      color: Color(0xff070D30).withOpacity(1),
                                      fontFamily: "jeju2",
                                    ),
                                  ),
                                ),
                                SizedBox(height: height/350.66,),
                                Padding(
                                  padding:  EdgeInsets.only(left: width/58.71),
                                  child: Text(subTitile[index],
                                    style: TextStyle(
                                      fontSize: width/27.4,
                                      fontFamily: "jeju2",
                                      color: Colors.grey,

                                    ),
                                  ),
                                ),
                                SizedBox(height: height/300.5,),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: width/91.33),
                                    child: Image.asset(rating[index], scale: width/115.44,
                                    ),
                                  ),
                                ),
                                SizedBox(height: height/250.88,),
                                Padding(
                                  padding: EdgeInsets.only(left: width/82.2),
                                  child: Row(
                                    children: [
                                      Text(price[index],
                                        style: TextStyle(
                                          fontSize: width/15.22,
                                          fontFamily: "jeju2",
                                          color: Color(0xff070D30).withOpacity(1),
                                        ),
                                      ),
                                      SizedBox(width: width/4.11,),
                                      IconButton(onPressed: () {
                                       setState(() {
                                         favorite[index]= !favorite[index];
                                       });
                                      },
                                        icon: Icon(Icons.favorite,
                                        color: favorite[index]? Colors.red:Colors.grey,
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
      ),
    );
  }
}