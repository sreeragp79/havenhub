import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Noti extends StatefulWidget {
  const Noti({super.key});

  @override
  State<Noti> createState() => _NotificationState();
}

class _NotificationState extends State<Noti> {
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
              "Notification",
              style: TextStyle(fontSize: 27, fontFamily: "jeju2"),
            ),
            centerTitle: true,
            backgroundColor: Color(0xffFFFFFF).withOpacity(1),
            leading: Padding(
              padding:  EdgeInsets.only(left: width/34.25),
              child: IconButton(
                icon: Icon(Icons.arrow_back,
                    color: Colors.black
                        .withOpacity(0.7)), // Specify icon and color
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          SizedBox(
            height: 23,
          ),
          Center(
              child: Stack(children: [
            Container(
              width: width * 0.89,
              height: height * 0.12,
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF).withOpacity(1),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 2,
                      color: CupertinoColors.inactiveGray.withOpacity(0.26),
                      blurRadius: 4,
                      offset: Offset(0, 3)),
                ],
              ),
            ),
                Positioned(
                  top: 25,
                    left: 23,
                    child: Image.asset("assets/image/Date_range_duotone_line.png",scale: 2.55,)),
                Positioned(
                  left: 100,
                    top: 20,
                    child: Text("Booking Succesful",
                    style: TextStyle(
                      fontFamily:'jeju2',
                      fontSize: 20,
                      color: Color(0xff070D30).withOpacity(1),
                    ),
                    ),
                ),
                Positioned(
                  left: 101,
                  top: 48,
                  child: Text("Happy! you have succesfully booked a \n"
                    "hotel room with the folowing deatails..",
                  style: TextStyle(
                    fontFamily: "jeju2",
                    color: Colors.grey.withOpacity(1)
                  ),
                  ),
                ),

          ],
              ),
          ),
              SizedBox(height: 20,),
              Center(
                child: Stack(children: [
                  Container(
                    width: width * 0.89,
                    height: height * 0.12,
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF).withOpacity(1),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            color: CupertinoColors.inactiveGray.withOpacity(0.26),
                            blurRadius: 4,
                            offset: Offset(0, 3)),
                      ],
                    ),
                  ),
                  Positioned(
                      top: 25,
                      left: 23,
                      child: Image.asset("assets/image/Discount.png",scale: 2.55,)),
                  Positioned(
                    left: 100,
                    top: 20,
                    child: Text("New Offers Available..",
                      style: TextStyle(
                        fontFamily:'jeju2',
                        fontSize: 20,
                        color: Color(0xff070D30).withOpacity(1),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 101,
                    top: 48,
                    child: Text("Check Now..",
                      style: TextStyle(
                          fontFamily: "jeju2",
                          color: Colors.grey.withOpacity(1)
                      ),
                    ),
                  ),

                ],
                ),
              ),

        ],
            ),

        ),
      
    );
  }
}
