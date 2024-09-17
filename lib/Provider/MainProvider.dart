import 'dart:async';
import 'dart:collection';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/userModel.dart';
import '../user/Review.dart';

class MainProvider extends ChangeNotifier {
  MainProvider() {

    getReview();
  }
  final FirebaseFirestore db = FirebaseFirestore.instance;
  firebase_storage.Reference ref = FirebaseStorage.instance.ref("IMAGEURL");

  // LogIn Function....................................................................

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void details() {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, dynamic> loginDetails = HashMap();
    loginDetails["PHONE"] = nameController.text;
    loginDetails["PASSWORD"] = passwordController.text;
    loginDetails["ID"] = id;
    db.collection("USER_LOGIN").doc(id).set(loginDetails);
    notifyListeners();
  }

  // SignUp Function....................................................................

  TextEditingController signupPhoneorEmailController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();

  void signUpDetails() async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    Map<String, dynamic> signUpDetails = {
      "PHONE": signupPhoneorEmailController.text,
      "PASSWORD": signupPasswordController.text,
    };

    db.collection("SIGNUP_DETAILS").doc(id).set(signUpDetails);

    // യൂസർ ഡീറ്റെയിൽസ് SharedPreferences ൽ സേവ് ചെയ്യുന്നു........................

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("PHONE", signupPhoneorEmailController.text);
    await prefs.setString("PASSWORD", signupPasswordController.text);
    notifyListeners();
  }

  //  user details fetch cheyyann.....................................................

  Future<void> loadUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    signupPhoneorEmailController.text = prefs.getString("PHONE") ?? "";
    signupPasswordController.text = prefs.getString("PASSWORD") ?? "";
    notifyListeners();
  }
  // pref Clear Function..............................................................

  Future<void> clearPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    notifyListeners();
  }

