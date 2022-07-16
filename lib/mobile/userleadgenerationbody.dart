// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:remove_h2o/Mobile/leadgenerationscreen.dart';
import 'package:remove_h2o/mobile/screen_buttons/take_photo.dart';
import 'package:remove_h2o/mobile/size_config.dart';
import 'package:remove_h2o/mobile/ushome/user_nav_drawer.dart';

class UserLeadgenerationbody extends StatefulWidget {
  const UserLeadgenerationbody({Key? key}) : super(key: key);

  @override
  State<UserLeadgenerationbody> createState() => _UserLeadgenerationbodyState();
}

class _UserLeadgenerationbodyState extends State<UserLeadgenerationbody> {
  final auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('Leads');
  final Stream<QuerySnapshot> usersStream =
      FirebaseFirestore.instance.collection('Leads').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(
          color: Colors.blue,
        ),
        toolbarHeight: 90,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        centerTitle: true,
        title: Image.asset(
          "assets/images/logo.png",
          height: getProportionateScreenHeight(270),
        ),
      ),
      // drawer: UserNavigationDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
          //   child: CircleAvatar(
          //       backgroundColor: Colors.black,
          //       radius: 16,
          //       child: IconButton(
          //         onPressed: () {
          //           Navigator.pop(context);
          //         },
          //         icon: Padding(
          //           padding: const EdgeInsets.only(left: 2.0, bottom: 1),
          //           child: Icon(Icons.arrow_back_ios, size: 18),
          //         ),
          //       )),
          // ),
          // SizedBox(
          //   height: 25.0,
          // ),
          // SizedBox(height: 100),
          StreamBuilder<QuerySnapshot>(
              stream: usersStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }
                return Expanded(
                    child: ListView(
                        shrinkWrap: true,
                        // itemCount: snapshot.data!.docs.length,
                        // itemBuilder: ((context, index) {
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          print(Text(data['name']));
                          return LeadgenerationScreen(
                              text: data['name'],
                              icon: FontAwesomeIcons.hourglassEnd,
                              press: () {
                                print(data['work']);
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                        ),
                                        // title: Text("This is the alert Dialog Box."),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            getLeadsDetail(
                                                name: "Name",
                                                data: data['name']),
                                            getLeadsDetail(
                                                name: "Email",
                                                data: data['mailadress']),
                                            getLeadsDetail(
                                                name: "Address",
                                                data: data['address']),
                                            getLeadsDetail(
                                                name: "Work Address",
                                                data: data['workadress']),
                                            getLeadsDetail(
                                                name: "Phone",
                                                data: data['cellNo']),
                                            getLeadsDetail(
                                                name: "Work",
                                                data: data['work']),
                                            Center(
                                              child: MaterialButton(
                                                color: Colors.blue,
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  "Done",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold
                                                      // fontSize: 17
                                                      ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    });
                              });
                        }).toList()));
                //     return Text('nodata');
                //   }),
                // );
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => PhotoData()));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget getLeadsDetail({required String name, required String data}) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$name:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(data)
          ],
        ));
  }
}
