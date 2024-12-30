import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haven_hub/admin/Hotels%20List%20Admin.dart';

import '../models/userModel.dart';
import 'Update option.dart';

class UpdatationPage extends StatefulWidget {
  ResortAddingDetails hotel;
  UpdatationPage({super.key,required this.hotel});

  @override
  State<UpdatationPage> createState() => UpdatationPageState();
}

class UpdatationPageState extends State<UpdatationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( // Centralize the buttons in the screen
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the buttons vertically
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AdminList()));
              },
              child: Text("Update",
              style: TextStyle(
                fontSize: 23,
              ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AdminUpdate(hotel: widget.hotel,)));
              },
              child: Text("Add Hotel",
                style: TextStyle(
                  fontSize: 23,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
