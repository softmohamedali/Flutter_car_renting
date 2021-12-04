import 'package:fisrtflutter/ui/widget/mywidget.dart';
import 'package:fisrtflutter/utils/mycolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomToolBar(title: "App Language",showBack: true),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 20,),
            Icon(
              Icons.directions_car_rounded,
              color: MyColors.green,
              size: 100,
            ),
            SizedBox(height:10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Moali",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: MyColors.text_2
                ),),
                Text(" Cars",style: TextStyle(
                    fontSize: 30,
                    color: MyColors.green
                ),),
              ],
            ),
            Text("")
          ],
        ),
      ),
    );
  }
}
