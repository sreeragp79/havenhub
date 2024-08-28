
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../Provider/MainProvider.dart';
import 'Home.dart';


class Address extends StatefulWidget {
  const Address({super.key});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  var downValue = "";
  var countryValue = "";
  TextEditingController textEditingController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  List<String> details = [
    "Male",
    "Female",
    "Other",
  ];
  List<String> country = [
    "Afghanistan",
    "Albania",
    "Algeria",
    "Andorra",
    'Angola',
    'Antigua and Barbuda',
    'Argentina',
    'Armenia',
    'Australia',
    'Austria',
    'Austrian Empire',
    'Azerbaijan',
    'Baden',
    'Bahamas, The',
    'Bahrain',
    'Bangladesh',
    'Barbados',
    'Bavaria',
    'Belgium',
    'Belize',
    'Benin (Dahomey)',
    'Bolivia',
    'Bosnia and Herzegovina',
    'Botswana',
    'Brazil',
    'Brunei',
    'Brunswick ',
    'Bulgaria',
    'Burkina '
    'Burundi',
    'Iceland',
    'India',
    'Indonesia',
    'Iran',
    'Iraq',
    'Ireland',
    'Israel',
    'Italy',
    'Gabon',
    'Gambia, The',
    'Georgia',
    'Germany'
    'Grand Duchy of Tuscany, The',
    'Grenada',
    'Guatemala',
    'Guinea',
    'Guinea-Bissau',
    'Guyana',
  ];

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
            "Address",
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
      body: Consumer<MainProvider>(
        builder: (context,addressValue,child) {
          return SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: height*0.03,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 167),
                    child: Text(
                      "Your Information",
                      style: TextStyle(
                          fontSize: 17,
                          color: Color(0xff070D30).withOpacity(1),
                          fontFamily: "jeju2"),
                    ),
                  ),
                  Container(
                    width: width * 0.86,
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: Center(
                      child: TextField(
                        controller: addressValue.firstnameController,
                        decoration: InputDecoration(
                          filled: true, // Set filled to true
                          fillColor: Colors.grey.withOpacity(
                              0.10), // Set the fill color// Set filled to true
                          hintText: "First Name   ",
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
                  Container(
                    width: width * 0.86,
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: Center(
                      child: TextField(
                        controller: addressValue.lastnameController,
                        decoration: InputDecoration(
                          filled: true, // Set filled to true
                          fillColor: Colors.grey.withOpacity(
                              0.10), // Set the fill color// Set filled to true
                          hintText: "Last Name",
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
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Container(
                        width: width * 0.86,
                        margin: EdgeInsets.symmetric(vertical: 15),
                        child: Center(
                          child: TextField(
                            controller: textEditingController,
                            decoration: InputDecoration(
                              filled: true, // Set filled to true
                              fillColor: Colors.grey.withOpacity(
                                  0.10), // Set the fill color// Set filled to true
                              hintText: "Gender ",
                              hintStyle: TextStyle(
                                color: Colors.grey.withOpacity(0.80),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 21, horizontal: 30),
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
                        padding: const EdgeInsets.only(right: 12),
                        child: PopupMenuButton<String>(
                          color: Color(0xffFFFFFF).withOpacity(1),
                          elevation: 0,
                          onSelected: (String newValue) {
                            setState(() {
                              addressValue.downValue=newValue;
                              textEditingController.text = newValue;
                            });
                          },
                          itemBuilder: (BuildContext context) {
                            return details.map((String value) {
                              return PopupMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList();
                          },
                          icon: Icon(Icons.arrow_drop_down),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: width * 0.86,
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: Center(
                      child: TextField(
                        controller: addressValue.dateofbirthController,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          filled: true, // Set filled to true
                          fillColor: Colors.grey.withOpacity(
                              0.10), // Set the fill color// Set filled to true
                          hintText: "Date OF Birth  ",
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
                  Container(
                    width: width * 0.86,
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: Center(
                      child: TextField(
                        controller: addressValue.emailController,
                        decoration: InputDecoration(
                          filled: true, // Set filled to true
                          fillColor: Colors.grey.withOpacity(
                              0.10), // Set the fill color// Set filled to true
                          hintText: "Email ",
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
                  Container(
                    width: width * 0.86,
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: Center(
                      child: TextField(
                        controller: addressValue.phoneController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true, // Set filled to true
                          fillColor: Colors.grey.withOpacity(
                              0.10), // Set the fill color// Set filled to true
                          hintText: "Phone number  ",
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
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Container(
                        width: width * 0.86,
                        margin: EdgeInsets.symmetric(vertical: 15),
                        child: Center(
                          child: TextField(
                            readOnly: true,
                            controller: countryController,
                            decoration: InputDecoration(
                              filled: true, // Set filled to true
                              fillColor: Colors.grey.withOpacity(
                                  0.10), // Set the fill color// Set filled to true
                              hintText: "Country  ",
                              hintStyle: TextStyle(
                                color: Colors.grey.withOpacity(0.80),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 21, horizontal: 30),
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
                        padding: const EdgeInsets.only(right: 12),
                        child: PopupMenuButton<String>(
                          color: Color(0xffFFFFFF).withOpacity(1),
                          elevation: 0,
                          onSelected: (String newValue) {
                            setState(() {
                              addressValue.countryValue=newValue;
                              countryController.text = newValue;
                            });
                          },
                          itemBuilder: (BuildContext context) {
                            return country.map((String value) {
                              return PopupMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList();
                          },
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 190,
                      top: 23,
                    ),
                    child: Container(
                      width: width * 0.26,
                      height: height * 0.05,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xff061673).withOpacity(1),
                        ),
                        onPressed: () {
                         addressValue.addressDetails();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Home(),
                              ));
                        },
                        child: Text(
                          "Save",
                          style: TextStyle(
                              fontFamily: "jeju2",
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
