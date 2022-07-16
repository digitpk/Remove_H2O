// ignore_for_file: void_checks, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:remove_h2o/mobile/screen_buttons/reportEmergency_Screen.dart';
import 'package:remove_h2o/mobile/screen_buttons/take_photo.dart';
import 'package:remove_h2o/mobile/size_config.dart';
import 'package:remove_h2o/mobile/userleadgenerationbody.dart';
import 'package:remove_h2o/mobile/ushome/components/us_home_menu.dart';
import 'package:remove_h2o/mobile/ushome/user_nav_drawer.dart';

UserCredential? userCredential;

class UsBody extends StatefulWidget {
  @override
  State<UsBody> createState() => _BodyState();
}

class _BodyState extends State<UsBody> {
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
        title: Image.asset(
          "assets/images/logo.png",
          height: getProportionateScreenHeight(270),
        ),
      ),
      drawer: UserNavigationDrawer(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            USHomeMenu(
              boxColor: Colors.redAccent,
              text: "Report Emergency",
              icon: FontAwesomeIcons.phone,
              press: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReportEmergency(),
                  ),
                ),
              },
            ),
            SizedBox(height: 20),
            USHomeMenu(
              boxColor: Colors.blue,
              text: "Send a Referral",
              icon: FontAwesomeIcons.users,
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PhotoData()));
              },
            ),
            SizedBox(height: 20),
            USHomeMenu(
              boxColor: Colors.brown,
              text: "Lead Generation list",
              icon: FontAwesomeIcons.rectangleAd,
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserLeadgenerationbody()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
