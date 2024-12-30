import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haven_hub/Provider/MainProvider.dart';
import 'package:provider/provider.dart';
import 'Receipt.dart';
import 'notificationReceipt.dart';

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
        preferredSize: Size.fromHeight(height * 0.05),
        child: AppBar(
          title: Text(
            "Notification",
            style: TextStyle(fontSize: 27, fontFamily: "jeju2"),
          ),
          centerTitle: true,
          backgroundColor: Color(0xffFFFFFF).withOpacity(1),
          leading: Padding(
            padding: EdgeInsets.only(left: width / 34.25),
            child: IconButton(
              icon: Icon(Icons.arrow_back,
                  color: Colors.black.withOpacity(0.7)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: Consumer<MainProvider>(
        builder: (context,value,child) {
          return value.notificationList.isNotEmpty?
            RefreshIndicator(
              onRefresh: () async {
              },
              child: ListView.builder(
              itemCount: value.notificationList.length,
              itemBuilder: (context, index) {
                var item= value.notificationList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: InkWell(
                    onTap: () async {
                      await value.getBookingDetailsToNotification(item.bookingId);
                      Navigator.push(context,  MaterialPageRoute(
                        builder: (context) => notificatioReceipt(noti: value.NotificationItems!,),));
                    },
                    child: Container(
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
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset("assets/image/notificationcalender.png",scale: 2.55,),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                               item.title,
                                style: TextStyle(
                                  fontFamily: 'jeju2',
                                  fontSize: 20,
                                  color: Color(0xff070D30).withOpacity(1),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                item.subTitle,
                                style: TextStyle(
                                  fontFamily: "jeju2",
                                  color: Colors.grey.withOpacity(1),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
                        ),
            ):SizedBox(
              height: height/1.5,
              child: Center(child: Text("No Notifications")));
        }
      ),
    );
  }
}
