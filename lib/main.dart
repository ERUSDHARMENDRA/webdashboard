// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webappdashboard/controllers/menu_%20controller.dart';
import 'layout.dart';

void main() {
  Get.put(MenuController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Web Dashboard ',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.black),
          pageTransitionsTheme: PageTransitionsTheme(
              // ignore: prefer_const_literals_to_create_immutables
              builders: {
                TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
                TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
              }),
          primaryColor: Colors.blue),
      home: SiteLayout(),
    );
  }
}
