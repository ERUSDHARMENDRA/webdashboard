// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webappdashboard/constants/controllers.dart';
import 'package:webappdashboard/constants/style.dart';

class VerticalMenu extends StatelessWidget {
  const VerticalMenu({
    Key? key,
    required this.itemName,
    required this.onTap,
  }) : super(key: key);
  final String itemName;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTap(),
      onHover: (value) {
        value
            ? menuController.onHover(itemName)
            : menuController.onHover('not hovering');
      },
      child: Obx(() => Container(
            color: menuController.isHovering(itemName)
                ? lightGrey.withOpacity(.1)
                : Colors.transparent,
            child: Row(
              children: [
                Visibility(
                  visible: menuController.isHovering(itemName) ||
                      menuController.isActive(itemName),
                  child: Container(
                    width: 3,
                    height: 72,
                    color: dark,
                  ),
                  maintainAnimation: true,
                  maintainSize: true,
                  maintainState: true,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                          padding: EdgeInsets.all(16),
                          child: menuController.returnIconFor(itemName)),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
