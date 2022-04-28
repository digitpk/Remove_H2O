// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remove_h2o/Screens/aboutus_screen.dart';
import 'package:remove_h2o/Screens/home/Home_screen.dart';
import 'package:remove_h2o/Screens/share_app.dart';
import 'package:remove_h2o/components/my_drawer_header.dart';
import 'package:remove_h2o/contactus/contactus_body.dart';
import 'package:remove_h2o/myInfo_screen/myInfo_Body.dart';
import 'package:remove_h2o/size_config.dart';

class ReportEmergency extends StatefulWidget {
  const ReportEmergency({Key? key}) : super(key: key);

  @override
  State<ReportEmergency> createState() => _ReportEmergencyState();
}

class _ReportEmergencyState extends State<ReportEmergency> {
  var currentPage = DrawerSections.home;
  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.home) {
      container = ReportEMG();
    } else if (currentPage == DrawerSections.contacts) {
      container = ContactusBody();
    } else if (currentPage == DrawerSections.aboutus) {
      container = abtpage();
    }
    // else if (currentPage == DrawerSections.socialmedia) {
    //   container = socialpage();
    // }
    else if (currentPage == DrawerSections.shareapp) {
      container = ShareApp();
    } else if (currentPage == DrawerSections.myinfo) {
      container = Infoscreenbody();
    }
    return Scaffold(
      appBar: AppBar(
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
      // appBar: AppBar(
      //   leading: IconButton(
      //     onPressed: () {
      //       // Navigator.push(
      //       //     context,
      //       //     MaterialPageRoute(
      //       //       builder: (context) => MyHeaderDrawer(),
      //       //     ));
      //     },
      //     icon: Icon(Icons.menu),
      //   ),
      //   automaticallyImplyLeading: false,
      //   iconTheme: IconThemeData(
      //     color: Colors.blue,
      //   ),
      //   toolbarHeight: 90,
      //   backgroundColor: Colors.white,
      //   brightness: Brightness.light,
      //   centerTitle: true,
      //   title: Image.asset(
      //     "assets/images/logo.png",
      //     height: getProportionateScreenHeight(270),
      //   ),
      // ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyHeaderDrawer(),
              MyDrawerList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 0,
      ),
      child: Column(children: [
        Divider(
          thickness: 3,
        ),
        menuItem(1, "Home", Icons.dashboard_outlined,
            currentPage == DrawerSections.home ? true : false),
        Divider(thickness: 3),
        menuItem(2, "Contact Us", Icons.people_alt_outlined,
            currentPage == DrawerSections.contacts ? true : false),
        Divider(
          thickness: 3,
        ),
        menuItem(3, "About Us", Icons.event,
            currentPage == DrawerSections.aboutus ? true : false),
        // Divider(thickness: 3,),
        // menuItem(4, "Social Media", Icons.notes,
        //     currentPage == DrawerSections.socialmedia ? true : false),
        Divider(
          thickness: 3,
        ),
        menuItem(5, "Share App", Icons.share,
            currentPage == DrawerSections.shareapp ? true : false),
        Divider(
          thickness: 3,
        ),
        menuItem(6, "My info", Icons.person_outlined,
            currentPage == DrawerSections.myinfo ? true : false),
        Divider(
          thickness: 3,
        ),
      ]),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.home;
            } else if (id == 2) {
              currentPage = DrawerSections.contacts;
            } else if (id == 3) {
              currentPage = DrawerSections.aboutus;
            } else if (id == 4) {
              currentPage = DrawerSections.socialmedia;
            } else if (id == 5) {
              currentPage = DrawerSections.shareapp;
            } else if (id == 6) {
              currentPage = DrawerSections.myinfo;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReportEMG extends StatelessWidget {
  const ReportEMG({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 16,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 2.0, bottom: 1),
                      child: Icon(Icons.arrow_back_ios, size: 18),
                    ),
                  )),
              SizedBox(height: 55),
              Text(
                'Call Us:',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: 280,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    // boxShadow: ,
                    color: Colors.grey[200],
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40.0,
                      ),
                      Text(
                        '123-456-789',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 55.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 45.0,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueAccent,
                          onPrimary: Colors.white,
                          shadowColor: Colors.blueAccent,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                          minimumSize: Size(100, 40), //////// HERE
                        ),
                        onPressed: () {},
                        child: Text('Call us'),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Did u mean?',
                // textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(14),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 60.0,
              ),
              Text(
                'Copyright © 2022 Rational Ambulance.',
                // textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(14),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'All rights reserved.',
                // textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(14),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
