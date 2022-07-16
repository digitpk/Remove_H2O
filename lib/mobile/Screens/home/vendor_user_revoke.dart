// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:remove_h2o/mobile/navigartion_drawer.dart';
import 'package:remove_h2o/mobile/size_config.dart';
import 'package:remove_h2o/mobile/userlist_buttons/pending_access.dart';
import 'package:remove_h2o/mobile/userlist_buttons/revoke_users.dart';

class VendorUserRevoke extends StatefulWidget {
  const VendorUserRevoke({Key? key}) : super(key: key);

  @override
  State<VendorUserRevoke> createState() => _VendorUserRevokeState();
}

class _VendorUserRevokeState extends State<VendorUserRevoke> {
  final auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  final Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance
      .collection('Users')
      .where('vendorDocId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .where('role', isEqualTo: 3)
      .where('deleted', isEqualTo: true)
      .snapshots();

  ///un-delete the user
  Future undoDelete(String docId) {
    return users
        .where('role', isEqualTo: 3)
        .where('currentUserUid', isEqualTo: docId)
        .get()
        .then((value) => value.docs.forEach((element) {
          element.reference.update({'approved': true});
      element.reference.update({'deleted': false});
    }));
  }

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
        body:

        // SingleChildScrollView(
        //     physics: BouncingScrollPhysics(),
        //     padding: EdgeInsets.symmetric(vertical: 20),
        //     child:

        ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                          child: Icon(Icons.arrow_back_ios, size: 18,color: Colors.red,),
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 1.0,
            ),
            SizedBox(height: 10),
            StreamBuilder<QuerySnapshot>(
                stream: usersStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }

                  return ListView(
                      shrinkWrap: true,
                      // itemCount: snapshot.data!.docs.length,
                      // itemBuilder: ((context, index) {
                      children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                        print(Text(data['firstName']));
                        return PendingAccess(
                          // email: '',
                          // fname: "",
                          // lname: '',
                          // phoneNo: '',
                          text: data['firstName'].toString(),
                          press: () => {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                elevation: 24.0,
                                backgroundColor: Colors.white,
                                title: Text("User Info:",style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),),
                                actions: <Widget>[
                                  Center(
                                    child: FlatButton(
                                      color: Colors.red,
                                      child: Text("Undo Delete",style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                      ),),
                                      onPressed: () {
                                        setState(() {
                                          undoDelete(data['currentUserUid']);
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                  )
                                ],
                              ),
                            )
                          },
                        );
                      }).toList());
                  //     return Text('nodata');
                  //   }),
                  // );
                }),
            // Revokeuser(
            //   // email: '',
            //   // fname: "",
            //   // lname: '',
            //   // phoneNo: '',
            //   text: "Parrot Sab",
            //   press: () => {
            //     showDialog(
            //       context: context,
            //       builder: (_) => AlertDialog(
            //         elevation: 24.0,
            //         backgroundColor: Colors.white,
            //         title: Text("NAME : Parrot Sab"),
            //         content: Text("Do you want to give access"),
            //         actions: <Widget>[
            //           FlatButton(
            //             child: Text("No"),
            //             onPressed: () => Navigator.pop(context),
            //           ),
            //           FlatButton(
            //             child: Text("Yes"),
            //             onPressed: () => Navigator.pop(context),
            //           ),
            //         ],
            //       ),
            //     ),
            //   },
            // ),
          ],
        )

      // ),
    );
  }
}
