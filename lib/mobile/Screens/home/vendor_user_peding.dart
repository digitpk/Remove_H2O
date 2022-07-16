



// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remove_h2o/mobile/navigartion_drawer.dart';
import 'package:remove_h2o/mobile/size_config.dart';
import 'package:remove_h2o/mobile/userlist_buttons/pending_access.dart';

class VendorUserPending extends StatefulWidget {
  const VendorUserPending({Key? key}) : super(key: key);

  @override
  State<VendorUserPending> createState() => _VendorUserPendingState();
}

class _VendorUserPendingState extends State<VendorUserPending> {
  final auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('vendorUsers');
  final Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance
      .collection('Users')
      .where('role', isEqualTo: 3)
      .where('deleted', isEqualTo: false)
      .where('approved', isEqualTo: false)
      .where('suapproved', isEqualTo: false)
      .snapshots();

  Future updateUser(String docId) {
    return users
        .where('role', isEqualTo: 2)
        .where('docId', isEqualTo: docId)
        .get()
        .then((value) => value.docs.forEach((element) {
      element.reference.update({"approved": true, 'suapproved': true});
    }));
  }

  Future deleteuser(String docId) {
    return users
        .where('role', isEqualTo: 2)
        .where('docId', isEqualTo: docId)
        .get()
        .then((value) => value.docs.forEach((element) {
      element.reference.update({'deleted': true});
    }));
  }

  // Future deleteUser(String docId) {
  //   return users
  //       .where('docId', isEqualTo: docId)
  //       .get()
  //       .then((value) => value.docs.forEach((element) {
  //             element.reference.delete();
  //           }));
  // }

  // Future<void> updateUser() {
  //   return users
  //       .doc('xJPQrKVXeKfT6DmtID9irdpE9It2')
  //       .update({'approved': true})
  //       .then((value) => print("User Updated"))
  //       .catchError((error) => print("Failed to update user: $error"));
  // }
//     Future<void> updateUser() {
//     return users
  //       .collection('Users')
  //       .get()
  //       .then((QuerySnapshot querySnapshot) {
  //     querySnapshot.docs.forEach((doc) {

  //       print(doc["firstName"]);
  //     });
  //   });
  // }

  // updateNam() {
  //   FirebaseFirestore.instance
  //       .collection('Users')
  //       .where('role', isEqualTo: 2)
  //       .get()
  //       .then(
  //         (value) => value.docs.forEach(
  //           (doc) {
  //             print(doc['firstName']);
  //           },
  //         ),
  //       );
  // }

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
        // drawer: Drawer(),
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
                          child: Icon(Icons.arrow_back_ios, size: 18,color: Colors.red),
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 1.0,
            ),
            SizedBox(height: 10),

            // FutureBuilder<DocumentSnapshot>(
            //   future: FirebaseFirestore.instance
            //       .collection('Users')
            //       .doc()
            //       .get(),
            //   builder: (BuildContext context, AsyncSnapshot snapshot) {
            //     if (snapshot.hasError) {
            //       return Text("Something went wrong");
            //     }

            //     if (snapshot.hasData && !snapshot.data!.exists) {
            //       return Text("Document does not exist");
            //     }

            //     if (snapshot.connectionState == ConnectionState.done) {
            //       Map<String, dynamic> data =
            //           snapshot.data!.data() as Map<String, dynamic>;
            //       // return Text("Full Name: ${data['firstName']} ${data['lasttName']}");
            //       print(Text(data['firstName']));
            //     return  PendingAccess(
            //         // email: '',
            //         // fname: "",
            //         // lname: '',
            //         // phoneNo: '',
            //         text: Text(data['firstName']),
            //         press: () => {
            //           showDialog(
            //             context: context,
            //             builder: (_) => AlertDialog(
            //               elevation: 24.0,
            //               backgroundColor: Colors.white,
            //               title: Text("NAME : Parrot Sab"),
            //               content: Text("Do you want to give access"),
            //               actions: <Widget>[
            //                 FlatButton(
            //                   child: Text("No"),
            //                   onPressed: () => Navigator.pop(context),
            //                 ),
            //                 FlatButton(
            //                   child: Text("Yes"),
            //                   onPressed: () => Navigator.pop(context),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         },
            //       );
            //     }

            //     return Text("loading");
            //   },
            // )

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
                                title: Text(data['email'].toString()),
                                content: Text("Do you want to give access"),
                                actions: <Widget>[
                                  FlatButton(
                                    color: Colors.green,
                                    child: Text("Yes",style: TextStyle(
                                        color: Colors.white
                                    ),),
                                    onPressed: () {
                                      setState(() {
                                        updateUser(data['docId']);
                                      });
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  FlatButton(
                                      color: Colors.yellow,
                                      child: Text("No",style: TextStyle(
                                          color: Colors.white
                                      ),),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      }),
                                  FlatButton(
                                    color: Colors.red,
                                    child: Text("Delete",style: TextStyle(
                                        color: Colors.white
                                    ),),
                                    onPressed: () {
                                      setState(() {
                                        deleteuser(data['docId']);
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
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

            // PendingAccess(
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
            // SizedBox(height: 20),
            // PendingAccess(
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
            // SizedBox(height: 20),
            // PendingAccess(
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
            // SizedBox(height: 20),
            // PendingAccess(
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
            // SizedBox(height: 20),
            // PendingAccess(
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
            // SizedBox(height: 20),
            // PendingAccess(
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
