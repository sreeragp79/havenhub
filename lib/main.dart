import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:haven_hub/Provider/LoginProvider.dart';
import 'package:haven_hub/admin/Hotel%20Model.dart';
import 'package:provider/provider.dart';
// import 'package:haven_hub/user/splash%203.dart';
import 'Provider/MainProvider.dart';
import 'admin/Admin Login.dart';
import 'admin/Admin SignUp.dart';
import 'admin/Hotels List Admin.dart';
import 'admin/List of Bookings.dart';
import 'admin/Update option.dart';
import 'admin/User Raceipt.dart';
import 'admin/Add Option.dart';
import 'models/userModel.dart';
import 'user/Adress.dart';
import 'user/All Class.dart';
import 'user/Book Now.dart';
import 'user/Confirm Code.dart';
import 'user/Confirm Pay.dart';
import 'user/Hotel Display.dart';
import 'user/My Profile.dart';
import 'user/Exclusive.dart';
import 'user/Favorite.dart';
import 'user/Forgot Password.dart';
import 'user/Home.dart';
import 'user/Login Page.dart';
import 'user/New Password.dart';
import 'user/Notification.dart';
import 'user/Payment Failed.dart';
import 'user/Paymet Successful.dart';
import 'user/Profile.dart';
import 'user/Receipt.dart';
import 'user/Review Adding.dart';
import 'user/Review.dart';
import 'user/Sign Up.dart';
import 'user/Splash 2.dart';
import 'user/Splash Screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey:"AIzaSyDI8hK9D9jwV4hnhHY2BzHM75voJsE9P7c",
        appId:"1:202527854156:android:dc094ee0f82f1f0c3faee9",
        messagingSenderId: "202527854156",
        projectId:"havenhub-1ef83",
      storageBucket:"havenhub-1ef83.appspot.com",
    ),
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainProvider(),),
        ChangeNotifierProvider(create: (context) => Loginprovider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splash(),
      ),
    );
  }
}
