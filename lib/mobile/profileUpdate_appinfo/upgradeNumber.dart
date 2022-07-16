// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:remove_h2o/mobile/size_config.dart';

import '../vendor_user/userapprovedbody.dart';

class Numberupgrade extends StatefulWidget {
  final String previousNumber;
  Numberupgrade({Key? key, required this.previousNumber}) : super(key: key);

  @override
  State<Numberupgrade> createState() => _NumberupgradeState();
}

class _NumberupgradeState extends State<Numberupgrade> {
  TextEditingController numController = TextEditingController();
  TextEditingController newnumController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void UpdateNumber() {
    if (_formKey.currentState!.validate()) {
      FirebaseFirestore.instance
          .collection('Users')
          .doc(auth.currentUser!.uid)
          .update({'phoneNo': newnumController.text.trim()}).then((value) {
        Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
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
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // CircleAvatar(
                //     backgroundColor: Colors.black,
                //     radius: 16,
                //     child: IconButton(
                //       onPressed: () {
                //         Navigator.pop(context);
                //       },
                //       icon: Padding(
                //         padding: const EdgeInsets.only(left: 2.0, bottom: 1),
                //         child: Icon(Icons.arrow_back_ios, size: 18),
                //       ),
                //     )),
                SizedBox(height: 70),
                Text('Change Number:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(28),
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(height: 40),
                // TextFormField(
                //   decoration: const InputDecoration(
                //     icon: Icon(Icons.person),
                //     hintText: 'What do people call you?',
                //     labelText: 'Name *',
                //   ),
                //   onSaved: (String? value) {
                //     // This optional block of code can be used to run
                //     // code when the user saves the form.
                //   },
                //   validator: (String? value) {
                //     return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                //   },
                // )
                TextFormField(
                  controller: numController,
                  keyboardType: TextInputType.number,
                  validator: (number) {
                    String pattern = r'[0-9]';
                    RegExp regex = RegExp(pattern);
                    if (number == null || number.isEmpty) {
                      return "Number can't be empty";
                    } else if (!regex.hasMatch(number)) {
                      return "Number contains only digits";
                    } else if (number.length != 10) {
                      return "Number contains eleven digits";
                    } else if (number != widget.previousNumber) {
                      return "Enter the correct previous number";
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Enter Previous Number",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    // prefixIcon: Padding(
                    //   padding: const EdgeInsets.only(left: 16.0),
                    //   child: CustomIcon(svgIcon: "assets/icons/Lock.svg"),
                    // ),
                    prefixIcon: IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.phone,
                        color: Color.fromARGB(255, 8, 8, 8),
                      ),
                      iconSize: 18,
                      onPressed: null,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  controller: newnumController,
                  keyboardType: TextInputType.number,
                  validator: (updateNumber) {
                    String pattern = r'[0-9]';
                    RegExp regex = RegExp(pattern);
                    if (updateNumber == null || updateNumber.isEmpty) {
                      return "Number can't be empty";
                    } else if (!regex.hasMatch(updateNumber)) {
                      return "Number contains only digits";
                    } else if (updateNumber.length != 10) {
                      return "Number contains eleven digits";
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Enter New Number",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    // prefixIcon: Padding(
                    //   padding: const EdgeInsets.only(left: 16.0),
                    //   child: CustomIcon(svgIcon: "assets/icons/Lock.svg"),
                    // ),
                    prefixIcon: IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.phone,
                        color: Color.fromARGB(255, 8, 8, 8),
                      ),
                      iconSize: 18,
                      onPressed: null,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                      onPrimary: Colors.white,
                      shadowColor: Colors.blueAccent,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      minimumSize: Size(100, 40), //////// HERE
                    ),
                    onPressed: UpdateNumber,
                    child: Text('Continue'),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
