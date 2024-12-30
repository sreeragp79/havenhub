
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haven_hub/Provider/MainProvider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddAdmin extends StatefulWidget {
  const AddAdmin({super.key});

  @override
  State<AddAdmin> createState() => _UpdationState();
}

class _UpdationState extends State<AddAdmin> {
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
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
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
                SizedBox(height: 20),
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                    color: Color(0xffD9D9D9).withOpacity(0.56),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    controller: addValue.resortPriceController,
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
                      addValue.addResort();
                      addValue.clearField1();
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
              ],
            ),
          );
        },
      ),
    );
  }
}
