import 'package:fisrtflutter/ui/widget/car_item_widget.dart';
import 'package:fisrtflutter/ui/widget/mywidget.dart';
import 'package:fisrtflutter/utils/mycolors.dart';
import 'package:fisrtflutter/view_models/FavViewModel.dart';
import 'package:fisrtflutter/view_models/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class FavScreen extends StatelessWidget {

  var exController=Get.find<FavViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.main_background,
      appBar: CustomToolBar(title: "My Favorite",showBack: false),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Stack(
          children: [
            GetX<FavViewModel>(
              builder:(controller) {
                if(controller.favCars.value.length>0)
                  {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return ProductItem(
                            name: controller.favCars.value[index].name,
                            image:controller.favCars.value[index].img,
                            isfav:controller.carIsFav(controller.favCars.value[index]),
                            model:controller.favCars.value[index].model,
                            feaut:controller.favCars.value[index].fuelType,
                            location:controller.favCars.value[index].location,
                            km:controller.favCars.value[index].numKiloMeter,
                            speed:controller.favCars.value[index].model,
                            car:controller.favCars.value[index]
                        );
                      },
                      itemCount: controller.favCars.value.length,
                      scrollDirection: Axis.vertical,
                    );
                  }
                else{
                  return Center(child: Text("No Favorite",style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),));
                }
              }
            ),
            Center(
              child: GetX<FavViewModel>(
                builder:  (contrller) =>
                contrller.getFavProgress.value ? CircularProgressIndicator():Center(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
