// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:webappdashboard/helpers/responsiveness.dart';
import 'package:webappdashboard/widgets/horizontal_menu_item.dart';
import 'package:webappdashboard/widgets/vertical_menu_item.dart';

class SideMenuItem extends StatelessWidget {
  const SideMenuItem({
    Key? key,
    required this.itemName,
    required this.onTap,
  }) : super(key: key);
  final String itemName;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    if (ResponsiveWidget.isCustomScreen(context)) {
      return VerticalMenu(itemName: itemName, onTap: onTap);
    } else {
      return HorizontalMenuItem(itemName: itemName, onTap: onTap);
    }
  }
}
