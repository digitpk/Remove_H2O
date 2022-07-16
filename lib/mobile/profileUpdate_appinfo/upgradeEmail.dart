// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:remove_h2o/mobile/size_config.dart';

import '../vendor_user/userapprovedbody.dart';

class Emailupgrade extends StatefulWidget {
  final String previousEmail;
  const Emailupgrade({Key? key, required this.previousEmail}) : super(key: key);

  @override
  State<Emailupgrade> createState() => _EmailupgradeState();
}

class _EmailupgradeState extends State<Emailupgrade> {
  TextEditingController mailController = TextEditingController();
  TextEditingController newmailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late bool autovalidate = false;

  void Updatemail() async {
    if (_formKey.currentState!.validate()) {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(auth.currentUser!.uid)
          .update({'email': newmailController.text.trim()}).then((value) {
        Navigator.pop(context);
      });
    }
  }

  String _errorMessage = '';
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
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                SizedBox(height: 55),
                Text('Change Email:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(28),
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(height: 40),
                TextFormField(
                  // onChanged: (val) {
                  // validateEmail(val);
                  // },
                  controller: mailController,
                  validator: (email) {
                    String pattern = r'\w+@\w+\.\w+';
                    if (email == null || email.isEmpty) {
                      return "Email address can't be empty";
                    } else if (!RegExp(pattern).hasMatch(email)) {
                      return "Invalid-Email Address format.";
                    } else if (email != widget.previousEmail) {
                      return "Previous Email did not match";
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Enter Previous Email",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    prefixIcon: IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.envelopeOpen,
                        color: Color.fromARGB(255, 8, 8, 8),
                      ),
                      iconSize: 18,
                      onPressed: null,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: newmailController,
                  validator: (updateEmail) {
                    String pattern = r'\w+@\w+\.\w+';
                    if (updateEmail == null || updateEmail.isEmpty) {
                      return "Email address can't be empty";
                    } else if (!RegExp(pattern).hasMatch(updateEmail)) {
                      return "Invalid-Email Address format.";
                    }else{
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Enter New Email",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    // prefixIcon: Padding(
                    //   padding: const EdgeInsets.only(left: 16.0),
                    //   child: CustomIcon(svgIcon: "assets/icons/Lock.svg"),
                    // ),
                    prefixIcon: IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.envelope,
                        color: Color.fromARGB(255, 8, 8, 8),
                      ),
                      iconSize: 18,
                      onPressed: null,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Center(
                  child: Text(_errorMessage),
                ),
                Center(
                  // child: GestureDetector(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                      onPrimary: Colors.white,
                      shadowColor: Colors.blueAccent,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      minimumSize: Size(150, 40),
                    ),
                    onPressed: Updatemail,
                    child: Text('Continue'),
                  ),
                  // onTap: () {
                  //   validateEmail(mailController.text);
                  // },
                  // ),
                )
              ],
            ),
          ),
        ));
  }

  void validateEmail(String val) {
    if (val.isEmpty) {
      setState(() {
        _errorMessage = "Email can not be empty";
      });
    } else if (!EmailValidator.validate(val, true)) {
      setState(() {
        _errorMessage = "Invalid Email Address";
      });
    } else {
      setState(() {
        _errorMessage = "";
      });
    }
  }
}
