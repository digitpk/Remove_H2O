// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:remove_h2o/main.dart';
import 'package:remove_h2o/mobile/navigartion_drawer.dart';
import 'package:remove_h2o/mobile/size_config.dart';
import 'package:remove_h2o/mobile/vendor_user/userapprovedbody.dart';

class AboutDetail extends StatefulWidget {
  String image;
  AboutDetail({required this.image});

  @override
  State<AboutDetail> createState() => _AboutDetailState();
}

class _AboutDetailState extends State<AboutDetail> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  firebase_storage.Reference imageRef = firebase_storage
      .FirebaseStorage.instance
      .ref('Images / ${DateTime.now()}');
  TextEditingController workadresscontroller = TextEditingController();
  File? _image;
  File? _logo;
  ///code for update company IMAGE
  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      final imageTem = File(image.path);
      setState(() {
        _image = imageTem;
      });
    }
  }
  ///code for company logo get image from camera
  Future getLogo() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    // final image = await ImagePicker().pickImage(source: ImageSource.gallery);/
    if (image != null) {
      final imageTem = File(image.path);
      setState(() {
        _logo = imageTem;
      });
    }
  }
  ///code for company logo get image from gallery
  Future getGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    // final image = await ImagePicker().pickImage(source: ImageSource.gallery);/
    if (image != null) {
      final imageTem = File(image.path);
      setState(() {
        _logo = imageTem;
      });
    }
  }

  // void ShowSnackBar(BuildContext context) {
  //   final snackBar = SnackBar(
  //     content: Text('Data uploaded successfully'),
  //     backgroundColor: Colors.blue,
  //   );
  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // }

  Future submitData() async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
      workadresscontroller.text.trim();
      UploadTask uploadTask = imageRef.putFile(_image!);
      await Future.value(uploadTask);
      var imageUrl = await imageRef.getDownloadURL();
      UploadTask uploadTask1 = imageRef.putFile(_logo!);
      await Future.value(uploadTask);
      var imageUrl1 = await imageRef.getDownloadURL();
      DocumentReference ref = FirebaseFirestore.instance
          .collection('Vendor Data')
          .doc(auth.currentUser!.uid);
      ref.set({
        'workadress': workadresscontroller.text.trim(),
        'imageUrl': imageUrl,
        'logo': imageUrl1,
        'docId': ref.id,
      }).then((value) {
        flutterToast(msg: "Data update successfully", bgColor: Colors.green,toastLength: Toast.LENGTH_SHORT);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _logo == null
          ? AppBar(
              automaticallyImplyLeading: false,
              iconTheme: IconThemeData(
                color: Colors.blue,
              ),
              toolbarHeight: 90,
              backgroundColor: Colors.white,
              brightness: Brightness.light,
              centerTitle: true,
              title: TextButton(
                onPressed: () async {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Please Select New Logo."),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        getLogo();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.camera_alt_outlined,
                                          size: 45,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    Text('Camera')
                                  ],
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        getGallery();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.camera,
                                          size: 45,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    Text('Gallery')
                                  ],
                                )
                              ],
                            )
                          ],
                        );
                      });
                },
                child: Text('Update Company Logo'),
              ),
            )
          : AppBar(
              automaticallyImplyLeading: false,
              iconTheme: IconThemeData(
                color: Colors.blue,
              ),
              toolbarHeight: 90,
              backgroundColor: Colors.white,
              brightness: Brightness.light,
              centerTitle: true,
              title: Image.file(
                _logo!,
                height: getProportionateScreenHeight(270),
              ),
            ),
      // drawer: NavigationDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                SizedBox(height: 46),
                _image ==null? Container(
                  height: 250.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        image: NetworkImage(widget.image),
                        fit: BoxFit.cover),),
                  child: InkWell(
                    onTap: (){
                      getImage();
                    },
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                      size: 60,
                    ),
                  ),
                ): Container(
                  height: 250.0,
                  width: double.infinity,
                  // decoration: BoxDecoration(
                  //   shape: BoxShape.rectangle,
                  //   image: DecorationImage(
                  //       image: Image.file(_image!),
                  //       fit: BoxFit.cover),),
                  child: Image.file(_image!),
                ),
                // widget.image == null
                //     ? Container(
                //         height: 200.0,
                //         width: 320.0,
                //         decoration: BoxDecoration(
                //           shape: BoxShape.rectangle,
                //         ),
                //         child: IconButton(
                //           icon: FaIcon(
                //             FontAwesomeIcons.camera,
                //             color: Color.fromARGB(255, 8, 8, 8),
                //           ),
                //           iconSize: 70,
                //           onPressed: getImage,
                //         ),
                //       )
                //     : Container(
                //         height: 200.0,
                //         width: 320.0,
                //         decoration: BoxDecoration(
                //           // image: DecorationImage(
                //           //   image: Image.file(_image!),
                //           //   fit: BoxFit.fill,
                //           // ),
                //           shape: BoxShape.rectangle,
                //         ),
                //         child: Image.network(widget.image),
                //       ),
                // Text("hello"),
                SizedBox(height: 16),
                buildfworkaFormField(),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: submitData,
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField buildfworkaFormField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter Description.';
        }
        return null;
      },
      keyboardType: TextInputType.multiline,
      maxLines: null,
      controller: workadresscontroller,
      decoration: InputDecoration(
        hintText: "Enter Description",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
