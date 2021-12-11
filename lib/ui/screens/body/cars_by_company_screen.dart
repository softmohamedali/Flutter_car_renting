import 'package:fisrtflutter/ui/widget/car_item_widget.dart';
import 'package:fisrtflutter/ui/widget/mywidget.dart';
import 'package:fisrtflutter/utils/mycolors.dart';
import 'package:fisrtflutter/view_models/FavViewModel.dart';
import 'package:fisrtflutter/view_models/car_by_compony_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

class CarByCompanyScreen extends StatelessWidget {
  String company;
  CarByCompanyScreen({required this.company}) {}
  var exController=Get.find<FavViewModel>();
  var exControllerCarCompny=Get.find<CarByComponyViewModel>();

  @override
  Widget build(BuildContext context) {
    exControllerCarCompny.carName=company;
    exControllerCarCompny.getCarsByComny();
    return Scaffold(
      backgroundColor: MyColors.main_background,
      appBar: CustomToolBar(title: "${company}", showBack: true),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Stack(
          children: [
            GetX<CarByComponyViewModel>(builder: (controller) {
              if (controller.carsByCompony.value.length > 0) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ProductItem(
                        name: controller.carsByCompony.value[index].name,
                        image:controller.carsByCompony.value[index].img,
                        isfav:exController.carIsFav(controller.carsByCompony.value[index]),
                        model:controller.carsByCompony.value[index].model,
                        feaut:controller.carsByCompony.value[index].fuelType,
                        location:controller.carsByCompony.value[index].location,
                        km:controller.carsByCompony.value[index].numKiloMeter,
                        speed:controller.carsByCompony.value[index].model,
                        car:controller.carsByCompony.value[index]);
                  },
                  itemCount: controller.carsByCompony.value.length,
                  scrollDirection: Axis.vertical,
                );
              } else {
                return Center(child: Text("No cars Found ",style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),));
              }
            }),
            Center(
              child: GetX<FavViewModel>(
                builder: (contrller) => contrller.getFavProgress.value
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
