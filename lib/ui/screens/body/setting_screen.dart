import 'package:fisrtflutter/ui/widget/mywidget.dart';
import 'package:fisrtflutter/utils/mycolors.dart';
import 'package:fisrtflutter/utils/mysizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.main_background,
      appBar: CustomToolBar(title: "Setting", showBack: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Dark Mode",
                    style: TextStyle(
                      color: MyColors.text_1,
                      fontSize: MySizes.text_size_medium,
                    ),
                  ),
                ),
                Switch(value: true, onChanged: (bool) {}),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Arabic Langashe",
                    style: TextStyle(
                      color: MyColors.text_1,
                      fontSize: MySizes.text_size_medium,
                    ),
                  ),
                ),
                Switch(value: true, onChanged: (bool) {

                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}