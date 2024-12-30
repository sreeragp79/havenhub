import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haven_hub/Provider/LoginProvider.dart';
import 'package:haven_hub/Provider/MainProvider.dart';
import 'package:provider/provider.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  bool isChecked = true;

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
            "favorite",
            style: TextStyle(fontSize: 27, fontFamily: "jeju2"),
          ),
          centerTitle: true,
          backgroundColor: Color(0xffFFFFFF).withOpacity(1),
          leading: Padding(
            padding: EdgeInsets.only(left: width / 34.25),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black.withOpacity(0.7),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: Consumer<Loginprovider>(
          builder: (context90, val, child) {
          return Consumer<MainProvider>(
            builder: (context77, value, child) {
              return value.ExclusiveList.isNotEmpty?
                ListView.builder(
                itemCount: value.ExclusiveList.length,
                itemBuilder: (context, index) {
                  var item = value.ExclusiveList[index];
                  print("${val.favoriteResortList.contains(item.id)} bbbbbbbbbbbbb ${value.ExclusiveList.length}");
                  return val.favoriteResortList.contains(item.id)?
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Center(
                      child: Container(
                        width: width * 0.89,
                        height: height * 0.15,
                        decoration: BoxDecoration(
                          //
                          color: Colors.white,
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
                            // Image Container
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: height * 0.12,
                                width: width * 0.32,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage( item.image,)
                                  ),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Hotel Name and Delete Icon
                                SizedBox(height:height/40.23,),
                                Text(
                                  item.name,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff070D30).withOpacity(1),
                                    fontFamily: "jeju2",
                                  ),
                                ),
                                SizedBox(height: 6,),
                                Image.asset(
                                  "assets/image/500 re.png",
                                  scale: 4.20,
                                ),
                                // Price and Favorite Icon
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 15,),
                                        Row(
                                          children: [
                                            Text(
                                              item.price,
                                              style: TextStyle(
                                                fontSize: 29,
                                                fontFamily: "jeju2",
                                                color: Color(0xff070D30).withOpacity(1),
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Text(
                                              "Night",
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: "jeju2",
                                                color: CupertinoColors.inactiveGray.withOpacity(0.80),
                                              ),
                                            ),
                                          ],
                                        ),

                                      ],
                                    ),
                                    Consumer<Loginprovider>(
                                      builder: (context,value2,child) {
                                        return SizedBox(
                                          height: height/30.34,width: height/8.56,
                                          child: IconButton(
                                            onPressed: () {
                                                String resortId = item.id;
                                                value2.addToFavoriteResorts(value2.loginUserId,resortId);
                                                isChecked = !isChecked;
                                            },
                                            icon: Icon(Icons.favorite),
                                            color: value2.favoriteResortList.contains(item.id) ? Colors.red : Colors.grey,
                                          ),
                                        );
                                      }
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ):SizedBox();
                },
              )
              :SizedBox(
                height: height/1.5,
                child: Center(child: Text("No Resorts")),
              );
            },
          );
        }
      ),
    );
  }
}
