import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:haven_hub/admin/Hotels%20List%20Admin.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../admin/Admin SignUp.dart';
import '../models/userModel.dart';
import '../user/Home.dart';

class Loginprovider extends ChangeNotifier {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  // SignUp Notification.............................................................

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
  Future<void> showSignUpNotification() async {
    String userName = signupPhoneorEmailController.text;
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
      'Sign up complete',
      '$userName,Signed up successfully',
      platformChannelSpecifics,
    );
    print('Notification shown');
  }

  // LogIn Notification.............................................................

  Future<void> lOGINinitializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    // Android 13 മുതൽ notifications-ന് permission ആവശ്യമാണ്.
    await LoginrequestNotificationPermission();
  }

  Future<void> LoginrequestNotificationPermission() async {
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
  Future<void> showLogInNotification(String phone) async {
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
      'LogIn Successful',
      '$phone,LogIn successfully',
      platformChannelSpecifics,
    );
    print('Notification shown');
    print("aaaaaaaaaaaaa$phone");
  }



  TextEditingController signupPhoneorEmailController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signUpDetails() async {
    String userId = DateTime.now().millisecondsSinceEpoch.toString();
    Map<String, dynamic> signUpDetails = {
      "USER_ID": userId,
      "PHONE": signupPhoneorEmailController.text,
      "PASSWORD": signupPasswordController.text,
    };
    loginUserId = userId;
    db.collection("SIGNUP_DETAILS").doc(userId).set(signUpDetails);

    // യൂസർ ഡീറ്റെയിൽസ് SharedPreferences ൽ സേവ് ചെയ്യുന്നു........................

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("PHONE", signupPhoneorEmailController.text);
    await prefs.setString("PASSWORD", signupPasswordController.text);
    await prefs.setString("USER_ID", userId);
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
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController dateofbirthController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var downValue = "";
  String userProfileUrl = "";
  var countryValue = "";
  List<dynamic> favoriteResortList =[]; // favorite array list
  String loginUserId = "";

  Future<void> userDataStore(BuildContext context, String phone, String password) async {
    try {
      // Firebase Query-ൽ നിന്നും ഫോൺ നമ്പർ ചെക്ക് ചെയ്യുന്നു
      var querySnapshot = await FirebaseFirestore.instance.collection('SIGNUP_DETAILS')
          .where('PHONE', isEqualTo: phone).get();

      // Check if Phone Number Exists...
      if (querySnapshot.docs.isNotEmpty) {
        var userData = querySnapshot.docs.first.data();

        // പാസ്വേഡ് മാച്ച് ചെയ്യുന്നു
        if (userData['PASSWORD'] == password) {
          // പാസ്വേഡ് ശരിയായാൽ Home Page-ലേക്ക് നയിക്കുന്നു

          loginUserId = userData['USER_ID'];
          favoriteResortList = userData['FAVORITE_RESORTS']??[];

           var userProfile = await db.collection("USER_ADDRESS").doc(loginUserId).get();
           if(userProfile.exists){
            var profiledata = userProfile.data()!;
            firstnameController.text = profiledata['FIRST_NAME'] ?? '';
            emailController.text = profiledata['FIRST_NAME'] ?? '';
            phoneController.text = profiledata['FIRST_NAME'] ?? '';
            userProfileUrl = profiledata['USER_IMAGE'] ?? '';
           }
          // Package name എടുക്കുന്നു
          PackageInfo packageInfo = await PackageInfo.fromPlatform();
          String packageName = packageInfo.packageName;
          if(packageName == "com.example.haven_hub_admin"){
            Navigator.push(context, MaterialPageRoute(builder: (context) => AdminList()));
          }else{
            Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
          }
          showLogInNotification(phone);
        } else {
          // പാസ്വേഡ് തെറ്റായാൽ Snackbar ഉപയോഗിച്ച് Error കാണിക്കുന്നു
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Invalid password. Please try again.")),
          );
        }
      } else {
        // ഫോണിനമ്പർ കളക്ഷനിൽ ഇല്ലെങ്കിൽ Error കാണിക്കുന്നു
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Phone number not found. Please sign up.")),
        );
      }
    } catch (e) {
      // Error Handling
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error occurred. Please try again later.")),
      );
      print(e);
    }
    notifyListeners();
  }
