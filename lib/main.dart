import 'package:flutter/material.dart';
import 'package:phygital/ProductFactoryModel.dart';
import 'package:phygital/manufactuer_homepage.dart';
import 'package:phygital/mobileHomePage.dart';
import 'package:phygital/testpage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductFactoryModel(),
      child: MaterialApp(
        title: 'Flutter TODO',
        home:
            // MobileHomePageWidget(),
            ManufacturerHomepage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
