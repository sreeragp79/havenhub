// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class Favorite extends StatefulWidget {
//   const Favorite({super.key});
//
//   @override
//   State<Favorite> createState() => _FavoriteState();
// }
//
// class _FavoriteState extends State<Favorite> {
//   bool isChecked= true;
//
// //   void orNot(){
// //     setState(() {
// //       isFavorite = !isFavorite;
// //     });
// //   }
// // bool isFavorite = false;
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       backgroundColor: Color(0xffFFFFFF).withOpacity(1),
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(height* 0.05),
//         child: AppBar(
//           title: Text(
//             "favorite",
//             style: TextStyle(fontSize: 27, fontFamily: "jeju2"),
//           ),
//           centerTitle: true,
//           backgroundColor: Color(0xffFFFFFF).withOpacity(1),
//           leading: Padding(
//             padding:  EdgeInsets.only(left: width/34.25),
//             child: IconButton(
//               icon: Icon(Icons.arrow_back,
//                   color:
//                       Colors.black.withOpacity(0.7)), // Specify icon and color
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//           child: Column(children: [
//         SizedBox(
//           height: 23,
//         ),
//         Center(
//           child: Stack(children: [
//             Container(
//               width: width * 0.89,
//               height: height * 0.15,
//               decoration: BoxDecoration(
//                 color: Color(0xffFFFFFF).withOpacity(1),
//                 borderRadius: BorderRadius.circular(25),
//                 boxShadow: [
//                   BoxShadow(
//                       spreadRadius: 2,
//                       color: CupertinoColors.inactiveGray.withOpacity(0.26),
//                       blurRadius: 4,
//                       offset: Offset(0, 3)),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 13, left: 10),
//               child: Container(
//                 height: height * 0.12,
//                 width: width * 0.32,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(16),
//                   color: Colors.red,
//                 ),
//                 child: Image.asset(
//                   "assets/image/california.png",
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ),
//             Positioned(
//               left: 153,
//               top: 10,
//               child: Row(
//                 children: [
//                   Text(
//                     "Beach Hotel California",
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: Color(0xff070D30).withOpacity(1),
//                       fontFamily: "jeju2",
//                     ),
//                   ),
//                   IconButton(onPressed: () {
//                     print("delet");
//                   },
//                       icon: Icon(Icons.delete,color: Colors.black,size: 20,)
//                   ),
//                 ],
//               ),
//             ),
//             Positioned(
//                 left: 153,
//                 top: 44,
//                 child: Image.asset(
//                   "assets/image/Star.png",
//                   scale: 3.56,
//                 )),
//             Positioned(
//               left: 245,
//               top: 45,
//               child: Text(
//                 "4.5",
//                 style: TextStyle(
//                   color: CupertinoColors.inactiveGray.withOpacity(0.80),
//                   fontFamily: "jeju2",
//                 ),
//               ),
//             ),
//             Positioned(
//               left: 154,
//               top: 80,
//               child: Text(
//                 "\$170",
//                 style: TextStyle(
//                   fontSize: 29,
//                   fontFamily: "jeju2",
//                   color: Color(0xff070D30).withOpacity(1),
//                 ),
//               ),
//             ),
//             Positioned(
//               left: 224,
//               top: 75,
//               child: Row(
//                 children: [
//                   Text(
//                     "Night",
//                     style: TextStyle(
//                       fontSize: 15,
//                       fontFamily: "jeju2",
//                       color: CupertinoColors.inactiveGray.withOpacity(0.80),
//                     ),
//                   ),
//                   SizedBox(width: 57,),
//                   IconButton(onPressed: () {
//                   setState(() {
//                     isChecked = !isChecked;
//
//                   });
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                     content: Text(
//                       isChecked? "Added to Favorites":"Removed from Favorites",
//                       style: TextStyle(
//                         color: Colors.black.withOpacity(1),
//                         fontSize: 17,
//                       ),
//                     ),
//                       backgroundColor:  Color(0xffFFFFFF).withOpacity(1),
//                       elevation: 5,
//                       behavior: SnackBarBehavior.floating,
//                       duration: Duration(seconds: 2), // Duration of the SnackBar
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(25),
//                     ),
//
//                     ),
//                   );
//                   },
//                       icon: Icon(Icons.favorite),
//                     color: isChecked? Colors.red:Colors.grey
//                     // color: _isFavorite ? Colors.red : null,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//           ),
//         ),
//       ]
//           ),
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  bool isChecked = false;

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
            "favorite",
            style: TextStyle(fontSize: 27, fontFamily: "jeju2"),
          ),
          centerTitle: true,
          backgroundColor: Color(0xffFFFFFF).withOpacity(1),
          leading: Padding(
            padding: EdgeInsets.only(left: width / 34.25),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black.withOpacity(0.7),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 1, // Adjust based on your data
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Center(
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
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Image Container
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: height * 0.12,
                        width: width * 0.32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.red,
                        ),
                        child: Image.asset(
                          "assets/image/california.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    // Text and Icon Column
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 13.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Hotel Name and Delete Icon
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Beach Hotel California",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff070D30).withOpacity(1),
                                    fontFamily: "jeju2",
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    print("delete");
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                            // Star and Rating
                            Row(
                              children: [
                                Image.asset(
                                  "assets/image/Star.png",
                                  scale: 3.56,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "4.5",
                                  style: TextStyle(
                                    color: CupertinoColors.inactiveGray.withOpacity(0.80),
                                    fontFamily: "jeju2",
                                  ),
                                ),
                              ],
                            ),
                            // Price and Favorite Icon
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "\$170",
                                  style: TextStyle(
                                    fontSize: 29,
                                    fontFamily: "jeju2",
                                    color: Color(0xff070D30).withOpacity(1),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Night",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "jeju2",
                                        color: CupertinoColors.inactiveGray.withOpacity(0.80),
                                      ),
                                    ),
                                    SizedBox(width: 110),

                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

