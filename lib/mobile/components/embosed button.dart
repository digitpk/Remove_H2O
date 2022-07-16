import 'package:flutter/material.dart';

class GreetButtonTwo extends StatelessWidget {
  const GreetButtonTwo({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);
  final String? text;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          width: 280.0,
          height: 50.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.white,
                    blurRadius: 10.0,
                    spreadRadius: 7.0,
                    offset: Offset(-5.0, -5.0) //keep shadow centered
                    ),
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10.0,
                    spreadRadius: 7.0,
                    offset: Offset(5.0, 5.0) //keep shadow centered
                    )
              ]),
          child: ElevatedButton(
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28.0),
                        side: BorderSide(
                          color: Colors.grey,
                        )))),
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  text!,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
            onPressed: press as void Function()?,
          ),
        ),
      ),
    );
  }
}
