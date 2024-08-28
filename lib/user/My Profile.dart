import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haven_hub/Provider/MainProvider.dart';
import 'package:haven_hub/user/Home.dart';
import 'package:haven_hub/user/Profile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'Login Page.dart';


class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
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
            "My Profile",
            style: TextStyle(fontSize: 27, fontFamily: "jeju2"),
          ),
          centerTitle: true,
          backgroundColor: Color(0xffFFFFFF).withOpacity(1),
          leading: Padding(
            padding:  EdgeInsets.only(left: width/34.25),
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
      body: Consumer<MainProvider>(
        builder: (context,addValue,child) {
          return SingleChildScrollView(
            child: Consumer<MainProvider>(
              builder: (context,value,child) {
                return Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Stack(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("assets/image/profile.png"),
                            radius: 60,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 70,top: 70),
                            child: IconButton(
                                onPressed:() {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context){
                                        return SafeArea(
                                          child:Wrap(
                                            children: [
                                              ListTile(
                                                leading: Icon(Icons.photo_library),
                                                title: Text('Choose from Gallery'),
                                                onTap:() {
                                                  addValue.pickImage(ImageSource.gallery);
                                                },
                                              ),
                                              ListTile(
                                                leading: Icon(Icons.photo_camera),
                                                title: Text('Take a Photo'),
                                                onTap:() {
                                                  addValue.pickImage(ImageSource.camera);
                                                },
                                              ),

                                            ],

                                          ),
                                        );
                                      }
                                  );
                                },
                                icon: Icon(Icons.edit_calendar,color: Colors.black,size: 40,)
                            ),
                          ),
                        ],

                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: Text(
                        value.firstnameController.text,
                        style: TextStyle(
                          fontSize: 25,
                          color: Color(0xff070D30).withOpacity(1),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        value.emailController.text,
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff6B7280),
                        ),
                      ),
                    ),
                    SizedBox(height: 24,),
                    Padding(
                      padding: const EdgeInsets.only(right: 217),
                      child: Text(
                        "UserName",
                        style: TextStyle(
                          fontSize: 17,
                          color: Color(0xff070D30).withOpacity(1),
                            fontFamily: "jeju2",
                        ),
                      ),
                    ),
                    Container(
                      width: width * 0.86,
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: Center(
                        child: TextField(
                          readOnly: true,
                         controller: value.firstnameController,
                          decoration: InputDecoration(
                            filled: true, // Set filled to true
                            fillColor: Colors.grey.withOpacity(
                                0.10), // Set the fill color// Set filled to true
                            hintText: "Your Name ",
                            hintStyle: TextStyle(
                              color: Colors.grey.withOpacity(0.80),
                            ),
                            contentPadding:
                            EdgeInsets.symmetric(vertical: 21, horizontal: 30),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(45),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(45),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 250),
                      child: Text(
                        "Email",
                        style: TextStyle(
                          fontSize: 17,
                          color: Color(0xff070D30).withOpacity(1),
                          fontFamily: "jeju2",
                        ),
                      ),
                    ),
                    Container(
                      width: width * 0.86,
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: Center(
                        child: TextField(
                          readOnly: true,
                          controller: value.emailController,
                          decoration: InputDecoration(
                            filled: true, // Set filled to true
                            fillColor: Colors.grey.withOpacity(
                                0.10), // Set the fill color// Set filled to true
                            hintText: "Your Email  ",
                            hintStyle: TextStyle(
                              color: Colors.grey.withOpacity(0.80),
                            ),
                            contentPadding:
                            EdgeInsets.symmetric(vertical: 21, horizontal: 30),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(45),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(45),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 235),
                      child: Text(
                        "Number",
                        style: TextStyle(
                          fontSize: 17,
                          color: Color(0xff070D30).withOpacity(1),
                          fontFamily: "jeju2",
                        ),
                      ),
                    ),
                    Container(
                      width: width * 0.86,
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: Center(
                        child: TextField(
                          readOnly: true,
                          controller: value.phoneController,
                          decoration: InputDecoration(
                            filled: true, // Set filled to true
                            fillColor: Colors.grey.withOpacity(
                                0.10), // Set the fill color// Set filled to true
                            hintText: "Your Number  ",
                            hintStyle: TextStyle(
                              color: Colors.grey.withOpacity(0.80),
                            ),
                            contentPadding:
                            EdgeInsets.symmetric(vertical: 21, horizontal: 30),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(45),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(45),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 223),
                      child: Text(
                        "Password",
                        style: TextStyle(
                          fontSize: 17,
                          color: Color(0xff070D30).withOpacity(1),
                          fontFamily: "jeju2",
                        ),
                      ),
                    ),
                    Container(
                      width: width * 0.86,
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: Center(
                        child: TextField(
                          controller: value.passwordController,
                          maxLength: 12,
                          decoration: InputDecoration(
                            filled: true, // Set filled to true
                            fillColor: Colors.grey.withOpacity(
                                0.10), // Set the fill color// Set filled to true
                            hintText: "Your Password ",
                            hintStyle: TextStyle(
                              color: Colors.grey.withOpacity(0.80),
                            ),
                            contentPadding:
                            EdgeInsets.symmetric(vertical: 21, horizontal: 30),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(45),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(45),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.only(left:190,top: 1,),
                      child: Container(
                        width: width * 0.26,
                        height: height *0.05,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Color(0xff061673).withOpacity(1),
                          ),
                          onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>   Profile(),));
                        },
                          child:Text("Save",
                        style: TextStyle(
                          fontFamily: "jeju2",
                          fontSize: 20,
                          color: Colors.white
                        ),
                        ),
                        ),
                      ),
                    ),
                  ],
                );
              }
            ),
          );
        }
      ),
    );
  }
}