// Address Function...................................................................

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController dateofbirthController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var downValue = "";
  var countryValue = "";

  void addressDetails() {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
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

  // Get Function.....................................................................

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

  // Guest Function...................................................................

  // Book Function....................................................................

  TextEditingController checkOut = TextEditingController();
  TextEditingController checkIn = TextEditingController();

// check in date confirm pay page lekk pass cheyunna function

  String checkInDate = "";
  String checkOutDate = "";

  void bookDate(String checkIn, String checkOut) {
    checkInDate = checkIn;
    checkOutDate = checkOut;

    String id = DateTime.now().millisecondsSinceEpoch.toString();
    Map<String, dynamic> bookDate = {
      "CHECK_IN": checkIn,
      "CHECK_OUT": checkOut,
      "GUEST": value,
    };
    db.collection("BOOKING_DATE").doc(id).set(bookDate);
    notifyListeners();
  }

  // Guest + - Function.............................................................

  int value = 0;

  Map<String,double> resortBaseRate={
    "California": 170.0,
    "amSeagal":165,
  };

    double getResortAmount(String resortName){
    double baseRate = resortBaseRate[resortName]?? 0.0;
    return baseRate * value;
    }

  void incrementValue() {
    value++;
    notifyListeners();
  }

  void decrementValue() {
    if (value > 0) value--;
    {
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
  TextEditingController resortImformationController = TextEditingController();
  String resortImageUrl = "";
  File? addResortFileImg;

  void addResort() async {
    try {
      String id = DateTime.now().millisecondsSinceEpoch.toString();
      // Create a map for the resort details
      Map<String, dynamic> addResortDetails = {
        "RESORT IMAGE": resortImageUrl,
        "RESORT_NAME": resortNameController.text,
        "RESORT_PLACE": resortPlaceController.text,
        "RESORT_INFORMATION": resortImformationController.text,
      };

      // Check if there is an image file to upload
      if (addResortFileImg != null) {
        String photoId = DateTime.now().millisecondsSinceEpoch.toString();
        Reference ref = FirebaseStorage.instance.ref().child(photoId);

        // Upload the image file to Firebase Storage
        await ref.putFile(addResortFileImg!).whenComplete(() async {
          // Get the download URL of the uploaded image
          String downloadUrl = await ref.getDownloadURL();

          // Add the image URL to the resort details
          addResortDetails["RESORT IMAGE"] = downloadUrl;

          // Save the resort details in Firestore
          await db
              .collection("ADD_RESORT_DETAILS")
              .doc(id)
              .set(addResortDetails);
          // Notify listeners about the changes
          notifyListeners();
        });
      } else {
        // If no image is provided, save the resort details without the image
        // await db.collection("ADD_RESORT_DETAILS").doc(id).set(addressDetails);

        notifyListeners();
      }
    } catch (e) {
      print("Failed to add resort details: $e");
    }
  }

  List<ResortAddingDetails> editResortDetails = [];

  void getResortAddDetails() {
    db.collection("ADD_RESORT_DETAILS").get().then((value) {
      editResortDetails = value.docs.map((doc) {
        return ResortAddingDetails(
          doc.id,
          doc.get("RESORT IMAGE"),
          doc.get("RESORT_NAME"),
          doc.get("RESORT_PLACE"),
          doc.get("RESORT_INFORMATION"),
        );
      }).toList();
      notifyListeners();
    });
  }

  // clear the details after click the add botton......................................
  void clearField() {
    resortNameController.clear();
    resortPlaceController.clear();
    resortImformationController.clear();
    addResortFileImg = null;
    notifyListeners();
  }

// user profile photo update picker....................................................

  Future<void> UserPickImage(ImageSource source) async {
    final userImagePicker = ImagePicker();
    final userPickedImage = await userImagePicker.pickImage(source: source);

    if (userPickedImage != null) {
      await userCropImage(userPickedImage.path);
      notifyListeners();
    } else {
      print('No image selected.');
    }
  }

  Future<void> userCropImage(String path) async {
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
      addUserProfilePick = File(croppedFile.path);
      notifyListeners();
    }
  }

  String userProfileUrl = "";
  File? addUserProfilePick;

  void userAddProfile() async {
    try {
      String id = DateTime.now().millisecondsSinceEpoch.toString();
      Map<String, dynamic> userProfilePick = {
        "USER_IMAGE": userProfileUrl,
      };

      // Check if there is an image file to upload
      if (addUserProfilePick != null) {
        // Check for addUserProfilePick
        String photoId = DateTime.now().millisecondsSinceEpoch.toString();
        Reference ref = FirebaseStorage.instance.ref().child(photoId);

        // Upload the image file to Firebase Storage
        await ref.putFile(addUserProfilePick!).whenComplete(() async {
          String downloadUrl = await ref.getDownloadURL();
          userProfilePick["USER_IMAGE"] = downloadUrl;

          // Save the user profile in Firestore
          await db.collection("USER_PROFILE_PICK").doc(id).set(userProfilePick);
          notifyListeners();
        });
      } else {
        // If no image is provided, save the user profile without the image
        notifyListeners();
      }
    } catch (e) {
      print("Failed to upload profile image: $e");
    }
  }

  // Review Adding Function.............................................................

  TextEditingController reviewUserNameController = TextEditingController();
  TextEditingController reviewHotelNameController = TextEditingController();
  TextEditingController reviewSubNameController = TextEditingController();

  Future<void> ReviewPickImage(ImageSource source) async {
    final reviewImagePicker = ImagePicker();
    final reviewPickedImage = await reviewImagePicker.pickImage(source: source);

    if (reviewPickedImage != null) {
      await ReviewCropImage(reviewPickedImage.path);
      notifyListeners();
    } else {
      print('No image selected.');
    }
  }

  Future<void> ReviewCropImage(String path) async {
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
      reviewUserProfilePick = File(croppedFile.path);
      notifyListeners();
    }
  }

  String reviewProfileUrl = "";
  File? reviewUserProfilePick;
  bool isUploading = false;

  void reviewAddProfile(BuildContext context) async {
    isUploading = true;
    notifyListeners();
    try {
      String id = DateTime.now().millisecondsSinceEpoch.toString();
      Map<String, dynamic> reviewProfilePick = {
        "REVIEW_USER_IMAGE": reviewProfileUrl,
        "REVIEW_USER_NAME": reviewUserNameController.text,
        "REVIEW_HOTEL_NAME": reviewHotelNameController.text,
        "REVIEW_USER_REVIEW": reviewSubNameController.text,
      };

      // Check if there is an image file to upload
      if (reviewUserProfilePick != null) {
        // Check for addUserProfilePick
        String photoId = DateTime.now().millisecondsSinceEpoch.toString();
        Reference ref = FirebaseStorage.instance.ref().child(photoId);

        // Upload the image file to Firebase Storage
        await ref.putFile(reviewUserProfilePick!).whenComplete(() async {
          String downloadUrl = await ref.getDownloadURL();
          reviewProfilePick["REVIEW_USER_IMAGE"] = downloadUrl;

          // Save the user profile in Firestore
          await db
              .collection("REVIEW_USER_DETAILS")
              .doc(id)
              .set(reviewProfilePick);
          notifyListeners();
        });
      } else {
        // If no image is provided, save the user profile without the image
      }
    } catch (e) {
      print("Failed to upload profile image: $e");
    }

    getReview();
    clearReviwsFiled();
    isUploading = false;
    notifyListeners();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Review(),
        ));
  }

  List<ReviewStore> storeReviws = [];

  void getReview() {
    db.collection('REVIEW_USER_DETAILS').get().then((reviewValue) {
      storeReviws = reviewValue.docs.map((doc) {
        return ReviewStore(
          doc.id,
          doc.get("REVIEW_USER_IMAGE"),
          doc.get("REVIEW_USER_NAME"),
          doc.get("REVIEW_HOTEL_NAME"),
          doc.get("REVIEW_USER_REVIEW"),
        );
      }).toList();
      notifyListeners();
    });
  }

  void clearReviwsFiled() {
    reviewUserNameController.clear();
    reviewHotelNameController.clear();
    reviewSubNameController.clear();
    reviewUserProfilePick = null;
    notifyListeners();
  }

  // Delete Function....................................................................

  void deleteReviews(String id) {
    db.collection("REVIEW_USER_DETAILS").doc(id).delete();
    storeReviws.removeWhere((review) => review.id == id);
    notifyListeners();
  }
}
