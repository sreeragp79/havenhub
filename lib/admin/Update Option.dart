// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:haven_hub/Provider/MainProvider.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
//
// class Updation extends StatefulWidget {
//   const Updation({super.key});
//
//   @override
//   State<Updation> createState() => _UpdationState();
// }
//
// class _UpdationState extends State<Updation> {
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     // print(height);
//     // print(width);
//     return Scaffold(
//         body: Consumer<MainProvider>(
//           builder: (context,addValue,child) {
//             return SingleChildScrollView(
//               child: Column(
//                 children: [
//                   SizedBox(height: 60,),
//                   Center(
//                     child: Container(
//                       width: 330,
//                       height: 240,
//                       decoration: BoxDecoration(
//                         color: Color(0xffD9D9D9).withOpacity(0.56),
//                         borderRadius: BorderRadius.circular(23),
//                         image: addValue.addResortFileImg != null?
//                             DecorationImage(image: FileImage(addValue.addResortFileImg!),
//                               fit: BoxFit.cover
//                             )
//                             :null
//                       ),
//                       child: IconButton(
//                         onPressed: () {
//                         showModalBottomSheet(
//                             context: context,
//                             builder: (BuildContext context){
//                               return SafeArea(
//                                   child:Wrap(
//                                     children: [
//                                       ListTile(
//                                         leading: Icon(Icons.photo_library),
//                                         title: Text('Choose from Gallery'),
//                                         onTap:() {
//                                           addValue.pickImage(ImageSource.gallery);
//                                         },
//                                       ),
//                                       ListTile(
//                                         leading: Icon(Icons.photo_camera),
//                                         title: Text('Take a Photo'),
//                                         onTap:() {
//                                           addValue.pickImage(ImageSource.camera);
//                                         },
//                                       ),
//
//                                     ],
//
//                                   ),
//                               );
//                             }
//                         );
//                         },
//                         icon: Icon(Icons.add_a_photo_outlined,color: Colors.black,size: 100,),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20,),
//                   Container(
//                     width: 300,
//                     decoration: BoxDecoration(
//                       color: Color(0xffD9D9D9).withOpacity(0.56),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         contentPadding: EdgeInsets.symmetric(vertical: 20,horizontal: 12),
//                         border: InputBorder.none,
//                         hintText: "Title",hintStyle: TextStyle(
//                         color: CupertinoColors.inactiveGray,
//                         fontSize: 19,
//                       ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20,),
//                   Container(
//                     width: 300,
//                     decoration: BoxDecoration(
//                       color: Color(0xffD9D9D9).withOpacity(0.56),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         contentPadding: EdgeInsets.symmetric(vertical: 20,horizontal: 12),
//                         border: InputBorder.none,
//                         hintText: "Place",hintStyle: TextStyle(
//                         color: CupertinoColors.inactiveGray,
//                         fontSize: 19,
//                       ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20,),
//                   Container(
//                     width: 300,
//                     decoration: BoxDecoration(
//                       color: Color(0xffD9D9D9).withOpacity(0.56),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         contentPadding: EdgeInsets.symmetric(vertical: 20,horizontal: 12),
//                         border: InputBorder.none,
//                         hintText: "Information",hintStyle: TextStyle(
//                         color: CupertinoColors.inactiveGray,
//                         fontSize: 19,
//                       ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 23,),
//                   Padding(
//                     padding: EdgeInsets.only(left: 180),
//                     child: Container(
//                       width: 80,
//                       child: TextButton(onPressed: () {
//
//                       },
//                         style: TextButton.styleFrom(
//                           backgroundColor:  Color(0xff061673).withOpacity(1),
//                         ),
//                         child: Text("Add",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                         ),
//                         ),
//                       ),
//                     ),
//                   ),
//
//                 ],
//               ),
//             );
//           }
//         ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haven_hub/Provider/MainProvider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class Updation extends StatefulWidget {
  const Updation({super.key});

  @override
  State<Updation> createState() => _UpdationState();
}

class _UpdationState extends State<Updation> {
  @override
  Widget build(BuildContext context) {
    // TextEditingController resortNameController = TextEditingController();
    // TextEditingController resortPlaceController = TextEditingController();
    // TextEditingController resortImformationController = TextEditingController();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Consumer<MainProvider>(
        builder: (context, addValue, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 60),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return SafeArea(
                            child: Wrap(
                              children: [
                                ListTile(
                                  leading: Icon(Icons.photo_library),
                                  title: Text('Choose from Gallery'),
                                  onTap: () {
                                    addValue.pickImage(ImageSource.gallery);
                                    Navigator.of(context)
                                        .pop(); // Close the bottom sheet
                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.photo_camera),
                                  title: Text('Take a Photo'),
                                  onTap: () {
                                    addValue.pickImage(ImageSource.camera);
                                    Navigator.of(context)
                                        .pop(); // Close the bottom sheet
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      width: 330,
                      height: 240,
                      decoration: BoxDecoration(
                        color: Color(0xffD9D9D9).withOpacity(0.56),
                        borderRadius: BorderRadius.circular(23),
                        image: addValue.addResortFileImg != null
                            ? DecorationImage(
                                image: FileImage(addValue.addResortFileImg!),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: addValue.addResortFileImg == null
                          ? Icon(
                              Icons.add_a_photo_outlined,
                              color: Colors.black,
                              size: 100,
                            )
                          : null,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                    color: Color(0xffD9D9D9).withOpacity(0.56),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    controller: addValue.resortNameController,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                      border: InputBorder.none,
                      hintText: "Title",
                      hintStyle: TextStyle(
                        color: CupertinoColors.inactiveGray,
                        fontSize: 19,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                    color: Color(0xffD9D9D9).withOpacity(0.56),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    controller: addValue.resortPlaceController,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                      border: InputBorder.none,
                      hintText: "Place",
                      hintStyle: TextStyle(
                        color: CupertinoColors.inactiveGray,
                        fontSize: 19,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                    color: Color(0xffD9D9D9).withOpacity(0.56),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    controller: addValue.resortImformationController,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                      border: InputBorder.none,
                      hintText: "Information",
                      hintStyle: TextStyle(
                        color: CupertinoColors.inactiveGray,
                        fontSize: 19,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 23),
                Padding(
                  padding: EdgeInsets.only(left: 180),
                  child: Container(
                    width: 200,
                    child: TextButton(
                      onPressed: () {
                        addValue.addResort();
                        addValue.clearField();
                        // Your add function
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xff061673).withOpacity(1),
                      ),
                      child: Text(
                        "Add",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
