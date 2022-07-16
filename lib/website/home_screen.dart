import 'package:flutter/material.dart';
import 'package:remove_h2o/website/constants.dart';
import 'package:remove_h2o/website/sections/about/about_section.dart';
import 'package:remove_h2o/website/sections/contact/contact_section.dart';
import 'package:remove_h2o/website/sections/feedback/feedback_section.dart';
import 'package:remove_h2o/website/sections/recent_work/recent_work_section.dart';
import 'package:remove_h2o/website/sections/service/service_section.dart';
import 'package:remove_h2o/website/sections/topSection/top_section.dart';

class WebHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopSection(),
            SizedBox(height: kDefaultPadding * 2),
            AboutSection(),
            ServiceSection(),
            RecentWorkSection(),
            FeedbackSection(),
            SizedBox(height: kDefaultPadding),
            ContactSection(),
            // This SizeBox just for demo
            // SizedBox(
            //   height: 500,
            // )
          ],
        ),
      ),
    );
  }
}
