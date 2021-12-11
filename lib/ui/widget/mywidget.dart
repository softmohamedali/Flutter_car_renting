import 'package:fisrtflutter/utils/mycolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';



AppBar CustomToolBar({
  required String title,
  required bool showBack
})
{
  return AppBar(
    backgroundColor: MyColors.main_background,
    centerTitle: true,
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.bold,
        color: MyColors.blue,
      ),
    ),
    actions: showBack ?[
      IconButton(
          onPressed: (){
            Get.back();
          },
          icon: Icon(
            Icons.navigate_next,
            color: MyColors.blue,
          )
      )
    ]:[],
  );
}
