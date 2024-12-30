import 'package:flutter/material.dart';
import 'package:haven_hub/Provider/LoginProvider.dart';
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
    'Burkina ',
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
    'Germany',
    'Grand Duchy of Tuscany, The',
    'Grenada',
    'Guatemala',
    'Guinea',
    'Guinea-Bissau',
    'Guyana',
  ];

  // Add a GlobalKey for the FormState
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Loginprovider>(context, listen: false).loadUserDetails();
    });
  }

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
            "Address",
            style: TextStyle(fontSize: 27, fontFamily: "jeju2"),
          ),
          centerTitle: true,
          backgroundColor: Color(0xffFFFFFF).withOpacity(1),
          leading: Padding(
            padding: EdgeInsets.only(left: width / 34.25),
            child: IconButton(
              icon: Icon(Icons.arrow_back,
                  color: Colors.black.withOpacity(0.7)), // Specify icon and color
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: Consumer<MainProvider>(builder: (context, addressValue, child) {
        return SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey, // Attach form key
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: width * 0.4),
                    child: Text(
                      "Your Information",
                      style: TextStyle(
                          fontSize: 17,
                          color: Color(0xff070D30).withOpacity(1),
                          fontFamily: "jeju2"),
                    ),
                  ),
                  // First Name
                  Container(
                    width: width * 0.86,
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: Center(
                      child: TextFormField(
                        controller: addressValue.firstnameController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.10),
                          hintText: "First Name   ",
                          hintStyle: TextStyle(
                            color: Colors.grey.withOpacity(0.80),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: height * 0.03,
                              horizontal: width * 0.07),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(45),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(45),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  // Last Name
                  Container(
                    width: width * 0.86,
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: Center(
                      child: TextFormField(
                        controller: addressValue.lastnameController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.10),
                          hintText: "Last Name",
                          hintStyle: TextStyle(
                            color: Colors.grey.withOpacity(0.80),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: height * 0.03,
                              horizontal: width * 0.07),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(45),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(45),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your last name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  // Gender Selection with Dropdown inside TextField
                  Container(
                    width: width * 0.86,
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: Center(
                      child: TextFormField(
                        controller: textEditingController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.10),
                          hintText: "Gender ",
                          hintStyle: TextStyle(
                            color: Colors.grey.withOpacity(0.80),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: height * 0.03, horizontal: width * 0.07),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(45),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(45),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: PopupMenuButton<String>(
                            color: Color(0xffFFFFFF).withOpacity(1),
                            elevation: 0,
                            onSelected: (String newValue) {
                              setState(() {
                                addressValue.downValue = newValue;
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select your gender';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  // Date of Birth
                  Container(
                    width: width * 0.86,
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: Center(
                      child: TextFormField(
                        controller: addressValue.dateofbirthController,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.10),
                          hintText: "Date OF Birth  ",
                          hintStyle: TextStyle(
                            color: Colors.grey.withOpacity(0.80),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: height * 0.03, horizontal: width * 0.07),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(45),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(45),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your date of birth';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  // Email
                  Container(
                    width: width * 0.86,
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: Center(
                      child: TextFormField(
                        controller: addressValue.emailController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.10),
                          hintText: "Email ",
                          hintStyle: TextStyle(
                            color: Colors.grey.withOpacity(0.80),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: height * 0.03, horizontal: width * 0.07),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(45),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(45),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          // Simple email validation
                          final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                          if (!emailRegex.hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  // Phone Number
                  Container(
                    width: width * 0.86,
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: Center(
                      child: TextFormField(
                        controller: addressValue.phoneController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.10),
                          hintText: "Phone Number",
                          hintStyle: TextStyle(
                            color: Colors.grey.withOpacity(0.80),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: height * 0.03, horizontal: width * 0.07),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(45),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(45),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  // Country Selection with Dropdown inside TextField
                  Container(
                    width: width * 0.86,
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: Center(
                      child: TextFormField(
                        controller: countryController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.10),
                          hintText: "Country ",
                          hintStyle: TextStyle(
                            color: Colors.grey.withOpacity(0.80),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: height * 0.03, horizontal: width * 0.07),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(45),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(45),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: PopupMenuButton<String>(
                            color: Color(0xffFFFFFF).withOpacity(1),
                            elevation: 0,
                            onSelected: (String newValue) {
                              setState(() {
                                addressValue.countryValue = newValue;
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
                            icon: Icon(Icons.arrow_drop_down),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select your country';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  // Submit Button
                  SizedBox(
                    height: height * 0.03,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        // If the form is valid, proceed with the action
                        addressValue.addressDetails();
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff061673), // Original Color restored
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(45),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: height * 0.02, horizontal: width * 0.3),
                    ),
                    child: Text(
                      "Continue", // Original text restored
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "jeju2",
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                ],
              ),
            ),
          ),
        );
      }
      ),
    );
  }
}
