

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';


class AddToCart extends StatefulWidget {
  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  var deviceInfo = DeviceInfoPlugin();
  var  sum=0;
  String ? uiddd;
  deviceid()async{
    var androidDeviceInfo =await deviceInfo.androidInfo;
     uiddd = androidDeviceInfo.androidId;
  }

  @override
  Widget build(BuildContext context) {
    deviceid();
    return Scaffold(
        body: SafeArea(
      child: Container(
            child: Column(
                children: [

            Padding(
            padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                    onLongPress: () {
                    },
                    child: RichText(
                      softWrap: true,
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: "M",
                            style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            )),
                        TextSpan(
                            text: "en's ",
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: "F",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: "ashion",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold))
                      ]),
                    )),
              ),
            ]
          )
            ),

                  Container(
                    height: MediaQuery.of(context).size.height*0.6,
                    width: MediaQuery.of(context).size.width,
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("AddToCart").where("deviceid",isEqualTo:uiddd )
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return Container(
                              height: 500,
                              width: 500,
                              child: Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.green,
                                  )));
                        } else {
                          return ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (_, index) {
                                    var data = snapshot.data!.docs;
                                    sum = data.fold(0, (previousValue, element){
                                 return previousValue + int.parse(element['discountprize'].toString());

                                 });

                                return Padding(
                                  padding: const EdgeInsets.only(left: 14.0,bottom: 14),
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Container(
                                          height: MediaQuery.of(context).size.height*0.15,
                                          width: MediaQuery.of(context).size.width*0.48,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(10),
                                              border: Border.all(
                                                  width: 0.2, color: Colors.grey),
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: NetworkImage(snapshot
                                                      .data!
                                                      .docs[index]["image"]))),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 4.0),
                                        child: Container(
                                          height: MediaQuery.of(context).size.height*0.14,
                                          width: MediaQuery.of(context).size.width*0.45,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(top: 10.0,left: 32),
                                                child: Text(snapshot.data!.docs[index]["name"],style: TextStyle(fontWeight: FontWeight.bold),),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 32.0,top: 8,),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                                  children: [
                                                    Text("Rs."+snapshot.data!.docs[index]["discountprize"].toString()),

                                                    Text("x"+snapshot.data!.docs[index]["quantity"].toString()),
                                                  ],
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                );
                              });
                        }
                      },
                    ),
                  ),

                  Container(
                    height: MediaQuery.of(context)
                        .size
                        .height *
                        0.1,
                    width: MediaQuery.of(context)
                        .size
                        .width,
                    child: Row(
                      children: [
                        Text("Total"),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(sum.toString()),
                        )
                        ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context)
                          .size
                          .height *
                          0.04,
                      width: MediaQuery.of(context)
                          .size
                          .width *
                          0.28,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius:
                          BorderRadius.circular(
                              10)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding:
                          const EdgeInsets.only(
                              left: 8.0),
                          child: Text(
                            "CHECKOUT",
                            style: TextStyle(
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              )
            ),
          ),

    );
  }
}
