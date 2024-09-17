import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haven_hub/Provider/MainProvider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'Review.dart';

class ReviewAdd extends StatefulWidget {
  const ReviewAdd({super.key});

  @override
  State<ReviewAdd> createState() => _ReviewAddState();
}

class _ReviewAddState extends State<ReviewAdd> {
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
            "Review",
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
      body:SingleChildScrollView(
        child: Consumer<MainProvider>(
          builder: (context,reviwValue,child) {
            return Column(
              children: [
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
                                    reviwValue.ReviewPickImage(ImageSource.gallery);
                                    Navigator.of(context)
                                        .pop(); // Close the bottom sheet
                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.photo_camera),
                                  title: Text('Take a Photo'),
                                  onTap: () {
                                    reviwValue.ReviewPickImage(ImageSource.camera);
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
                      width: 110,
                      height: 240,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffD9D9D9).withOpacity(0.56),
                        image: reviwValue.reviewUserProfilePick != null
                            ? DecorationImage(
                          image: FileImage(reviwValue.reviewUserProfilePick!),
                          fit: BoxFit.cover,
                        )
                            : null,
                      ),
                      child: reviwValue.reviewUserProfilePick == null
                          ? Icon(
                        Icons.add_a_photo_outlined,
                        color: Colors.black,
                        size: 30,
                      )
                          : null,
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                    color: Color(0xffD9D9D9).withOpacity(0.56),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    controller: reviwValue.reviewUserNameController,
                    decoration: InputDecoration(
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                      border: InputBorder.none,
                      hintText: "Name",
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
                    controller: reviwValue.reviewHotelNameController,
                    decoration: InputDecoration(
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                      border: InputBorder.none,
                      hintText: "Hotel Name",
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
                    controller: reviwValue.reviewSubNameController,
                    decoration: InputDecoration(
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                      border: InputBorder.none,
                      hintText: "Review",
                      hintStyle: TextStyle(
                        color: CupertinoColors.inactiveGray,
                        fontSize: 19,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 23),
                 Consumer<MainProvider>(
                   builder: (context1,val,child) {
                     return val.isUploading ?
                     CircularProgressIndicator(color: Color(0xff061673).withOpacity(1), // Loader color
                     )
                         :
                       Container(
                      width: 200,
                      height: 50,
                      child: TextButton(
                        onPressed: () {
                          reviwValue.reviewAddProfile(context);

                          // Your add function
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xff061673).withOpacity(1),
                        ),
                        child:  Text(
                          "Add",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                                     );
                   }
                 ),
              ],
            );
          }
        ),
      ),
    );
  }
}
