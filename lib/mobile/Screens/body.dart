// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:remove_h2o/main.dart';
import 'package:remove_h2o/mobile/Screens/home/Home_screen.dart';
import 'package:remove_h2o/mobile/Screens/sign_in/sign_in_screen.dart';
import 'package:remove_h2o/mobile/enum.dart';
import 'package:remove_h2o/mobile/sphome/sphome.dart';
import 'package:remove_h2o/mobile/ushome/ushome.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      print(user);
    });
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 3500), () {});
    // bool value = true;
    // if(value){
    //   UserCredential userCredential;
    //   FirebaseFirestore.instance
    //       .collection('Users')
    //       .where('email', isEqualTo: FirebaseAuth.instance.currentUser?.email)
    //       .get()
    //       .then((QuerySnapshot querySnapshot) {
    //     querySnapshot.docs.forEach((doc) {
    //       print(doc["role"]);
    //       if (doc["approved"] != true) {
    //         Text('User is pending verification');
    //         flutterToast(msg: 'User is pending verification\n Please wait till the verification complete.', bgColor: Colors.red,toastLength: Toast.LENGTH_SHORT);
    //         print("vendor user called");
    //       } else {
    //
    //         if (doc['role'] == Roles.superadmin) {
    //           Navigator.push(
    //               context, MaterialPageRoute(builder: (_) => SPHome()));
    //           print("superadmin");
    //         } else if (doc['role'] == Roles.admin) {
    //           Navigator.push(
    //               context, MaterialPageRoute(builder: (_) => SPHome()));
    //           print("admin");
    //         } else if (doc['role'] == Roles.vendor) {
    //           Navigator.push(
    //               context, MaterialPageRoute(builder: (_) => Home()));
    //           print("vender");
    //         } else if (doc['role'] == Roles.user) {
    //           Navigator.push(
    //               context, MaterialPageRoute(builder: (_) => USHome()));
    //           print("user");
    //         }else if(doc['role']==Roles.random){
    //           Navigator.pushReplacement(
    //               context, MaterialPageRoute(builder: (context) => SignInScreen()));
    //         }
    //       }
    //     });
    //   }
    //   );
    // }else{
    //
    // }
    FirebaseAuth.instance.currentUser != null
        ? Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SPHome()))
        : Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignInScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue,
                Colors.red,
              ],
            )),
          ),
          Center(
            child: Container(
              child: Image.asset("assets/logo.png"),
            ),
          ),
        ],
      ),
    );
  }
}
