// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webappdashboard/constants/controllers.dart';
import 'package:webappdashboard/constants/style.dart';
import 'package:webappdashboard/helpers/responsiveness.dart';
import 'package:webappdashboard/routing/routes.dart';
import 'package:webappdashboard/widgets/custom_text.dart';

import 'side_menu_item.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      color: light,
      child: ListView(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(children: [
                  SizedBox(
                    width: _width / 48,
                  ),
                  Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Image.asset('assets/icons/logo.png')),
                  Flexible(
                      child: CustomText(
                    text: 'Dash',
                    size: 20,
                    weight: FontWeight.bold,
                    color: active,
                  )),
                  SizedBox(
                    width: _width / 48,
                  )
                ]),
               
              ],
            ),
             SizedBox(
            height: 40,
          ),
          Divider(
            color: lightGrey.withOpacity(.1),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: sideMenuItems
                .map((itemName) => SideMenuItem(
                      onTap: () {
                        if (itemName == AuthenticationPageRoute) {
                          //todo: go to authentication page
                        }
                        if (!menuController.isActive(itemName)) {
                          menuController.changeActiveitemTo(itemName);
                        }
                        if (ResponsiveWidget.isSmallScreen(context)) {
                          Get.back();
                          //todo: go to item name route
                        }
                      },
                      itemName: itemName == AuthenticationPageRoute
                          ? "Log Out"
                          : itemName,
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
