// ignore_for_file: void_checks, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:remove_h2o/Mobile/financescreen.dart';
import 'package:remove_h2o/mobile/Screens/user_list/userList_body.dart';
import 'package:remove_h2o/mobile/screen_buttons/send_referral.dart';
import 'package:remove_h2o/mobile/size_config.dart';
import 'package:remove_h2o/mobile/sphome/component/sp_home_menu.dart';
import 'package:remove_h2o/mobile/sphome/sp_nav_drawer.dart';
import 'package:remove_h2o/mobile/sphome/user_list_body.dart';

UserCredential? userCredential;

class SPBody extends StatefulWidget {
  @override
  State<SPBody> createState() => _BodyState();
}

class _BodyState extends State<SPBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
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
      drawer: AdminNavigationDrawer(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            SPHomeMenu(
              boxColor: Colors.blue,
              text: "Send a Referral",
              icon: FontAwesomeIcons.users,
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SendReferral()));
              },
            ),
            SizedBox(height: 20),
            SPHomeMenu(
              boxColor: Colors.greenAccent,
              text: "Finance",
              icon: FontAwesomeIcons.lineChart,
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Financescreen()));
              },
            ),
            SizedBox(height: 20),
            SPHomeMenu(
              boxColor: Colors.orangeAccent,
              text: "Vendor's List",
              icon: FontAwesomeIcons.list,
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserListBodyAdmin()));
              },
            ),
            // Container(
            //   child: Text("heloooooo"),
            // )
          ],
        ),
      ),
    );
  }
}
