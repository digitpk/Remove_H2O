// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class PendingAccess extends StatefulWidget {
  PendingAccess({
    this.press,
    // this.email,
    // this.fname,
    // this.lname,
    // this.phoneNo,
    required this.text,
  });

  // dynamic email;
  // dynamic fname;
  // dynamic lname;
  // dynamic phoneNo;
  var text;
  VoidCallback? press;

  @override
  State<PendingAccess> createState() => _PendingAccessState();
}

class _PendingAccessState extends State<PendingAccess> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.black,
          padding: EdgeInsets.all(30),
          textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Colors.grey[200],
        ),
        onPressed: widget.press,
        child: Row(
          children: [
            // IconButton(
            //   icon: FaIcon(
            //     icon,
            //     color: Color.fromARGB(255, 8, 8, 8),
            //   ),
            //   iconSize: 40,
            //   onPressed: null,
            // ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                  radius: (30),
                  backgroundColor: Colors.white,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset("assets/images/Profile Image.png"),
                  )),
            ),
            // SizedBox(width: 20),
            Expanded(child: Text(widget.text)),
            // Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
