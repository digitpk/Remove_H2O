// ignore_for_file: void_checks, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:remove_h2o/Mobile/financescreen.dart';
import 'package:remove_h2o/mobile/Screens/aboutus_screen.dart';
import 'package:remove_h2o/mobile/Screens/sign_up/sign_up_screen.dart';
import 'package:remove_h2o/mobile/Screens/sign_up/new_user_sign_up.dart';
import 'package:remove_h2o/mobile/Screens/user_list/userList_body.dart';
import 'package:remove_h2o/mobile/navigartion_drawer.dart';
import 'package:remove_h2o/mobile/userleadgenerationbody.dart';

import 'home_menu.dart';

UserCredential? userCredential;

class VendorBody extends StatefulWidget {
  const VendorBody({Key? key}) : super(key: key);

  @override
  State<VendorBody> createState() => _VendorBodyState();
}

class _VendorBodyState extends State<VendorBody> {
  Map? _userData;

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
      drawer: NavigationDrawer(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            // HomeMenu(
            //   boxColor: Colors.redAccent,
            //   text: "Report Emergency",
            //   icon: FontAwesomeIcons.phone,
            //   press: () => {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => ReportEmergency(),
            //       ),
            //     ),
            //   },
            // ),
            SizedBox(height: 30),
            HomeMenu(
              boxColor: Colors.blueAccent,
              text: "Create New User",
              icon: FontAwesomeIcons.users,
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewUserSignUp()));
                print("user creation list called");
              },
            ),
            // SizedBox(height: 20),
            // HomeMenu(
            //   text: "Send a Picture",
            //   icon: FontAwesomeIcons.camera,
            //   press: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => PhotoData()));
            //   },
            // ),
            SizedBox(height: 10),
            HomeMenu(
              boxColor: Colors.greenAccent,
              text: "User's List",
              icon: FontAwesomeIcons.list,
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => userlistbodyVendor()));
              },
            ),
            SizedBox(height: 10),
            HomeMenu(
              boxColor: Colors.cyan,
              text: "Lead Generation list",
              icon: FontAwesomeIcons.genderless,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserLeadgenerationbody(),
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            HomeMenu(
              boxColor: Colors.amberAccent,
              text: "Finance",
              icon: FontAwesomeIcons.lineChart,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Financescreen(),
                  ),
                );
              },
            ),
            // Text("helooooooo")
          ],
        ),
      ),
    );
  }
}