// Favorite arrayy function................................................................

  void addToFavoriteResorts(String userId, String resortId) {
    db.collection("SIGNUP_DETAILS").doc(userId).get().then((value) {
      if (value.exists) {
        List<dynamic> currentFavoriteItem = value.data()?["FAVORITE_RESORTS"] ?? [];
        if (currentFavoriteItem.contains(resortId)) {
          // remove added items in the array
          db.collection("SIGNUP_DETAILS").doc(userId).update({
            "FAVORITE_RESORTS": FieldValue.arrayRemove([resortId]),});
          favoriteResortList.remove(resortId);
          notifyListeners();
        }else{
          // favorite array adding...
          db.collection("SIGNUP_DETAILS").doc(userId).
          set({"FAVORITE_RESORTS": FieldValue.arrayUnion([resortId])},
              SetOptions(merge: true));
          favoriteResortList.add(resortId);
          notifyListeners();
        }
      }
      notifyListeners();
    });
  }
// // filtter function
//
//   List<ReportModel> getAttendanceReportList(String from) {
//     switch (from) {
//     case 'STATE_LEVEL':
//     return stateRegistrationReportList;
//     case 'DISTRICT_LEVEL':
//     return districtRegistrationReportList;
//     case 'ASSEMBLY_LEVEL':
//     return assemblyRegistrationReportList;
//     case 'MANDALAM_LEVEL':
//     return mandalamRegistrationReportList;
//     // case 'BOOTH_LEVEL':
//     //   return [];
//     default:
//     return[];
//     }
//     }
//
//
//   fetchMyDrivers(String userID){
//     db.collection("DRIVERS").where("ADDED_BY_ID", isEqualTo: userID).get().then((value){
//       if(value.docs.isNotEmpty){
//         myDriverList.clear();
//         filterMyDriverList.clear();
//         myPermanentDriverList.clear();
//         filterMyPermanentDriverList.clear();
//         myActingDriverList.clear();
//         filterMyActingDriverList.clear();
//         for(var element in value.docs) {
//           Map<dynamic, dynamic>map = element.data();
//           DateTime scheduledTimeFrom = DateTime.now();
//           if (map['ADDED_DATE'] != null) {
//             Timestamp timestamp = map['ADDED_DATE'];
//             scheduledTimeFrom = DateTime.parse(timestamp.toDate().toString());
//           }
//           myDriverList.add(MyDriverModel(
//               element.id,
//               map["NAME"]??"",
//               map["PHONE"]??"",
//               map["WHATSAPP"]??"",
//               map['PHOTO']??"",
//               map["STATE"]??"",
//               map["DISTRICT"]??"",
//               map["EXPERT"]??[],
//               map["VEHICLE_ID"]??"",
//               map["VEHICLE_NUMBER"]??"",
//               map["DRIVING_LICENSE_PHOTO"]??"",
//               map["DRIVER_SERVICE"]??"",
//               map["ADDED_BY_ID"]??"",
//               map["ADDED_BY_NAME"]??"",
//               scheduledTimeFrom
//           ));
//         }
//         filterMyDriverList = myDriverList;
//         myPermanentDriverList = filterMyDriverList.where((element)=>element.service == "PERMANENT").toSet().toList();
//         myActingDriverList = filterMyDriverList.where((element)=>element.service == "ACTING").toSet().toList();
//         filterMyPermanentDriverList = myPermanentDriverList;
//         filterMyActingDriverList = myActingDriverList;
//         notifyListeners();
//       }
//     });
//   }


}
