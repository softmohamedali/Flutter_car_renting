import 'package:fisrtflutter/ui/mycolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget CustomBottomSheet()
{
  return Container(
    width: double.infinity,
    height: 200,
    alignment: Alignment.center,
    child:Text("hi there"),
  );
}

AppBar CustomToolBar({
  required String title,
  onBackPress,
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
        color: MyColors.green,
      ),
    ),
    actions: [
      IconButton(
          onPressed: onBackPress,
          icon: Icon(
            Icons.navigate_next,
            color: MyColors.green,
          )
      )
    ],
  );
}
