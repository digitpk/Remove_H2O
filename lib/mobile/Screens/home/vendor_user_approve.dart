// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remove_h2o/mobile/navigartion_drawer.dart';
import 'package:remove_h2o/mobile/size_config.dart';
import 'package:remove_h2o/mobile/userlist_buttons/approved_usersAccess.dart';
import 'package:remove_h2o/mobile/userlist_buttons/pending_access.dart';
import 'package:remove_h2o/mobile/userlist_buttons/revoke_users.dart';

class VendorUserApprove extends StatefulWidget {
  const VendorUserApprove({Key? key}) : super(key: key);

  @override
  State<VendorUserApprove> createState() => _VendorUserApproveState();
}

class _VendorUserApproveState extends State<VendorUserApprove> {
  final auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  final Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance
      .collection('Users')
      // .doc(FirebaseAuth.instance.currentUser!.uid)
      // .collection('users')
      // .where('currentUserUid',isEqualTo: 'gsqye2OLCSP5fS3mKeiJgUCpyOz2')
      .where('vendorDocId',isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .where('role', isEqualTo: 3)
      .where('deleted', isEqualTo: false)
      .where('approved', isEqualTo: true)
      .where('suapproved', isEqualTo: true)
      .snapshots();

  ///revoke the user
  Future deleteuser(String docId) {
    return users
        .where('role', isEqualTo: 3)
        .where('currentUserUid', isEqualTo: docId)
        .get()
        .then((value) => value.docs.forEach((element) {
          element.reference.update({'approved': false});
      element.reference.update({'deleted': true});
    }));
  }
  ///get the user info
  Widget getLeadsDetail({required String name, required String data}) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$name:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Text(data)
          ],
        ));
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

            Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:16.0,right: 16,top: 10,bottom: 5),
                  child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 16,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Padding(
                          padding: const EdgeInsets.only(left: 2.0, bottom: 1),
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 18,
                            color: Colors.red,
                          ),
                        ),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 1.0,
            ),
            ///
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: usersStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading");
                    }
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          // snapshot.data!.docs.map((DocumentSnapshot document)
                          //   Map<String, dynamic> data =
                          //   document.data()! as Map<String, dynamic>;
                          // var data = snapshot.data!.docs;
                          DocumentSnapshot ds = snapshot.data!.docs[index];
                          // print(Text(data['firstName']));
                          // print("//////////////////");
                          return PendingAccess(
                            // email: '',
                            // fname: "",
                            // lname: '',
                            // phoneNo: '',
                            text: ds['firstName'].toString(),
                            press: () => {
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  elevation: 24.0,
                                  backgroundColor: Colors.white,
                                  title: Text("User Info:",style: TextStyle(
                                    fontWeight: FontWeight.bold
                                  ),),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      getLeadsDetail(
                                          name: "Name",
                                          data: ds['firstName']),
                                      getLeadsDetail(
                                          name: "Email",
                                          data: ds['email']),
                                      getLeadsDetail(
                                          name: "Address",
                                          data: ds['Adress']),
                                    ],
                                  ),
                                  actions: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        FlatButton(
                                          color: Colors.green,
                                          child: Text("No",style: TextStyle(
                                              color: Colors.white,
                                            fontWeight: FontWeight.bold
                                          ),),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        FlatButton(
                                          color: Colors.red,
                                          child: Text("Delete user!",style: TextStyle(
                                              color: Colors.white,
                                            fontWeight: FontWeight.bold
                                          ),),
                                          onPressed: () {
                                            setState(() {
                                              deleteuser(ds['currentUserUid']);
                                            });
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            },
                          );
                          // return ApprovedUsers(
                          //   // email: '',
                          //   // fname: "",
                          //   // lname: '',
                          //   // phoneNo: '',
                          //   text: snapshot.data.docs('fir'),
                          // );
                        });
                    //     return Text('nodata');
                    //   }),
                    // );
                  }),

              ///
              // ApprovedUsers(
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
            ),
          ],
        )

        // ),
        );
  }
}
