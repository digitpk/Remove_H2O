// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:remove_h2o/mobile/aboutDetail.dart';
import 'package:remove_h2o/mobile/navigartion_drawer.dart';
import 'package:remove_h2o/mobile/size_config.dart';

import '../vendor_user/userapprovedbody.dart';

String appbarlogo = '';
String workvendor = '';
String imagevendor = '';

class abtpage extends StatefulWidget {
  @override
  State<abtpage> createState() => _abtpageState();
}

class _abtpageState extends State<abtpage> {
  void getdata() {
    FirebaseFirestore.instance
        .collection('Vendor Data')
        .where('docId', isEqualTo: auth.currentUser!.uid)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        setState(() {
          // print(doc['workadress']);
          appbarlogo = doc['logo'];
          workvendor = doc['workadress'];
          imagevendor = doc['imageUrl'];
        });
      });
    });
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.blue,
        ),
        toolbarHeight: 90,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        centerTitle: true,
        title: appbarlogo.isNotEmpty
            ? CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(appbarlogo),
                // child: Image.network(
                //     appbarlogo,
                //     // height: getProportionateScreenHeight(270),
                //   ),
              )
            : CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage("assets/images/logo.png"),
              ),
        // title: Text(appbarlogo.toString(), style: TextStyle(color: Colors.amber),),
        // title: appbartitle.isEmpty"assets/images/logo.png",
        //   height: getProportionateScreenHeight(270),
        // ?Image.asset(
        //
        // )
        // : Image.network(appbartitle,
        // ),
      ),
      // drawer: NavigationDrawer(),
      body: SingleChildScrollView(
        // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CircleAvatar(
              //     backgroundColor: Colors.black,
              //     radius: 16,
              //     child: IconButton(
              //       onPressed: () {
              //         Navigator.of(context).pop();
              //       },
              //       icon: Padding(
              //         padding: const EdgeInsets.only(left: 2.0, bottom: 1),
              //         child: Icon(Icons.arrow_back_ios, size: 18),
              //       ),
              //     )),
              // SizedBox(
              //   height: 55.0,
              // ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                child: Text(
                  'Company Image:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(18),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Text("Company Image"),
              imagevendor.isEmpty
                  ? Container(
                      height: 200.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/ambulance.jpg'),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.rectangle,
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 200.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(imagevendor),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.rectangle,
                      ),
                    ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                child: Text(
                  'Company Description:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(18),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              workvendor.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          // ignore: prefer_const_literals_to_create_immutables
                          children: <TextSpan>[
                            //TextSpan(text: '', style: TextStyle(color: Colors.blue)),
                            TextSpan(
                                text:
                                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently  desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum'),
                          ],
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          // ignore: prefer_const_literals_to_create_immutables
                          children: <TextSpan>[
                            //TextSpan(text: '', style: TextStyle(color: Colors.blue)),
                            TextSpan(text: workvendor),
                          ],
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => AboutDetail(image: imagevendor,)));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
