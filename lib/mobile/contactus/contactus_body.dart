// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:remove_h2o/mobile/Screens/aboutus_screen.dart';
import 'package:remove_h2o/mobile/contactus/contactus_screen.dart';
import 'package:remove_h2o/mobile/size_config.dart';

class ContactusBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.blue,
        ),
        toolbarHeight: 90,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        centerTitle: true,
        title: appbarlogo.isNotEmpty
            ? CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(appbarlogo),
                // child: Image.network(
                //     appbarlogo,
                //     // height: getProportionateScreenHeight(270),
                //   ),
              )
            : CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage("assets/images/logo.png"),
              ),
      ),
      // drawer: NavigationDrawer(),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CircleAvatar(
          //     backgroundColor: Colors.black,
          //     radius: 16,
          //     child: IconButton(
          //       onPressed: () {
          //         Navigator.of(context).pop();
          //       },
          //       icon: Padding(
          //         padding: const EdgeInsets.only(left: 2.0, bottom: 1),
          //         child: Icon(Icons.arrow_back_ios, size: 18),
          //       ),
          //     )),
          // SizedBox(height: 55),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: Text('Contact Us:',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                )),
          ),
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('Users')
                  .where('docId', isEqualTo: 'a03QWdLHKySKptHEZjsmACNiQ8q2')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }
                return ListView(
                    shrinkWrap: true,
                    // itemCount: snapshot.data!.docs.length,
                    // itemBuilder: ((context, index) {
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;

                      return Column(
                        children: [
                          ctspage(
                            text: data['firstName'],
                            icon: FontAwesomeIcons.person,
                            press: null,
                          ),
                          ctspage(
                            text: data['Adress'],
                            icon: FontAwesomeIcons.mapLocationDot,
                            press: null,
                          ),
                          ctspage(
                            text: data['phoneNo'],
                            icon: FontAwesomeIcons.phone,
                            press: null,
                          ),
                          ctspage(
                            text: "www.abc.com",
                            icon: FontAwesomeIcons.globe,
                            press: null,
                          ),
                        ],
                      );
                    }).toList());
              },
            ),
          )
        ],
      ),
    );
  }
}
