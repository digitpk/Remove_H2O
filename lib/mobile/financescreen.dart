import 'package:flutter/material.dart';
import 'package:remove_h2o/mobile/navigartion_drawer.dart';
import 'package:remove_h2o/mobile/size_config.dart';

class Financescreen extends StatelessWidget {
  const Financescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
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
      // drawer: NavigationDrawer(),
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
      body: const Center(
        child: Text('there is no data is present'),
      ),
    );
  }
}
