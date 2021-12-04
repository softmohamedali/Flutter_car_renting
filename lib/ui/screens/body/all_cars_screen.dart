import 'package:fisrtflutter/ui/widget/car_item_widget.dart';
import 'package:fisrtflutter/ui/widget/mywidget.dart';
import 'package:fisrtflutter/utils/mycolors.dart';
import 'package:fisrtflutter/view_models/FavViewModel.dart';
import 'package:fisrtflutter/view_models/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

class AllCarsScreen extends StatelessWidget {
  var exController=Get.find<FavViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.main_background,
      appBar:CustomToolBar(title: "All Cars",showBack: true) ,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Expanded(
              child: Container(
                child: GetX<HomeViewModel>(
                  builder:(controller) => ListView.builder(
                    itemBuilder: (context, index) {
                      return ProductItem(
                        name: controller.allCars[index].name,
                        image:controller.allCars[index].img,
                        isfav:exController.carIsFav(controller.allCars.value[index]),
                        model:controller.allCars[index].model,
                        feaut:controller.allCars[index].fuelType,
                        location:controller.allCars[index].location,
                        km:controller.allCars[index].numKiloMeter,
                        speed:controller.allCars[index].model,
                        car:controller.allCars[index],
                      );
                    },
                    itemCount: controller.allCars.length,
                    scrollDirection: Axis.vertical,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: GetX<HomeViewModel>(
              builder:  (contrller) =>
              contrller.getAllCarProgress.value ? CircularProgressIndicator():Center(),
            ),
          )
        ],
      ),
    );
  }
}
