import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Listofbooking extends StatefulWidget {
  const Listofbooking({super.key});

  @override
  State<Listofbooking> createState() => _ListofbookingState();
}

class _ListofbookingState extends State<Listofbooking> {
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
            "Booking List",
            style: TextStyle(fontSize: 27, fontFamily: "jeju2"),
          ),
          centerTitle: true,
          backgroundColor: Color(0xffFFFFFF).withOpacity(1),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 23,),
          Center(
            child: InkWell(
              onTap: () {

              },
              child: Container(
               height: 80,
                width: 350,
                decoration: BoxDecoration(
                  color: Color(0xffFFFFFF).withOpacity(1),
                  border: Border.all(color: CupertinoColors.inactiveGray,width: 0.56),
                  borderRadius: BorderRadius.circular(23)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 23,top: 7),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jhon",style: TextStyle(
                          fontSize: 23,
                          color: Colors.black
                      ),
                      ),
                      SizedBox(height: 7,),
                      Text("Hotel California",
                        style: TextStyle(
                          fontSize: 15,
                          color: CupertinoColors.inactiveGray.withOpacity(1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 12,),
          Center(
            child: InkWell(
              onTap: () {

              },
              child: Container(
                height: 80,
                width: 350,
                decoration: BoxDecoration(
                    color: Color(0xffFFFFFF).withOpacity(1),
                    border: Border.all(color: CupertinoColors.inactiveGray,width: 0.56),
                    borderRadius: BorderRadius.circular(23)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 23,top: 7),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jhon",style: TextStyle(
                          fontSize: 23,
                          color: Colors.black
                      ),
                      ),
                      SizedBox(height: 7,),
                      Text("Hotel California",
                        style: TextStyle(
                          fontSize: 15,
                          color: CupertinoColors.inactiveGray.withOpacity(1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
