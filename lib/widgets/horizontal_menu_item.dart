// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webappdashboard/constants/controllers.dart';
import 'package:webappdashboard/constants/style.dart';
import 'package:webappdashboard/widgets/custom_text.dart';

class HorizontalMenuItem extends StatelessWidget {
  const HorizontalMenuItem({
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
                    width: 6,
                    height: 40,
                    color: dark,
                  ),
                  maintainAnimation: true,
                  maintainSize: true,
                  maintainState: true,
                ),
                SizedBox(
                  width: _width / 80,
                ),
                Padding(
                    padding: EdgeInsets.all(16),
                    child: menuController.returnIconFor(itemName)),
                if (menuController.isActive(itemName))
                  Flexible(
                      child: CustomText(
                    text: itemName,
                    color: menuController.isHovering(itemName) ? dark : light,
                    weight: FontWeight.normal,
                    size: 18,
                  ))
                else
                  Flexible(
                      child: CustomText(
                          text: itemName,
                          color: dark,
                          size: 18,
                          weight: FontWeight.bold)),
              ],
            ),
          )),
    );
  }
}
