// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:webappdashboard/widgets/side_menu.dart';
import 'package:webappdashboard/widgets/top_nav.dart';

import 'helpers/responsiveness.dart';
import 'widgets/large_screen.dart';
import 'widgets/small_screen.dart';

class SiteLayout extends StatelessWidget {
 
  SiteLayout({Key? key}) : super(key: key);
 final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      key: scaffoldKey,
      appBar: topNavigationBar(context,scaffoldKey),
      drawer: Drawer(child: SideMenu(),),
      body: ResponsiveWidget(largeScreen: LargeScreen(),smallScreen: SmallScreen(),customScreen: LargeScreen(),mediumScreen: LargeScreen(),),
    );
  }
}
