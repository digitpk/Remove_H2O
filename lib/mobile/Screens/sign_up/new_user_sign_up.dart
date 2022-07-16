// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:remove_h2o/mobile/Screens/sign_up/components/sign_up_form.dart';
import 'package:remove_h2o/mobile/components/no_account_text.dart';
import 'package:remove_h2o/mobile/constants.dart';
import 'package:remove_h2o/mobile/enum.dart';

import '../../size_config.dart';

class NewUserSignUp extends StatefulWidget {
  const NewUserSignUp({Key? key}) : super(key: key);

  // final test=Roles();
  @override
  State<NewUserSignUp> createState() => _NewUserSignUpState();
}

class _NewUserSignUpState extends State<NewUserSignUp> {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  late final data;
  // late var data;
  late var vname='';
  late var vDoc='';
  late var vpassword='';
  late var vphoneNum='';
  late var vaddress='';
  getCurentUserData()async{
    var data = await firestore.collection("Users").doc(auth.currentUser!.uid).get().then((value) {
      setState(() {
        // vname = value.get('docId');
        vDoc = value.data()?['docId'];
        // vaddress = value.get('Adress');
        // vphoneNum = value.get('phoneNo');
        // vpassword =value.get('password');
        print(vDoc);
      });
    });
  }

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
        'currentUserUid': auth.currentUser!.uid,
        'vendorDocId': vDoc,
        'email': email,
        'role': Roles.user,
        'approved': true,
        'suapproved': true,
        'deleted': false,
        'firstName': fname,
        'isEmailVerified': true,
        'Adress': lname,
        'phoneNo': phoneNo,
        'password': password,
      });
    } on FirebaseAuthException catch (err) {
      print(err.message);
    }
  }
  @override
  void initState() {
    getCurentUserData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    if (kIsWeb || Platform.isMacOS || Platform.isLinux || Platform.isWindows) {
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
                        SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
                        Text(
                          "Sign Up",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black45),
                        ),
                        SizedBox(height: 5),
                        Text("Creats's new user", style: headingStyle),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'By continuing your confirm that you agree \nwith user credentials',
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
                      onPressed: () async{
                        Navigator.pop(context);
                        // print('hello
                       // await getCurentUserData();
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
                      Text("Create new user", style: headingStyle),
                      // SizedBox(
                      //   height: 10.0,
                      // ),
                      Text(
                        "Complete your details or continue \nwith user credentials",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      SignUpForm(_submitauthform),
                      SizedBox(height: 15),
                      Text(
                        'By continuing your confirm that you agree \nwith our Term and Condition',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.caption,
                      ),
                      SizedBox(height: getProportionateScreenHeight(20)),
                      // HaveAccountText(),
                      Text(vname),
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
