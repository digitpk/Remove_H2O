// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:remove_h2o/mobile/Screens/sign_up/components/sign_up_form.dart';
import 'package:remove_h2o/mobile/components/no_account_text.dart';
import 'package:remove_h2o/mobile/constants.dart';
import 'package:remove_h2o/mobile/enum.dart';
import 'package:remove_h2o/mobile/navigartion_drawer.dart';
import 'package:remove_h2o/mobile/size_config.dart';
import 'package:share_plus/share_plus.dart';

class SendReferral extends StatefulWidget {
  @override
  State<SendReferral> createState() => _SendReferralState();
}

class _SendReferralState extends State<SendReferral> {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  void _submitauthform(
      String email,
      String fname,
      String lname,
      String phoneNo,
      String password,
      ) async {
    UserCredential userCredential;
    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      DocumentReference ref =
      firestore.collection('Users').doc(auth.currentUser!.uid);
      await ref.set({
        'docId': ref.id,
        'email': email,
        'role': Roles.vendor,
        'approved': false,
        'suapproved': false,
        'deleted': false,
        'firstName': fname,
        'isEmailVerified': true,
        'Adress': lname,
        'phoneNo': phoneNo,
        'password': password,
      });
    } on FirebaseAuthException catch (err) {
      print(err);
      print(err.message);
    }
  }

  // final IconData icon;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    if (kIsWeb || Platform.isMacOS || Platform.isLinux || Platform.isWindows) {
      return Scaffold(
        // drawer: Drawer(
        //   backgroundColor: Colors.red,
        // ),
        appBar: AppBar(
          elevation: 0,
          // automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          brightness: Brightness.light,
        ),
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
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
                      ),
                    ),
                    Column(
                      children: [
                        // SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
                        // Text(
                        //   "Sign Up",
                        //   textAlign: TextAlign.center,
                        //   style: TextStyle(color: Colors.black45),
                        // ),
                        // SizedBox(height: 5),
                        Text("Complete Profile", style: headingStyle),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Complete your details or continue \nwith social media",
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5),
                        SignUpForm(_submitauthform),
                        SizedBox(height: 15),
                        Text(
                          'By continuing your confirm that you agree \nwith our Term and Condition',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.caption,
                        ),
                        SizedBox(height: getProportionateScreenHeight(20)),
                        HaveAccountText(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
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
                    ),
                  ),
                  Column(
                    children: [
                      // SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
                      Text(
                        "Sign Up",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black45),
                      ),
                      SizedBox(height: 5),
                      Text("Complete Profile", style: headingStyle),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Complete your details or continue \nwith social media",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 5),
                      SignUpForm(_submitauthform),
                      SizedBox(height: 15),
                      Text(
                        'By continuing your confirm that you agree \nwith our Term and Condition',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.caption,
                      ),
                      SizedBox(height: getProportionateScreenHeight(20)),
                      HaveAccountText(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class IconContainer extends StatelessWidget {
  final String image;

  const IconContainer({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Color(0xFFffffff),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 35, width: 35, child: SvgPicture.asset(image)),
        ],
      ),
      // child: Image(
      //   height: 35,
      //   width: 35,
      //   image: AssetImage(image),),
    );
  }
}
