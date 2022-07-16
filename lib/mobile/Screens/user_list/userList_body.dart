// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:remove_h2o/mobile/Screens/home/vendor_user_approve.dart';
import 'package:remove_h2o/mobile/Screens/home/vendor_user_peding.dart';
import 'package:remove_h2o/mobile/Screens/home/vendor_user_revoke.dart';
import 'package:remove_h2o/mobile/Screens/sign_up/sign_up_screen.dart';
import 'package:remove_h2o/mobile/Screens/user_list/users_list.dart';
import 'package:remove_h2o/mobile/navigartion_drawer.dart';
import 'package:remove_h2o/mobile/size_config.dart';
import 'package:remove_h2o/mobile/userlist_buttons/approved_usersBody.dart';
import 'package:remove_h2o/mobile/userlist_buttons/pendingAccess_body.dart';
import 'package:remove_h2o/mobile/userlist_buttons/revoke_usersbody.dart';

class userlistbodyVendor extends StatefulWidget {
  const userlistbodyVendor({Key? key}) : super(key: key);

  @override
  State<userlistbodyVendor> createState() => _userlistbodyVendorState();
}

class _userlistbodyVendorState extends State<userlistbodyVendor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      // drawer: NavigationDrawer(),
      // appBar: AppBar(
      //   leading: IconButton(
      //     onPressed: () {},
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 16,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 2.0, bottom: 1),
                      child: Icon(Icons.arrow_back_ios, size: 18),
                    ),
                  )),
            ),
            SizedBox(
              height: 15.0,
            ),
            // SizedBox(height: 10),
            // UserList(
            //   text: "Pending Access",
            //   icon: FontAwesomeIcons.hourglassEnd,
            //   press: () => {
            //     ///code for vendor user pending
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => VendorUserPending())),
            //   },
            // ),
            SizedBox(height: 20),
            UserList(
              text: "Approved User's",
              icon: FontAwesomeIcons.users,
              press: () => {
                ///code for vendor user approve
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => VendorUserApprove()))
              },
            ),
            SizedBox(height: 20),
            UserList(
              text: "Revoke Access",
              icon: FontAwesomeIcons.refresh,
              press: () => {
                ///code for vendor user revoke
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => VendorUserRevoke()))
              },
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       Navigator.push(
      //           context, MaterialPageRoute(builder: (_) => SignUpScreen()));
      //     });
      //   },
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
