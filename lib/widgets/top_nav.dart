// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webappdashboard/constants/style.dart';
import 'package:webappdashboard/helpers/responsiveness.dart';

import 'custom_text.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) {
  return AppBar(
    leading: !ResponsiveWidget.isSmallScreen(context)
        ? Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 14),
                child: Image.asset(
                  'assets/icons/logo.png',
                  width: 28,
                ),
              ),
            ],
          )
        : IconButton(
            color: lightGrey,
            onPressed: () {
              key.currentState!.openDrawer();
            },
            icon: Icon(Icons.menu)),
    elevation: 0.0,
    backgroundColor: Colors.white,
    title: Row(
      children: [
        Visibility(
          child: CustomText(
              text: 'Dash',
              color: lightGrey,
              size: 20,
              weight: FontWeight.bold),
        ),
        Expanded(child: Container()),
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings, color: dark.withOpacity(.7))),
        Stack(
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications_active,
                    color: dark.withOpacity(.7))),
            Positioned(
                top: 7,
                right: 7,
                child: Container(
                  width: 12,
                  height: 12,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: active,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: light, width: 2),
                  ),
                )),
          ],
        ),
        Container(width: 1, height: 22, color: lightGrey),
        SizedBox(width: 24),
        CustomText(
          text: 'Kode Mafia',
          color: lightGrey,
          size: 18,
          weight: FontWeight.bold,
        ),
        SizedBox(
          width: 16,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: Container(
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.all(2),
            child: CircleAvatar(
              backgroundColor: light,
              child: Icon(
                Icons.person_outline,
                color: dark,
              ),
            ),
          ),
        )
      ],
    ),
    iconTheme: IconThemeData(
      color: dark,
    ),
  );
}
