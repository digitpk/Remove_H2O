import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:remove_h2o/Mobile/theme.dart';
import 'package:remove_h2o/mobile/Screens/strsplash.dart';
import 'package:remove_h2o/website/constants.dart';
import 'package:remove_h2o/website/home_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    // options: kIsWeb || Platform.isAndroid
    //     ? const FirebaseOptions(
    //         apiKey: "AIzaSyBZUe4jJe_zjtNVeidyYSezQAYKPuVGVoA",
    //         appId: "1:663029016523:web:b0b77f7ff5accb66be384e",
    //         messagingSenderId: "663029016523",
    //         projectId: "removeh2o-360",
    //         storageBucket: "removeh2o-360.appspot.com",
    //       )
    //     : null,
  );
  runApp(MyApp());
}
flutterToast({required String msg,required Color bgColor,required Toast toastLength}){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: toastLength,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: bgColor,
      textColor: Colors.white,
      fontSize: 16.0
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (kIsWeb || Platform.isMacOS || Platform.isLinux || Platform.isWindows) {
      return MaterialApp(
        builder: (context, child) => ResponsiveWrapper.builder(child,
            maxWidth: 1200,
            minWidth: 480,
            defaultScale: true,
            breakpoints: const [
              ResponsiveBreakpoint.resize(480, name: MOBILE),
              ResponsiveBreakpoint.autoScale(800, name: TABLET),
              ResponsiveBreakpoint.resize(1000, name: DESKTOP),
              ResponsiveBreakpoint.autoScale(2460, name: '4K'),
            ],
            background: Container(
              color: const Color(0xFFF5F5F5),
            )),
        debugShowCheckedModeBanner: false,
        title: 'Remove H2O',
        theme: ThemeData(
          inputDecorationTheme: kDefaultInputDecorationTheme,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: WebHomeScreen(),
      );
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Remove H2O',
      home: strsplash(),
      theme: theme(),
    );
  }
}
