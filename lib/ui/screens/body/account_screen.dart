import 'package:fisrtflutter/ui/widget/mywidget.dart';
import 'package:fisrtflutter/utils/mycolors.dart';
import 'package:fisrtflutter/utils/mysizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.main_background,
      appBar: CustomToolBar(title: "My Account", showBack: false),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: 30,
            ),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                    width: 100,
                    height: 100,
                    child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(110),
                          color: MyColors.back_icon,
                        ),
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.person,
                          size: 80,
                          color: MyColors.blue,
                        ))),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(110),
                    color: MyColors.text_2,
                  ),
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.add_a_photo,
                    color: MyColors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "name",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),

          ],
        ),
      ),
    );
  }
}
