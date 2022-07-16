import 'package:flutter/material.dart';

import 'components/body.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  // var currentPage = DrawerSections.home;

  @override
  Widget build(BuildContext context) {
//     // var container;
//     //
//     // if (currentPage == DrawerSections.home) {
//     //   container = Body();
//     // } else if (currentPage == DrawerSections.contacts) {
//     //   container = ContactusBody();
//     // } else if (currentPage == DrawerSections.aboutus) {
//     //   container = abtpage();
//     // }
//     // // else if (currentPage == DrawerSections.socialmedia) {
//     // //   container = socialpage();
//     // // }
//     // else if (currentPage == DrawerSections.shareapp) {
//     //   container = ShareApp();
//     // } else if (currentPage == DrawerSections.myinfo) {
//     //   container = Infoscreenbody();
//     // }
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(
//           color: Colors.blue,
//         ),
//         toolbarHeight: 90,
//         backgroundColor: Colors.white,
//         brightness: Brightness.light,
//         centerTitle: true,
//         title: Image.asset(
//           "assets/images/logo.png",
//           height: getProportionateScreenHeight(270),
//         ),
//       ),
//       //  body: container,
//       drawer: NavigationDrawer(),
//       // Drawer(
//       //   child: SingleChildScrollView(
//       //     child: Column(
//       //       children: [
//       //         MyHeaderDrawer(),
//       //         MyDrawerList(),
//       //       ],
//       //     ),
//       //   ),
//       // ),
//     );
//   }
//
//   // Widget MyDrawerList() {
//   //   return Container(
//   //     padding: EdgeInsets.only(
//   //       top: 0,
//   //     ),
//   //     child: Column(children: [
//   //       Divider(
//   //         thickness: 3,
//   //       ),
//   //       menuItem(1, "Home", Icons.dashboard_outlined,
//   //           currentPage == DrawerSections.home ? true : false),
//   //       Divider(thickness: 3),
//   //       menuItem(2, "Contact Us", Icons.people_alt_outlined,
//   //           currentPage == DrawerSections.contacts ? true : false),
//   //       Divider(
//   //         thickness: 3,
//   //       ),
//   //       menuItem(3, "About Us", Icons.event,
//   //           currentPage == DrawerSections.aboutus ? true : false),
//   //       // Divider(thickness: 3,),
//   //       // menuItem(4, "Social Media", Icons.notes,
//   //       //     currentPage == DrawerSections.socialmedia ? true : false),
//   //       Divider(
//   //         thickness: 3,
//   //       ),
//   //       menuItem(5, "Share App", Icons.share,
//   //           currentPage == DrawerSections.shareapp ? true : false),
//   //       Divider(
//   //         thickness: 3,
//   //       ),
//   //       menuItem(6, "My info", Icons.person_outlined,
//   //           currentPage == DrawerSections.myinfo ? true : false),
//   //       Divider(
//   //         thickness: 3,
//   //       ),
//   //     ]),
//   //   );
//   // }
//
//   Widget menuItem(int id, String title, IconData icon, bool selected) {
//     return Material(
//       color: selected ? Colors.grey[300] : Colors.transparent,
//       child: InkWell(
//         onTap: () {
//           Navigator.pop(context);
//           setState(() {
//             if (id == 1) {
//               currentPage = DrawerSections.home;
//             } else if (id == 2) {
//               currentPage = DrawerSections.contacts;
//             } else if (id == 3) {
//               currentPage = DrawerSections.aboutus;
//             } else if (id == 4) {
//               currentPage = DrawerSections.socialmedia;
//             } else if (id == 5) {
//               currentPage = DrawerSections.shareapp;
//             } else if (id == 6) {
//               currentPage = DrawerSections.myinfo;
//             }
//           });
//         },
//         child: Padding(
//           padding: EdgeInsets.all(15.0),
//           child: Row(
//             children: [
//               Expanded(
//                 child: Icon(
//                   icon,
//                 ),
//               ),
//               Expanded(
//                 flex: 3,
//                 child: Text(
//                   title,
//                   style: TextStyle(color: Colors.black, fontSize: 16),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// enum DrawerSections {
//   home,
//   reprotEmg,
//   contacts,
//   aboutus,
//   socialmedia,
//   shareapp,
//   myinfo,
    return VendorBody();
  }
}
