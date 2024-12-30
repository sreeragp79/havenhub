import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haven_hub/Provider/MainProvider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../models/userModel.dart';
import 'Hotel Model.dart';
import 'Hotels List Admin.dart';

class AdminUpdate extends StatefulWidget {
  ResortAddingDetails hotel;
  AdminUpdate({super.key, required this.hotel});

  @override
  State<AdminUpdate> createState() => _UpdationState();
}

class _UpdationState extends State<AdminUpdate> {
  File? updateResortImage;
  @override
  Widget build(BuildContext context) {
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
                                    Navigator.of(context).pop();
                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.photo_camera),
                                  title: Text('Take a Photo'),
                                  onTap: () {
                                    addValue.pickImage(ImageSource.camera);
                                    Navigator.of(context).pop();
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
                        image: DecorationImage(
                          image:addValue.updateResortImage!= null
                          ?FileImage(addValue.updateResortImage!)
                          :NetworkImage(widget.hotel.image,)as ImageProvider,
                        ),
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
                    controller: addValue.resortNameController..text = widget.hotel.name,
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
                    controller: addValue.resortPlaceController..text = widget.hotel.place,  // Corrected field
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
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    controller: addValue.resortImformationController..text = widget.hotel.information, // Corrected field
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
                SizedBox(height: 20),
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                    color: Color(0xffD9D9D9).withOpacity(0.56),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    controller: addValue.resortPriceController..text = widget.hotel.price.toString(), // Corrected field
                    decoration: InputDecoration(
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                      border: InputBorder.none,
                      hintText: "Price",
                      hintStyle: TextStyle(
                        color: CupertinoColors.inactiveGray,
                        fontSize: 19,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 23),
                Container(
                  width: 200,
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      addValue.resortUpdation(widget.hotel.id);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminList(),));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Resort updated successfully')),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xff061673).withOpacity(1),
                    ),
                    child: Text(
                      "Update",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12,),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => AdminHotelModel(hotel: widget.hotel,),));
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xff061673).withOpacity(1),
                  ),
                  child: Text(
                    "MainPage",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
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
