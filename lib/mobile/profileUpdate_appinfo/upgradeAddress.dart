import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:remove_h2o/mobile/size_config.dart';

import '../vendor_user/userapprovedbody.dart';

class AddressUpgrade extends StatefulWidget {
  const AddressUpgrade({Key? key}) : super(key: key);

  @override
  State<AddressUpgrade> createState() => _AddressUpgradeState();
}

class _AddressUpgradeState extends State<AddressUpgrade> {
  TextEditingController newadressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void Updateadress() {
    if (_formKey.currentState!.validate()) {
      FirebaseFirestore.instance
          .collection('Users')
          .doc(auth.currentUser!.uid)
          .update({'Adress': newadressController.text.trim()}).then((value) {
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
            icon: const Icon(Icons.arrow_back),
          ),
          automaticallyImplyLeading: false,
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
              const SizedBox(height: 70),
              Text('Change Address:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(height: 48),
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: newadressController,
                  validator: (updateAddress) {
                    if (updateAddress == null || updateAddress.isEmpty) {
                      return "Address can't be empty";
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: "Enter New Address",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    // prefixIcon: Padding(
                    //   padding: const EdgeInsets.only(left: 16.0),
                    //   child: CustomIcon(svgIcon: "assets/icons/Lock.svg"),
                    // ),
                    prefixIcon: IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.mapLocationDot,
                        color: Color.fromARGB(255, 8, 8, 8),
                      ),
                      iconSize: 18,
                      onPressed: null,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
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
                    minimumSize: const Size(100, 40), //////// HERE
                  ),
                  onPressed: Updateadress,
                  child: const Text('Continue'),
                ),
              )
            ],
          ),
        ));
  }
}
