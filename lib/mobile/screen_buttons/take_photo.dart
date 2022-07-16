// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:remove_h2o/mobile/size_config.dart';
import 'package:remove_h2o/mobile/ushome/user_nav_drawer.dart';

class PhotoData extends StatefulWidget {
  const PhotoData({Key? key}) : super(key: key);

  @override
  State<PhotoData> createState() => _PhotoDataState();
}

class _PhotoDataState extends State<PhotoData> {
  firebase_storage.Reference imageRef = firebase_storage
      .FirebaseStorage.instance
      .ref('Images / ${DateTime.now()}');
  final _formKey = GlobalKey<FormState>();
  File? _image;
  File? _image1;
  File? _image2;
  File? _image3;

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      final imageTem = File(image.path);
      setState(() {
        _image = imageTem;
      });
    }
  }

  Future getImage1() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      final imageTem = File(image.path);
      setState(() {
        _image1 = imageTem;
      });
    }
  }

  Future getImage2() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      final imageTem = File(image.path);
      setState(() {
        _image2 = imageTem;
      });
    }
  }

  Future getImage3() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      final imageTem = File(image.path);
      setState(() {
        _image3 = imageTem;
      });
    }
  }

  void ShowSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Data uploaded successfully'),
      backgroundColor: Colors.blue,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future submitData() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      _formKey.currentState!.save();
      namecontroller.text.trim();
      adresscontroller.text.trim();
      cellcontroller.text.trim();
      workcontroller.text.trim();
      mailadresscontroller.text.trim();
      workadresscontroller.text.trim();
      UploadTask uploadTask = imageRef.putFile(_image!);
      await Future.value(uploadTask);
      var imageUrl = await imageRef.getDownloadURL();
      UploadTask uploadTask1 = imageRef.putFile(_image1!);
      await Future.value(uploadTask1);
      var imageUrl1 = await imageRef.getDownloadURL();
      UploadTask uploadTask2 = imageRef.putFile(_image2!);
      await Future.value(uploadTask2);
      var imageUrl2 = await imageRef.getDownloadURL();
      UploadTask uploadTask3 = imageRef.putFile(_image3!);
      await Future.value(uploadTask3);
      var imageUrl3 = await imageRef.getDownloadURL();
      Navigator.pop(context);
      FirebaseFirestore.instance.collection('Leads').add({
        'name': namecontroller.text.trim(),
        'address': adresscontroller.text.trim(),
        'cellNo': cellcontroller.text.trim(),
        'work': workcontroller.text.trim(),
        'mailadress': mailadresscontroller.text.trim(),
        'workadress': workadresscontroller.text.trim(),
      }).then((value) => ShowSnackBar(context));
    }
  }

  TextEditingController namecontroller = TextEditingController();
  TextEditingController adresscontroller = TextEditingController();
  TextEditingController cellcontroller = TextEditingController();
  TextEditingController workcontroller = TextEditingController();
  TextEditingController mailadresscontroller = TextEditingController();
  TextEditingController workadresscontroller = TextEditingController();

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
        title: Image.asset(
          "assets/images/logo.png",
          height: getProportionateScreenHeight(270),
        ),
      ),
      drawer: UserNavigationDrawer(),
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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                  )),
              SizedBox(height: 16),
              buildnameFormField(),
              SizedBox(
                height: 8,
              ),
              buildfadressFormField(),
              SizedBox(
                height: 8,
              ),
              buildcellFormField(),
              SizedBox(
                height: 8,
              ),
              buildfworkFormField(),
              SizedBox(
                height: 8,
              ),
              buildfmailFormField(),
              SizedBox(
                height: 8,
              ),
              buildfworkaFormField(),
              SizedBox(
                height: 8.0,
              ),
              Text('Take Photo:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'You have to place 4 images to upload \n the data successfully',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(
                height: 28.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _image == null
                      ? Container(
                          height: 90.0,
                          width: 90.0,
                          // margin: EdgeInsets.only(right: 220),
                          padding: EdgeInsets.all(2),
                          // alignment: Alignment.center,
                          decoration:
                              new BoxDecoration(color: Colors.blueAccent),
                          child: Center(
                            child: IconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.camera,
                                color: Color.fromARGB(255, 8, 8, 8),
                              ),
                              iconSize: 70,
                              onPressed: getImage,
                            ),
                          ),
                        )
                      : Container(
                          height: 90.0,
                          width: 90.0,
                          child: Image.file(_image!),
                        ),
                  _image1 == null
                      ? Container(
                          height: 90.0,
                          width: 90.0,
                          // margin: EdgeInsets.only(right: 220),
                          padding: EdgeInsets.all(2),
                          // alignment: Alignment.center,
                          decoration:
                              new BoxDecoration(color: Colors.blueAccent),
                          child: Center(
                            child: IconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.camera,
                                color: Color.fromARGB(255, 8, 8, 8),
                              ),
                              iconSize: 70,
                              onPressed: getImage1,
                            ),
                          ),
                        )
                      : Container(
                          height: 90.0,
                          width: 90.0,
                          child: Image.file(_image1!),
                        ),
                ],
              ),
              SizedBox(
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _image2 == null
                      ? Container(
                          height: 90.0,
                          width: 90.0,
                          // margin: EdgeInsets.only(right: 220),
                          padding: EdgeInsets.all(2),
                          // alignment: Alignment.center,
                          decoration:
                              new BoxDecoration(color: Colors.blueAccent),
                          child: Center(
                            child: IconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.camera,
                                color: Color.fromARGB(255, 8, 8, 8),
                              ),
                              iconSize: 70,
                              onPressed: getImage2,
                            ),
                          ),
                        )
                      : Container(
                          height: 90.0,
                          width: 90.0,
                          child: Image.file(_image2!),
                        ),
                  _image3 == null
                      ? Container(
                          height: 90.0,
                          width: 90.0,
                          // margin: EdgeInsets.only(right: 220),
                          padding: EdgeInsets.all(2),
                          // alignment: Alignment.center,
                          decoration:
                              new BoxDecoration(color: Colors.blueAccent),
                          child: Center(
                            child: IconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.camera,
                                color: Color.fromARGB(255, 8, 8, 8),
                              ),
                              iconSize: 70,
                              onPressed: getImage3,
                            ),
                          ),
                        )
                      : Container(
                          height: 90.0,
                          width: 90.0,
                          child: Image.file(_image3!),
                        ),
                ],
              ),
              SizedBox(
                height: 20.0,
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
                  onPressed: submitData,
                  child: Text('Continue'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildnameFormField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter Your C_name.';
        }
        return null;
      },
      controller: namecontroller,
      decoration: InputDecoration(
        hintText: "Enter C_name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildfadressFormField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter Your Adress.';
        }
        return null;
      },
      controller: adresscontroller,
      decoration: InputDecoration(
        hintText: "Enter Your Adress",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildcellFormField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter Your Cell No.';
        }
        return null;
      },
      controller: cellcontroller,
      decoration: InputDecoration(
        hintText: "Enter Cell#",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildfworkFormField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter Your work.';
        }
        return null;
      },
      controller: workcontroller,
      decoration: InputDecoration(
        hintText: "Enter Work",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildfmailFormField() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email address cannot be empty';
        }
        String pattern = r'\w+@\w+\.\w+';
        if (!RegExp(pattern).hasMatch(value)) {
          return 'InvalidE-mail Address format.';
        }
        return null;
      },
      controller: mailadresscontroller,
      decoration: InputDecoration(
        hintText: "Enter Email Adress",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildfworkaFormField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter Your Work Adress.';
        }
        return null;
      },
      controller: workadresscontroller,
      decoration: InputDecoration(
        hintText: "Enter Work Adress",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
