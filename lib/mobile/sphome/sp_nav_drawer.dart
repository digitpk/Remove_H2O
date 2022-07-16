// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:remove_h2o/mobile/components/my_drawer_header.dart';
import 'package:remove_h2o/mobile/myInfo_screen/myInfo_Body.dart';
import 'package:remove_h2o/mobile/sphome/component/sp_body.dart';
import 'package:remove_h2o/mobile/ushome/uscontact_us_body.dart';
import 'package:remove_h2o/mobile/ushome/user_about_us.dart';
import 'package:remove_h2o/mobile/ushome/user_share_app.dart';

import '../Screens/sign_in/sign_in_screen.dart';

class AdminNavigationDrawer extends StatelessWidget {
  AdminNavigationDrawer({Key? key}) : super(key: key);

  // final padding = EdgeInsets.symmetric(horizontal: 20);

  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyHeaderDrawer(),
              // SizedBox(height: 16.0),
              Container(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  child: Column(
                    children: [
                      manuitems(
                        text: 'Home',
                        icon: Icons.dashboard_outlined,
                        onclick: () => Selecteditem(context, 1),
                      ),
                      Divider(),
                      manuitems(
                        text: 'Contact Us',
                        icon: Icons.people_alt_outlined,
                        onclick: () => Selecteditem(context, 2),
                      ),
                      Divider(),
                      manuitems(
                        text: 'About US',
                        icon: Icons.event,
                        onclick: () => Selecteditem(context, 3),
                      ),
                      Divider(),
                      manuitems(
                        text: 'Share App',
                        icon: Icons.share,
                        onclick: () => Selecteditem(context, 4),
                      ),
                      Divider(),
                      manuitems(
                        text: 'My Info',
                        icon: Icons.person_outlined,
                        onclick: () => Selecteditem(context, 5),
                      ),
                      Divider(),
                      manuitems(
                        text: 'Log Out',
                        icon: Icons.logout,
                        onclick: ()async{
                          await auth.signOut();
                          User? user = auth.currentUser;
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: ((context) => SignInScreen())));
                        },
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Selecteditem(BuildContext context, int i) {
    switch (i) {
      case 1: // main screen
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SPBody()));
        break;
      case 2: //contact us screen
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => UserContactusBody()));
        break;
      case 3: //about us screen
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => userabtpage()));
        break;
      case 4: // share app screen
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => UserShareApp()));
        break;
      case 5: // My Info screen
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Infoscreenbody()));
    }
  }
}

manuitems(
    {required String text,
    required IconData icon,
    required VoidCallback onclick}) {
  return ListTile(
    leading: Icon(
      icon,
      color: Colors.black,
    ),
    title: Text(
      text,
      style: TextStyle(color: Colors.black),
    ),
    onTap: onclick,
  );
}
