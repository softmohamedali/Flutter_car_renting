import 'package:fisrtflutter/ui/widget/car_catigory_wiidget.dart';
import 'package:fisrtflutter/ui/widget/mywidget.dart';
import 'package:fisrtflutter/view_models/companys_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

class CompanysScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomToolBar(title: "Companys", showBack: true),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Stack(
          children: [
            GetX<CompanysViewModel>(builder: (controller) {
              if (controller.companys.value.length > 0) {
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (context, index) {
                      return CatigoryItem(
                          controller.companys[index].name,
                          controller.companys[index].img
                      );
                    },
                  itemCount: controller.companys.value.length,
                  scrollDirection: Axis.vertical,
                );
              } else {
                return Text("data");
              }
            }),
            Center(
              child: GetX<CompanysViewModel>(
                builder: (contrller) => contrller.getCompanysProgress.value
                    ? CircularProgressIndicator()
                    : Center(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
