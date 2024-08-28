import 'dart:collection';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../models/userModel.dart';


class MainProvider extends ChangeNotifier {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  firebase_storage.Reference ref = FirebaseStorage.instance.ref("IMAGEURL");

  // LogIn Function......................

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void details() {
    String id = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    HashMap<String, dynamic> loginDetails = HashMap();
    loginDetails["PHONE"] = nameController.text;
    loginDetails["PASSWORD"] = passwordController.text;
    loginDetails["ID"] = id;
    db.collection("USER_LOGIN").doc(id).set(loginDetails);
    notifyListeners();
  }

  // SignUp Function..........................

  TextEditingController signupPhoneorEmailController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();

 void signUpDetails(){
   String id = DateTime.now().millisecondsSinceEpoch.toString();
   Map<String,dynamic> signUpDetails ={
     "PHONE": signupPhoneorEmailController.text,
     "PASSWORD": signupPasswordController.text,
 };
db.collection("SIGNUP_DETAILS").doc(id).set(signUpDetails);
notifyListeners();

}


// Address Function............................

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController dateofbirthController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var downValue = "";
  var countryValue = "";


  void addressDetails() {
    String id = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    Map<String, dynamic> addressDetails = {
      "FIRST_NAME": firstnameController.text,
      "LAST_NAME": lastnameController.text,
      "GENDER": downValue,
      "DATE_OF_BIRTH": dateofbirthController.text,
      "EMAIL": emailController.text,
      "PHONE_NUMBER": phoneController.text,
      "COUNTRY": countryValue,
    };
    db.collection("USER_ADDRESS").doc(id).set(addressDetails);
    notifyListeners();
  }

  // Get Function.....................

  List<EditProfileModel> editProfileList = [];

  void getEditProfile() {
    db.collection("USER_ADDRESS").get().then((Snapshot) {
      editProfileList = Snapshot.docs.map((doc) {
        return EditProfileModel(
          doc.id,
          doc.get("FIRST_NAME"),
          doc.get("PHONE_NUMBER"),
          doc.get("EMAIL"),
          doc.get("PASSWORD"),
        );
      }).toList();

      notifyListeners();
    }).catchError((error) {
      print("Error fetching profile data: $error");
    });
  }


  // Guest Function................................



  // Book Function..................................

  TextEditingController checkOut =TextEditingController();
  TextEditingController checkIn =TextEditingController();

// check in date confirm pay page lekk pass cheyunna function

  String checkInDate = "";
  String checkOutDate = "";
 void bookDate(String checkIn, String checkOut){
   checkInDate = checkIn;
   checkOutDate = checkOut;

   String id =DateTime.now().millisecondsSinceEpoch.toString();
   Map<String,dynamic> bookDate={
     "CHECK_IN": checkIn,
     "CHECK_OUT": checkOut,
     "GUEST":value,
   };
   db.collection("BOOKING_DATE").doc(id).set(bookDate);
   notifyListeners();
 }
    // Guest + - Function..................

  int value = 0;
  void incrementValue(){
      value++;
      notifyListeners();
  }
  void decrementValue(){
      if(value>0)value--;{
        notifyListeners();

      }
      }

  List<EditBookingDateModel> editBookingDate = [];


  void getBookingDate() {
    db.collection("BOOKING_DATE").get().then((value) {
      editBookingDate = value.docs.map((doc) {
        return EditBookingDateModel(
          doc.id,
          doc.get("CHECK_IN"),
          doc.get("CHECK_OUT"),
          doc.get(value),
        );
      }).toList(); //

      notifyListeners();
    });
  }

  // -----------------------------Add Resort------------------------- ADMINNNNNNN............

File? addResortFileImg;

Future<void> pickImage(ImageSource source) async {
  final imagePicker = ImagePicker();
  final pickedImage = await imagePicker.pickImage(source: source);

  if (pickedImage != null) {
    cropImage(pickedImage.path);
  } else {
    print('No image selected.');
  }
}

Future<void> cropImage(String path) async {
  final croppedFile = await ImageCropper().cropImage(
    sourcePath: path,
    aspectRatioPresets: [
      CropAspectRatioPreset.original,
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio3x2,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio16x9,
    ],
    uiSettings: [
      AndroidUiSettings(
        toolbarTitle: 'Cropper',
        toolbarColor: Colors.white,
        toolbarWidgetColor: Colors.black,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false,
      ),
      IOSUiSettings(title: 'Cropper'),
    ],
  );

  if (croppedFile != null) {
    addResortFileImg = File(croppedFile.path);
    notifyListeners();
  }
}
  TextEditingController resortNameController = TextEditingController();
  TextEditingController resortPlaceController = TextEditingController();
  String resortImageUrl = "";

void addResort() {
  String id = DateTime.now().millisecondsSinceEpoch.toString();
  Map<String, dynamic> addressDetails = {
    "RESORT_NAME": resortNameController.text,
    "RESORT_PLACE": resortPlaceController.text,
    "RESORT IMAGE":resortImageUrl,

  };
  db.collection("RESORT_DETAILS").doc(id).set(addressDetails);
  notifyListeners();
}

}



// ---------------------------------------



