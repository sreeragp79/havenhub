import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haven_hub/Provider/LoginProvider.dart';
import 'package:haven_hub/Provider/MainProvider.dart';
import 'package:haven_hub/models/userModel.dart';
import 'package:provider/provider.dart';
import 'All Class.dart';
import 'Hotel Display.dart';
import 'Exclusive.dart';
import 'Favorite.dart';
import 'Notification.dart';
import 'Profile.dart';

class Home extends StatefulWidget {

   Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isChecked = false;
  List<String> rating = [
    "assets/image/4.5 rating.png",
    "assets/image/4.5 rating.png",
    "assets/image/4.5 rating.png",
    "assets/image/4.5 rating.png",
  ];
  List<String> logo = [
    "assets/image/exclusive logo.png",
    "assets/image/exclusive logo.png",
    "assets/image/exclusive logo.png",
    "assets/image/exclusive logo.png",
  ];
  List<bool> favorite = List.filled(4, false);

  List<String> day = [
    "Per Day",
    "Per Day",
    "Per Day",
    "Per Day",
  ];
  // screen hight 890,
  // screen width 411,
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return PopScope(
      canPop: false,
      onPopInvoked: (val) {
        showExitDialog();
      },
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF).withOpacity(1),
        body: SingleChildScrollView(
          child: Consumer<MainProvider>(builder: (context, value, child) {
            return Column(
              children: [
                SizedBox(height: height / 26.17),
                Padding(
                  padding: EdgeInsets.only(left: width / 1.20),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Noti(),
                          )
                      );
                    },
                    icon: ImageIcon(
                      AssetImage("assets/image/Bell.png"),
                      size: width / 11.41
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
                      fontSize: width / 13.41,
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 44.5,
                ),
                Autocomplete<ResortAddingDetails>(
                  optionsBuilder: (TextEditingValue textEditingValue){
                    if (textEditingValue.text.isEmpty) {
                      return const Iterable<ResortAddingDetails>.empty();
                    }
                    return value.ExclusiveList.where((ResortAddingDetails option) {
                      return option.name.toLowerCase().contains(textEditingValue.text.toLowerCase());
                    });
                  },
                  fieldViewBuilder: (context, fieldController, focusNode, onFieldSubmitted){

                    WidgetsBinding.instance.addPostFrameCallback((_){
                      fieldController.text =value.searchController.text;
                    });
                   return   Padding(
                     padding: EdgeInsets.only(left: width / 69.68),
                     child: Container(
                       width: width / 1.20,
                       child: TextField(
                         controller: fieldController,
                         focusNode: focusNode,
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
                           ),
                         ),

                       ),
                     ),
                   );
                },
                  onSelected: (ResortAddingDetails item){
                    value.searchController.clear();
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>
                        Details1(hotel: item),));
                  },
                  optionsViewBuilder: (context, onSelected, options) {
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Material(
                      child: Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.zero,
                       width: width/1.2,
                        height: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.white,
                        ),
                        child: ListView.builder(padding: EdgeInsets.zero,
                          itemCount: options.length,
                          itemBuilder: (context, index) {
                            List<ResortAddingDetails> optionsList = options.toList();
                            return SizedBox(
                              height: 30,
                              child: ListTile(
                                // contentPadding: EdgeInsets.symmetric(vertical: 0),
                               title: Text(optionsList[index].name,
                               style: TextStyle(
                                 color: Colors.black12.withOpacity(1)
                               ),
                               ),
                                onTap: (){
                                  onSelected(optionsList[index]);
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                  },
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
                          value.getExclusiveResorts();
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
                        width: width / 3.30,
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
                  itemCount: value.carousalList.length,
                  itemBuilder: (context, index, realIndex) {
                    ResortAddingDetails item = value.carousalList[index];
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            value.clearGuestValue();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Details1(hotel: item),
                                ));
                          },
                          child: Container(
                            // margin: EdgeInsets.symmetric(horizontal: 3),
                            width: width / 1.1,
                            height: height / 5.99,
                            child: Row(
                              children: [
                                Container(
                                  height: height / 5.99,
                                  width: width/3.04,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                      image: NetworkImage(item.image,)
                                    ),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(32),
                                        bottomLeft: Radius.circular(32),
                                      ),
                                  ),
                                  // child: Image.network(
                                  //   item.image,
                                  //   fit: BoxFit.cover,
                                  // ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: height / 74.16),
                                      Text(
                                        item.name,
                                        style: TextStyle(
                                          fontSize: width / 25.8,
                                          color: Color(0xff070D30).withOpacity(1),
                                          fontFamily: "jeju2",
                                        ),
                                      ),
                                      // SizedBox(height: height / 170.16),
                                      Image.asset(rating[index],
                                          scale: width / 119.13),
                                      SizedBox(height: width / 50.25),
                                      Image.asset(
                                        logo[index],
                                        scale: width / 137,
                                      ),
                                      SizedBox(
                                        height: index == 1 ? 4 : height / 148.33,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            item.price,
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontFamily: "jeju2"),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            day[index],
                                            style: TextStyle(
                                                fontFamily: "jeju2",
                                                fontSize: 16,
                                                color: CupertinoColors.inactiveGray),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                            Consumer<Loginprovider>(
                                            builder: (context1,value22,child) {
                                              return IconButton(
                                                onPressed: () {
                                                  String resortId = item.id;
                                                  value22.addToFavoriteResorts(value22.loginUserId,resortId);
                                                  setState(() {
                                                    favorite[index]=!favorite[index];
                                                  });
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                    content: Text(
                                                      isChecked ? "Added to Favorites" : "Removed from Favorites",
                                                      style: TextStyle(
                                                        color:
                                                            Colors.black.withOpacity(1),
                                                        fontSize: 17,
                                                      ),
                                                    ),
                                                    backgroundColor: Color(0xffFFFFFF)
                                                        .withOpacity(1),
                                                    elevation: 5,
                                                    behavior: SnackBarBehavior.floating,
                                                    duration: Duration(
                                                        seconds:
                                                            2), // Duration of the SnackBar
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(25),
                                                    ),
                                                  )
                                                  );
                                                },
                                                icon: Icon(
                                                  Icons.favorite,
                                                ),
                                                color: favorite[index] ? Colors.red : Colors.grey,
                                              );
                                            }
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
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
                    height: height / 4.94,
                    viewportFraction: 1,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 5),
                  ),
                ),
                SizedBox(
                  height: height / 800.16,
                ),
                Padding(
                  padding: EdgeInsets.only(right: width / 1.78),
                  child: Text(
                    "Latest Popular",
                    style: TextStyle(
                        fontSize: width / 25,
                        fontFamily: "jeju2",
                        color: CupertinoColors.inactiveGray.withOpacity(0.67)),
                  ),
                ),
                SizedBox(
                  height: height / 59.33,
                ),
                CarouselSlider.builder(
                  itemCount: value.carousalList.length,
                  itemBuilder: (context, index, realIndex) {
                    ResortAddingDetails item = value.carousalList[index];
                    return GestureDetector(
                      onTap: () {
                        value.clearGuestValue();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Details1(hotel: item)));
                      },
                      child: Container(
                          width: 200,
                          margin: EdgeInsets.symmetric(vertical: height / 89),
                          decoration: BoxDecoration(
                            color: Color(0xffFFFFFF).withOpacity(1),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.20),
                                  spreadRadius: 1,
                                  blurRadius: 9,
                                  offset: Offset(0, 3)),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: height / 111.25,
                              ),
                              Center(
                                child: Container(
                                  width: width / 2.22,
                                  height: height / 4.81,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      color: Colors.white,
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(item.image),
                                      )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 12,top: 7),
                                child: Text(
                                  item.name,
                                  style: TextStyle(
                                    fontSize: width / 23.8,
                                    color: Color(0xff070D30).withOpacity(1),
                                    fontFamily: "jeju2",
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height / 200.33,
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 14,),
                                  Text(
                                    item.price,
                                    style: TextStyle(
                                        fontSize: 30, fontFamily: "jeju2"),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    day[index],
                                    style: TextStyle(
                                        fontFamily: "jeju2",
                                        fontSize: 16,
                                        color: CupertinoColors.inactiveGray),
                                  ),
                                ],
                              ),
                            ],
                          )),
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
            );
          }
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
                icon: ImageIcon(AssetImage("assets/image/User_02.png")),
                iconSize: height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> showExitDialog() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Are you sure?',
          style: TextStyle(
            fontFamily: "jeju2",
            fontSize: 20,
          ),
        ),
        content: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Text(
            'Are you sure you want to exit the app?',
            style: TextStyle(
              fontFamily: "jeju2",
              fontSize: 16,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              'No',
              style: TextStyle(
                color: Colors.blue,
                fontFamily: "jeju2",
                fontSize: 16,
              ),
            ),
          ),
          TextButton(
            onPressed: () => SystemNavigator.pop(),
            child: Text(
              'Yes',
              style: TextStyle(
                color: Colors.red,
                fontFamily: "jeju2",
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    ) ?? false;
  }

}

