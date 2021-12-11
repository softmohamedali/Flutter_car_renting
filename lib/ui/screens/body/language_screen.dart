import 'package:fisrtflutter/ui/widget/mywidget.dart';
import 'package:fisrtflutter/utils/mycolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.main_background,
      appBar: CustomToolBar(title: "App Language", showBack: true),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Icon(
              Icons.directions_car_rounded,
              color: MyColors.blue,
              size: 100,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Moali",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: MyColors.text_2),
                ),
                Text(
                  " Cars",
                  style: TextStyle(fontSize: 30, color: MyColors.blue),
                ),
              ],
            ),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  color: MyColors.blue,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "englishe",
                      style: TextStyle(
                        color: MyColors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 40,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  color: MyColors.blue,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "عربي",
                      style: TextStyle(
                        color: MyColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
