import 'package:flutter/material.dart';
import 'package:remove_h2o/Screens/aboutus/aboutus_screen.dart';
import 'package:remove_h2o/Screens/contactus.dart/contactus_screen.dart';
import 'package:remove_h2o/Screens/home/components/body.dart';
import 'package:remove_h2o/Screens/my_info/my_info_screen.dart';
import 'package:remove_h2o/Screens/shareapp/share_app.dart';
import 'package:remove_h2o/Screens/social_media/social_screen.dart';
import 'package:remove_h2o/components/Drawer.dart';
import 'package:remove_h2o/components/my_drawer_header.dart';
import 'package:remove_h2o/size_config.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var currentPage = DrawerSections.home;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.home) {
      container = Body();
    } else if (currentPage == DrawerSections.contacts) {
      container = ctspage();
    } else if (currentPage == DrawerSections.aboutus) {
      container = abtpage();
    } else if (currentPage == DrawerSections.socialmedia) {
      container = socialpage();
    } else if (currentPage == DrawerSections.shareapp) {
      container = shrappage();
    } else if (currentPage == DrawerSections.myinfo) {
      container = infopage();
    }
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
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyHeaderDrawer(),
              MyDrawerList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(children: [
        menuItem(1, "Home", Icons.dashboard_outlined,
            currentPage == DrawerSections.home ? true : false),
        menuItem(2, "Contact Us", Icons.people_alt_outlined,
            currentPage == DrawerSections.contacts ? true : false),
        menuItem(3, "About Us", Icons.event,
            currentPage == DrawerSections.aboutus ? true : false),
        menuItem(4, "Social Media", Icons.notes,
            currentPage == DrawerSections.socialmedia ? true : false),
        Divider(),
        menuItem(5, "My info", Icons.person_outlined,
            currentPage == DrawerSections.myinfo ? true : false),
      ]),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.home;
            } else if (id == 2) {
              currentPage = DrawerSections.contacts;
            } else if (id == 3) {
              currentPage = DrawerSections.aboutus;
            } else if (id == 4) {
              currentPage = DrawerSections.socialmedia;
            } else if (id == 5) {
              currentPage = DrawerSections.shareapp;
            } else if (id == 6) {
              currentPage = DrawerSections.myinfo;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  home,
  contacts,
  aboutus,
  socialmedia,
  shareapp,
  myinfo,
}
