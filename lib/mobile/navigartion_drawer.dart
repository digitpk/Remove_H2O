import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:remove_h2o/mobile/Screens/aboutus_screen.dart';
import 'package:remove_h2o/mobile/Screens/share_app.dart';
import 'package:remove_h2o/mobile/Screens/sign_in/sign_in_screen.dart';
import 'package:remove_h2o/mobile/components/my_drawer_header.dart';
import 'package:remove_h2o/mobile/contactus/contactus_body.dart';
import 'package:remove_h2o/mobile/myInfo_screen/myInfo_Body.dart';

import 'Screens/home/components/body.dart';

class NavigationDrawer extends StatefulWidget {
  NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  // final padding = EdgeInsets.symmetric(horizontal: 20);
  final auth = FirebaseAuth.instance;

  Map? _userData;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyHeaderDrawer(),
              // SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                child: Column(
                  children: [
                    manuitems(
                      text: 'Home',
                      icon: Icons.dashboard_outlined,
                      onclick: () => Selecteditem(context, 1),
                    ),
                    const Divider(),
                    manuitems(
                      text: 'Contact Us',
                      icon: Icons.people_alt_outlined,
                      onclick: () => Selecteditem(context, 2),
                    ),
                    const Divider(),
                    manuitems(
                      text: 'About US',
                      icon: Icons.event,
                      onclick: () => Selecteditem(context, 3),
                    ),
                    const Divider(),
                    manuitems(
                      text: 'Share App',
                      icon: Icons.share,
                      onclick: () => Selecteditem(context, 4),
                    ),
                    const Divider(),
                    manuitems(
                      text: 'My Info',
                      icon: Icons.person_outlined,
                      onclick: () => Selecteditem(context, 5),
                    ),
                    Divider(),
                    manuitems(
                      text: 'Log Out',
                      icon: Icons.logout,
                      onclick: () async {
                        await auth.signOut();
                        User? user = auth.currentUser;
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: ((context) => SignInScreen())));
                        await FacebookAuth.i.logOut();
                        print("facebook log called");
                        setState(() {
                          _userData = null;
                        });
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Selecteditem(BuildContext context, int i) {
    switch (i) {
      case 1:

        /// main screen
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => VendorBody()));
        break;
      case 2:

        ///contact us screen
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ContactusBody()));
        break;
      case 3:

        ///about us screen
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => abtpage()));
        break;
      case 4:

        ///share app screen
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ShareApp()));
        break;
      case 5:

        ///My Info screen
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
      style: const TextStyle(color: Colors.black),
    ),
    onTap: onclick,
  );
}
