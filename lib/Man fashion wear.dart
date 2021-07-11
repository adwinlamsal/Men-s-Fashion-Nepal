
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menfashionnepal/New%20Section.dart';
import 'package:uuid/uuid.dart';
import 'Categories.dart';
import 'TrendsSection.dart';

class Fashion extends StatefulWidget {
  @override
  _FashionState createState() => _FashionState();
}

class _FashionState extends State<Fashion> {

  TextEditingController? Categories;
   late Query reference;
   late DatabaseReference valuee;
   value(){
     reference = FirebaseDatabase.instance.reference().child("Collection");
     valuee = FirebaseDatabase.instance.reference().child("Collection");
     setState(() {

     });
   }

   List list = [
     Colors.red,Colors.blue,Colors.green,Colors.deepOrangeAccent,Colors.deepPurple,Colors.pink,Colors.amber,
     Colors.red,Colors.blue,Colors.green,Colors.deepOrangeAccent,Colors.deepPurple,Colors.pink,Colors.amber,
     Colors.red,Colors.blue,Colors.green,Colors.deepOrangeAccent,Colors.deepPurple,Colors.pink,Colors.amber,
     Colors.red,Colors.blue,Colors.green,Colors.deepOrangeAccent,Colors.deepPurple,Colors.pink,Colors.amber,
     Colors.red,Colors.blue,Colors.green,Colors.deepOrangeAccent,Colors.deepPurple,Colors.pink,Colors.amber,
   ];


  @override
  void initState() {
    Categories = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    value();
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 1,
          child: ListView(
            shrinkWrap: true,
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Men's Fashion",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 1.0,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
              CarouselSlider(
                items: [
                  Container(
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    height: MediaQuery.of(context).size.height * 0.28,
                    width: MediaQuery.of(context).size.width * 95,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("Assets/two.png"),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 1),
                              blurRadius: 2)
                        ]),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    height: MediaQuery.of(context).size.height * 0.28,
                    width: MediaQuery.of(context).size.width * 95,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("Assets/one.png"),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 1),
                              blurRadius: 2)
                        ]),
                  ),
                ],
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  aspectRatio: 2.0,
                  initialPage: 2,
                ),
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 1,
                color: Colors.white,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                       height: MediaQuery.of(context).size.height*0.2,
                        width: MediaQuery.of(context).size.width*1,

                        child: FirebaseAnimatedList(
                          scrollDirection: Axis.horizontal,
                            query: reference,
                            itemBuilder: (BuildContext context,
                                DataSnapshot snapshot,
                                Animation<double> animation,
                                int index) {
                              Map contact = snapshot.value;
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Categori(category:contact["Value"])));

                                  },
                                  onLongPress: (){

                                    showCupertinoModalPopup(
                                        context: context,
                                        builder: (BuildContext
                                        context) =>
                                            CupertinoActionSheet(
                                              title: Text(
                                                  "Men's Fashion Collection "),
                                              actions: [
                                                CupertinoActionSheetAction(
                                                  child: Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                          const EdgeInsets.all(8.0),
                                                          child:
                                                          Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment.center,
                                                            children: [
                                                              GestureDetector(
                                                                onTap: () {
                                                                  valuee.child(contact["postid"]).remove();
                                                                  Navigator.pop(context);
                                                                },
                                                                child: Row(
                                                                  children: [
                                                                    Icon(CupertinoIcons.delete),
                                                                    const Text('Delete', style: TextStyle(fontSize: 16)),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ]),
                                                  onPressed:
                                                      () {
                                                  },
                                                )
                                              ],
                                            ));





                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color:list[index],
                                        boxShadow: [BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0,1),
                                          blurRadius: 2
                                        )]
                                         ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(contact["Value"],
                                            style: TextStyle(color: Colors.white)),

                                      )),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: CupertinoTextField(
                  suffix: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        String postid = Uuid().v4();
                        FirebaseDatabase.instance
                            .reference()
                            .child("Collection")
                            .child(postid)
                            .set({
                          "Value": Categories!.text,
                          "postid":postid
                        }).whenComplete(() {
                          setState(() {
                            Categories!.clear();
                          });
                        });
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.redAccent,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 1),
                                    blurRadius: 2)
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text("Add",
                                style: TextStyle(color: Colors.white)),
                          )),
                    ),
                  ),
                  controller: Categories,
                  placeholder: "Categories",
                ),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Trends",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 1.0,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Trends(Trend:"Trends",)));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 1),
                                    blurRadius: 2)
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 1),
                                child: Text(
                                  "View more",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              Container(
                margin: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height * 0.28,
                width: MediaQuery.of(context).size.width * 0.95,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.redAccent,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 1),
                          blurRadius: 2)
                    ]),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "New",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 1.0,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){

                          Navigator.push(context, MaterialPageRoute(builder: (context)=>New(neww:"New",)));

                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 1),
                                    blurRadius: 2)
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 1),
                                child: Text(
                                  "View More",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              Container(
                margin: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height * 0.28,
                width: MediaQuery.of(context).size.width * 0.95,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.redAccent,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 1),
                          blurRadius: 2)
                    ]),
              ),






            ],
          ),
        ),
      ),
    );
  }
}
