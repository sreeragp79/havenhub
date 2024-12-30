import 'dart:async';
import 'dart:collection';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import '../models/userModel.dart';
import '../user/Review.dart';

class MainProvider extends ChangeNotifier {
  MainProvider() {
    getExclusiveResorts();
    getReview();
    initializeNotifications();
  }

  final FirebaseFirestore db = FirebaseFirestore.instance;
  firebase_storage.Reference ref = FirebaseStorage.instance.ref("IMAGEURL");

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<void> initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    // Android 13 മുതൽ notifications-ന് permission ആവശ്യമാണ്.
    await requestNotificationPermission();
  }

  Future<void> requestNotificationPermission() async {
    // Using permission_handler package to request notification permissions
    PermissionStatus status = await Permission.notification.request();

    if (status.isDenied) {
      print('Notification permission denied');
    } else if (status.isGranted) {
      print('Notification permission granted');
    } else if (status.isPermanentlyDenied) {
      print('Notification permission permanently denied');
      // You can guide the user to app settings to enable notifications
    }
  }
  Future<void> showBookingSuccessNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'booking_channel', // Make sure this is the same as used in the initialization
      'Booking Notifications',
      channelDescription: 'This channel is used for booking success notifications',
      importance: Importance.max,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher'
    );

    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    print('Notification is about to be shown');
    await flutterLocalNotificationsPlugin.show(
      0,
      'Booking Successful',
      'Your Hotel Booking Successful',
      platformChannelSpecifics,
    );
    print('Notification shown');
  }

  // LogIn controller...................................................................
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // SignUp Function....................................................................

  TextEditingController signupPhoneorEmailController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();


  // Address Function...................................................................

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController dateofbirthController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var downValue = "";
  var countryValue = "";

  void addressDetails() {
    String userId = DateTime.now()
        .millisecondsSinceEpoch
        .toString();
    try {
    Map<String, dynamic> addressDetails = {
      "FIRST_NAME": firstnameController.text,
      "LAST_NAME": lastnameController.text,
      "GENDER": downValue,
      "DATE_OF_BIRTH": dateofbirthController.text,
      "EMAIL": emailController.text,
      "PHONE_NUMBER": phoneController.text,
      "COUNTRY": countryValue,
    };
    print("First Name: ${firstnameController.text}");
    print("Last Name: ${lastnameController.text}");

      db.collection("USER_ADDRESS").doc(userId).set(addressDetails,SetOptions(merge: true));

    db.collection("SIGNUP_DETAILS").doc(userId).update({
      "FIRST_NAME": firstnameController.text,
      "LAST_NAME": lastnameController.text,
      "EMAIL": emailController.text,
      "PROFILE_COMPLETED": true
    });
      notifyListeners();
    } catch (e) {
      print("Errorrrrrrrrrrrrrrrrrrrrrrrrrrrrr: $e");
    }
  }

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

  // date duration picker.............................................................
  int duration = 0;

  void getDateDuration(String checkInDate, String checkOutDate) {
    if (checkInDate.isNotEmpty && checkOutDate.isNotEmpty) {
      DateTime checkIn = DateFormat("dd-MM-yyyy").parse(checkInDate);
      DateTime checkOut = DateFormat("dd-MM-yyyy").parse(checkOutDate);
      duration = checkOut
          .difference(checkIn)
          .inDays;
      // print("sadadasdad: $duration");
      print("Duration: $duration"); // Duration print here
      notifyListeners();
    }
  }

  String checkInDate = "";
  String checkOutDate = "";

  void bookDate(String checkIn, String checkOut) {
    // checkInDate = checkIn;
    // checkOutDate = checkOut;
    String id = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    Map<String, dynamic> bookDate = {
      "CHECK_IN": checkIn,
      "CHECK_OUT": checkOut,
      "GUEST": value,
    };
    db.collection("BOOKING_DATE").doc(id).set(bookDate);
    notifyListeners();
  }

  // Guest + - Function...............................................................
  int value = 0;
  int tax = 5; // tax

  String totalAmount(String baseAmount) {
    print(baseAmount.toString());
    int amount = int.parse(baseAmount.replaceAll('\$', ''));
    // Calculate the total amount
    int total = value == 0 ? amount : value * amount;
    // Return the total amount  with a dollar sign
    return '\$${total}';
  }

  String calculateTotalAmount(int value, int duration, String baseAmount) {
    int amount = int.parse(baseAmount.replaceAll('\$', ''));
    int total = (value * duration * amount);
    return '\$${total}';
  }

  String includeTax(int value, int duration, String baseAmount) {
    int amount = int.parse(baseAmount.replaceAll('\$', ''));
    int total = (value * duration * amount) + tax;
    return '\$${total}';
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

  // -----------------------------Add Resort------------------------- ADMINNNNNNN..........
  String resortImageUrl = "";
  File? addResortFileImg;
  File? updateResortImage;

  Future<void> pickImage(ImageSource source) async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: source);

    if (pickedImage != null) {
      updateResortImage = File(pickedImage.path); // Set the picked image
      notifyListeners();
      await cropImage(pickedImage.path);
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
      updateResortImage = File(croppedFile.path);
      notifyListeners();
    }
  }

  TextEditingController resortNameController = TextEditingController();
  TextEditingController resortPlaceController = TextEditingController();
  TextEditingController resortImformationController = TextEditingController();
  TextEditingController resortPriceController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  void addResort() async {
    try {
      String id = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();
      // Create a map for the resort details
      Map<String, dynamic> addResortDetails = {
        "RESORT IMAGE": resortImageUrl,
        "RESORT_NAME": resortNameController.text,
        "RESORT_PLACE": resortPlaceController.text,
        "RESORT_INFORMATION": resortImformationController.text,
        "RESORT_PRICE": resortPriceController.text,
      };
      notifyListeners();

      // Check if there is an image file to upload
      if (addResortFileImg != null) {
        String photoId = DateTime
            .now()
            .millisecondsSinceEpoch
            .toString();
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

  List<ResortAddingDetails> ExclusiveList = [];
  List<ResortAddingDetails> carousalList = [];

   getExclusiveResorts() async {
    print("sdfsfsdfsdfsdf");
    await db.collection("ADD_RESORT_DETAILS").get().then((value) {
      ExclusiveList = value.docs.map((doc) {
        return ResortAddingDetails(
          doc.id,
          doc.get("RESORT IMAGE"),
          doc.get("RESORT_NAME"),
          doc.get("RESORT_PLACE"),
          doc.get("RESORT_INFORMATION"),
          doc.get("RESORT_PRICE"),
        );
      }
      ).toList();
      carousalList = ExclusiveList.take(4).toList();
print("dfddddddddddd ${ExclusiveList.length}");
      notifyListeners();
    });
  }

  //  Admin Resort Detyails Update Option..............................................
  Future<void> resortUpdation(String resortId) async {
    try {
      Map<String, dynamic> resortUpdateDeatils = {
        "RESORT_NAME": resortNameController.text,
        "RESORT_PLACE": resortPlaceController.text,
        "RESORT_INFORMATION": resortImformationController.text,
        "RESORT_PRICE": resortPriceController.text,
      };
      notifyListeners();
      // new photo add cheyyunnu pinne url downlod cjhryyunnu.........................
      if (updateResortImage != null) {
        String photoId = DateTime
            .now()
            .millisecondsSinceEpoch
            .toString();
        Reference ref = FirebaseStorage.instance.ref().child(photoId);

        await ref.putFile(updateResortImage!).whenComplete(() async {
          String downlodUrl = await ref.getDownloadURL();
          resortUpdateDeatils["RESORT IMAGE"] = downlodUrl;
        });
      }
      await db.collection("ADD_RESORT_DETAILS").doc(resortId).update(
          resortUpdateDeatils);
      notifyListeners();
    } catch (e) {
      print("Failed to update resort details:$e");
    }
  }

  // clear the details after click the add botton......................................
  void clearField1() {
    resortNameController.clear();
    resortPlaceController.clear();
    resortImformationController.clear();
    resortPriceController.clear();
    addResortFileImg = null;
    notifyListeners();
  }

 // user profile photo update picker....................................................

  String userProfileUrl = "";
  File? addUserProfilePick;
  Future<void> UserPickImage(ImageSource source) async {

    final userImagePicker = ImagePicker();
    // pick image
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

  String reviewProfileUrl = "";
  File? reviewUserProfilePick;
  bool isUploading = false;

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
        String photoId = DateTime
            .now()
            .millisecondsSinceEpoch
            .toString();
        Reference ref = FirebaseStorage.instance.ref().child(photoId);

        // Upload the image file to Firebase Storage
        await ref.putFile(reviewUserProfilePick!).whenComplete(() async {
          String downloadUrl = await ref.getDownloadURL();
          reviewProfilePick["REVIEW_USER_IMAGE"] = downloadUrl;

          // Save the user profile in Firestore
          await db.collection("REVIEW_USER_DETAILS").doc(id).set(reviewProfilePick);
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

  //USER BOOKING HOTEL ADMIN GET........................................................

 Future<void> userBookingDetails(ResortAddingDetails hotel)async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId =prefs.getString("USER_ID");

    if(userId == null) return;
    String bookingId = DateTime.now().millisecondsSinceEpoch.toString();

    String totelAmount= calculateTotalAmount(value, duration, hotel.price);
    String totelTaxAmount= includeTax(value, duration, hotel.price);
    try {
      print(hotel.name + " nnnnnnnnnnn");
      print(firstnameController.text + " nnnnnnnnnnn");
      print(phoneController.text+ " nnnnnnnnnnn");
      print(checkInDate+ " nnnnnnnnnnn");
      print(checkOutDate+ " nnnnnnnnnnn");
      print(value.toString()+ " nnnnnnnnnnn");
      print(totelAmount.toString()+ " nnhghghnnnnnnnnn");
      print(totelTaxAmount.toString()+ " iiiiiiiiinnnnnnnnnnn");
      print(hotel.price.toString()+ " iiiiiiiiinnnnnnnnnnn");
      Map<String, dynamic> userBookingDetails = {
        "BOOKING_ID" : bookingId,
        "USER_ID": userId,
        "RESORT_IMAGE": hotel.image,
        "RESORT_PRICE": hotel.price,
        "RESORT_NAME": hotel.name,
        "FIRST_NAME": firstnameController.text,
        "PHONE_NUMBER": phoneController.text,
        "CHECK_IN": checkInDate,
        "CHECK_OUT": checkOutDate,
        "GUEST": value,
        "TOTEL_AMOUNT": totelAmount,
        "TOTEL_TAX_AMOUNT":totelTaxAmount,
      };
      Map<String,String> notifications ={
        "BOOKING_ID":bookingId,
        "USER_ID": userId,
        "TITLE": "Booking Succesful",
        "SUB_TITLE": "Happy! you have succesfully booked a \n"
            "hotel room with the folowing deatails..",
        "OPENED": "NO"
      };
      db.collection("NOTIFICATION").doc(bookingId).set(notifications);
      db.collection("BOOKING_USER_LIST").doc(bookingId).set(userBookingDetails);
      showBookingSuccessNotification();

      notifyListeners();
    }catch(erorrrrrrrrrrrrrrrrrrrr){
      print("errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr:$erorrrrrrrrrrrrrrrrrrrr");
    }
    }

  List<NotificationMessage> notificationList=[];
  Future<void> getNotification() async {
    print("ffffffffffffffffffff");
    db.collection("NOTIFICATION").get().then((value){
      if (value.docs.isNotEmpty) {
        for (var element in value.docs) {
          Map<dynamic, dynamic> map = element.data();
          notificationList.add(NotificationMessage(
            map["BOOKING_ID"] ?? '',
            map["TITLE"] ?? '',
            map["SUB_TITLE"] ?? '',
            map["USER_ID"] ?? '',
            map["NOTIFICATION_ID"] ?? '',
            map["OPENED"] ?? '',
          ));
        }
        notifyListeners();
      }
    });

  }
  //
  void clearNotification(){
    notificationList.clear();
    print(notificationList.toString() + "kkkkkkkkkkkkk");
    notifyListeners();
  }

  BookingGetAdmin? NotificationItems;
  Future<void> getBookingDetailsToNotification(String bookingId)async{
    try {
      var doc = await db.collection("BOOKING_USER_LIST").doc(bookingId).get();
      if (doc.exists) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        NotificationItems = BookingGetAdmin(
          data["id"] ?? '',
          data["RESORT_IMAGE"] ?? '',
          data["RESORT_PRICE"] ?? '',
          data["RESORT_NAME"] ?? '',
          data["CHECK_IN"] ?? '',
          data["GUEST"]?.toString() ?? '',
          data["CHECK_OUT"] ?? '',
          data["TOTEL_AMOUNT"]?.toString() ?? '',
          data["TOTEL_TAX_AMOUNT"]?.toString() ?? '',
          data["FIRST_NAME"]?? '',
          data["PHONE_NUMBER"]?.toString()?? '',
        );
        print("erorrrrrrrrrrrrrrrrrrrr:${data["TOTEL_TAX_AMOUNT"]?.toString()}");
      }
      notifyListeners();
    }catch(erorrrrrrrrrrrrrr){
      print("erorrrrrrrrrrrrrrrrrrrr:$erorrrrrrrrrrrrrr");
    }
  }


  List<BookingGetAdmin> bookingList = [];

  void getBookingDetails(){
    bookingList.clear();
    db.collection("BOOKING_USER_LIST").orderBy("BOOKING_ID",descending: true).get().then((value){
      if(value.docs.isNotEmpty){
        for(var element in value.docs){
          Map<dynamic,dynamic>map =element.data();
          bookingList.add(BookingGetAdmin(
              element.id,
              map["RESORT_IMAGE"].toString()??'',
              map["RESORT_PRICE"].toString()??'',
              map["RESORT_NAME"].toString()??'',
              map["CHECK_IN"].toString()??'',
              map[ "GUEST"].toString()??'',
              map["CHECK_OUT"].toString()??'',
              map["TOTEL_AMOUNT"].toString()??'',
              map["TOTEL_TAX_AMOUNT"].toString()??"",
              map["FIRST_NAME"].toString()??'',
              map["PHONE_NUMBER"].toString()??''
          ));
          print("nnnnnnnnnnnnnnnnnnn"+bookingList.toString());
        }
        notifyListeners();
      }
    });
    notifyListeners();
  }

void clearGuestValue(){
    value =1;
    notifyListeners();
}
}


