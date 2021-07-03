import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webappdashboard/constants/style.dart';
import 'package:webappdashboard/routing/routes.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();

  var activeItem = OverViewPageRoute.obs;
  var hoverItem = ''.obs;

  changeActiveitemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isActive(String itemName) => activeItem.value == itemName;
  isHovering(String itemName) => hoverItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case OverViewPageRoute:
        return _customIcon(Icons.trending_up, itemName);
      case DriversPageRoute:
        return _customIcon(Icons.drive_eta, itemName);
      case ClientsPageRoute:
        return _customIcon(Icons.people_alt_outlined, itemName);
      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName))
      // ignore: curly_braces_in_flow_control_structures
      return Icon(
        icon,
        size: 22,
        color: dark,
      );
    return Icon(
      icon,
      color: isHovering(itemName) ? dark : lightGrey,
    );
  }
}
