import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../consatnts/samples.dart';

class newPage extends StatelessWidget {
  const newPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.blue,
          ),
          Container(
            height: 10,
          ),
          SizedBox(


          ),
          hwllo(100,200,Colors.red),
          hwllo(100,200,Colors.yellow),
        ],
      ),
    );
  }
}

