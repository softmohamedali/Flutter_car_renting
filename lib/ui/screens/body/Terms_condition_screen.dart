import 'package:fisrtflutter/ui/widget/mywidget.dart';
import 'package:fisrtflutter/utils/mycolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TermsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.main_background,
      appBar: CustomToolBar(title: "Legacy Privacy",showBack: true),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 20,),
            Icon(
              Icons.directions_car_rounded,
              color: MyColors.blue,
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
                    color: MyColors.blue
                ),),
              ],
            ),
            SizedBox(height: 80,),
            Center(child: Text("Terms and condition"))
          ],
        ),
      ),
    );
  }
}
