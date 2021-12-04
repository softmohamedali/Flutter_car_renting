import 'package:fisrtflutter/ui/screens/body/companys_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../utils/mycolors.dart';

Widget SeeAllButton(String text,Widget screen) {
  return OutlinedButton.icon(
    onPressed: () {
      Get.to(screen);
    },
    style: OutlinedButton.styleFrom(
      side: BorderSide(width: 1.0, color: MyColors.green),
      padding: EdgeInsets.symmetric(
        vertical: 0,
        horizontal: 10,
      ),
      minimumSize: Size(50, 23),
    ),
    icon: Icon(
      Icons.navigate_next,
      color: MyColors.green,
      size: 18,
    ),
    label: Padding(
      padding: EdgeInsets.all(0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          color: MyColors.green,
        ),
      ),
    ),
  );
}