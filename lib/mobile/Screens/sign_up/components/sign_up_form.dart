// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:remove_h2o/main.dart';
import 'package:remove_h2o/mobile/Screens/home/components/body.dart';
import 'package:remove_h2o/mobile/Screens/sign_in/sign_in_screen.dart';
import 'package:remove_h2o/mobile/components/custom_surfix_icon.dart';
import 'package:remove_h2o/mobile/components/embosed%20button.dart';
import 'package:remove_h2o/mobile/components/form_error.dart';

import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  SignUpForm(this.submitFn);

  final void Function(
    String email,
    String fname,
    String lname,
    String phoneNo,
    String password,
  ) submitFn;

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  // String? fname;
  // String? lname;
  // String? phoneNo;
  // String? email;
  // String? password;

  TextEditingController econtroller = TextEditingController();
  TextEditingController fcontroller = TextEditingController();
  TextEditingController lcontroller = TextEditingController();
  TextEditingController pcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  void trySubmit() {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      _formKey.currentState!.save();
      widget.submitFn(
        econtroller.text.trim(),
        fcontroller.text.trim(),
        lcontroller.text.trim(),
        pcontroller.text.trim(),
        passwordcontroller.text.trim(),
      );
      flutterToast(
          msg: "new user created successfully please login again",
          bgColor: Colors.green,
          toastLength: Toast.LENGTH_LONG);
      Navigator.push(context, MaterialPageRoute(builder: (_)=>SignInScreen()));
    }
  }

  // String? email;
  // String? password;
  // String? conform_password;
  // bool remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb || Platform.isMacOS || Platform.isLinux || Platform.isWindows) {
      return Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: buildfnameFormField(),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: getProportionateScreenWidth(20)),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: buildlastnameFormField(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(15)),
            Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: buildphonenumberFormField(),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: getProportionateScreenWidth(20)),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: buildEmailFormField(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(15)),
            // buildfnameFormField(),
            // SizedBox(height: getProportionateScreenHeight(15)),
            // buildlastnameFormField(),
            // SizedBox(height: getProportionateScreenHeight(15)),
            // buildphonenumberFormField(),
            // SizedBox(height: getProportionateScreenHeight(15)),
            // buildEmailFormField(),
            // SizedBox(height: getProportionateScreenHeight(15)),
            buildPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(15)),
            FormError(errors: errors),
            SizedBox(height: getProportionateScreenHeight(15)),
            GreetButtonTwo(
              text: "Continue",
              press: trySubmit,
            ),
          ],
        ),
      );
    }
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          buildfnameFormField(),
          SizedBox(height: getProportionateScreenHeight(15)),
          buildlastnameFormField(),
          SizedBox(height: getProportionateScreenHeight(15)),
          buildphonenumberFormField(),
          SizedBox(height: getProportionateScreenHeight(15)),
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(15)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(15)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(15)),
          GreetButtonTwo(
            text: "Continue",
            press: trySubmit,
          ),
        ],
      ),
    );
  }

  ///code for password
  TextFormField buildPasswordFormField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) return 'Password cannot be empty.';
        if (value.length < 6) return 'password must be at least 6 character.';
        return null;
      },
      controller: passwordcontroller,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter Your Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  ///code email addeess
  TextFormField buildEmailFormField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) return 'Please Enter Email Address.';
        if (!value.contains('@') || !value.contains('.'))
          return 'Please Enter Valid Email address';
        return null;
      },
      controller: econtroller,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter Your Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  ///code for name
  TextFormField buildfnameFormField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty || value == null) return 'Please Enter Your name.';
        if (value.length < 6) return "Name cannot be less than 6";
        return null;
      },
      controller: fcontroller,
      decoration: InputDecoration(
        labelText: "Name",
        hintText: "Enter your Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomIcon(svgIcon: "assets/icons/User Icon.svg"),
      ),
    );
  }

  ///code for phone num
  TextFormField buildphonenumberFormField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) return 'Please Enter Your phone number.';
        if (value.length < 11) return "Please enter valid Phone number";
        return null;
      },
      controller: pcontroller,
      decoration: InputDecoration(
        labelText: "Phone#",
        hintText: "Enter your Phone mum",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  ///code for location address
  TextFormField buildlastnameFormField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter Your Address.';
        }
        return null;
      },
      controller: lcontroller,
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Enter your Address",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomIcon(svgIcon: "assets/icons/User Icon.svg"),
      ),
    );
  }
}
