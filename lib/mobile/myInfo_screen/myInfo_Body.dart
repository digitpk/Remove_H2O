import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:remove_h2o/mobile/Screens/sign_in/sign_in_screen.dart';
import 'package:remove_h2o/mobile/myInfo_screen/my_info_screen.dart';
import 'package:remove_h2o/mobile/profileUpdate_appinfo/upgradeAddress.dart';
import 'package:remove_h2o/mobile/profileUpdate_appinfo/upgradeEmail.dart';
import 'package:remove_h2o/mobile/profileUpdate_appinfo/upgradeNumber.dart';
import 'package:remove_h2o/mobile/size_config.dart';

class Infoscreenbody extends StatefulWidget {
  @override
  State<Infoscreenbody> createState() => _InfoscreenbodyState();
}

class _InfoscreenbodyState extends State<Infoscreenbody> {
  final firestore = FirebaseFirestore.instance.collection('Users');
  final auth = FirebaseAuth.instance;

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
      // drawer: NavigationDrawer(),
      body: FutureBuilder<DocumentSnapshot>(
        future: firestore.doc(auth.currentUser!.uid).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return const Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Center(
              child: ListView(
                children: [
                  const SizedBox(height: 15,),
                  Infopage(
                    text: data['firstName'],
                    icon: Icons.account_circle_rounded,
                    press: () {
                      // toastMes
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => Emailupgrade(
                      //         previousEmail: data['email'],
                      //       )),
                      // );
                    },
                  ),
                  Infopage(
                    text: data['email'],
                    icon: FontAwesomeIcons.envelopeOpen,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Emailupgrade(
                                  previousEmail: data['email'],
                                )),
                      );
                    },
                  ),
                  Infopage(
                    text: data['phoneNo'],
                    icon: FontAwesomeIcons.phoneSquare,
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Numberupgrade(
                                  previousNumber: data['phoneNo'])));
                    },
                  ),
                  Infopage(
                    text: data['Adress'],
                    icon: FontAwesomeIcons.mapLocationDot,
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddressUpgrade()));
                    },
                  ),
                  // Infopage(
                  //   text: "Log Out",
                  //   icon: FontAwesomeIcons.signOut,
                  //   press: () async {
                  //     await auth.signOut();
                  //     User? user = auth.currentUser;
                  //     Navigator.of(context).pushReplacement(MaterialPageRoute(
                  //         builder: ((context) => SignInScreen())));
                  //   },
                  // ),
                ],
              ),
            );
          }

          return const Text("loading");
        },
      ),
    );
  }
}
