import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:haven_hub/admin/Hotel%20Model.dart';
import 'package:haven_hub/user/strand.dart';
import 'package:provider/provider.dart';
// import 'package:haven_hub/user/splash%203.dart';


import '../Provider/MainProvider.dart';
import '../admin/Hotels List.dart';
import '../admin/List of Bookings.dart';
import '../admin/User Details.dart';
import '../admin/Update Option.dart';
import 'Adress.dart';
import 'All Class.dart';
import 'Am Seagle.dart';
import 'Book Now.dart';
import 'ClubHouse.dart';
import 'Confirm Code.dart';
import 'Confirm Pay.dart';
import 'California.dart';
import 'Conti.dart';
import 'My Profile.dart';
import 'Exclusive.dart';
import 'Favorite.dart';
import 'Forgot Password.dart';
import 'Home.dart';
import 'Klaus.dart';
import 'Login Page.dart';
import 'Meree.dart';
import 'Nester.dart';
import 'New Password.dart';
import 'Notification.dart';
import 'Payment Failed.dart';
import 'Paymet Successful.dart';
import 'Profile.dart';
import 'Raceipt.dart';
import 'Review Adding.dart';
import 'Review.dart';
import 'Ruser.dart';
import 'Seetrasen.dart';
import 'Sign Up.dart';
import 'Splash 2.dart';
import 'Splash Screen.dart';
import 'Stay Vista.dart';
import 'Strandhus.dart';
import 'Vovo.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey:"AIzaSyDI8hK9D9jwV4hnhHY2BzHM75voJsE9P7c",
        appId:"1:202527854156:android:dc094ee0f82f1f0c3faee9",
        messagingSenderId: "202527854156",
        projectId:"havenhub-1ef83",
      storageBucket:"havenhub-1ef83.appspot.com"
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
        ChangeNotifierProvider(create: (context) => MainProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: California(),
      ),
    );
  }
}
