import 'package:fisrtflutter/ui/widget/car_item_widget.dart';
import 'package:fisrtflutter/ui/widget/mywidget.dart';
import 'package:fisrtflutter/utils/mycolors.dart';
import 'package:fisrtflutter/view_models/FavViewModel.dart';
import 'package:fisrtflutter/view_models/search_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

class SearchScreen extends StatelessWidget {

  var searchViewModel=Get.find<SearchViewModel>();
  var favViewModel=Get.find<FavViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomToolBar(title: "Search", showBack: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 50,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: MyColors.white,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Enter Text To Searsh",
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      suffixIcon: IconButton(
                        onPressed: (){
                          searchViewModel.getSearchCar();
                        },
                        icon: Icon(Icons.search_sharp),
                      ),
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      searchViewModel.query=value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "this faield require";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 15,),
                Expanded(
                  child: Container(
                    child: GetX<SearchViewModel>(
                      builder:(controller) => ListView.builder(
                        itemBuilder: (context, index) {
                          return ProductItem(
                            name: controller.carsSearch[index].name,
                            image:controller.carsSearch[index].img,
                            isfav:favViewModel.carIsFav(controller.carsSearch.value[index]),
                            model:controller.carsSearch[index].model,
                            feaut:controller.carsSearch[index].fuelType,
                            location:controller.carsSearch[index].location,
                            km:controller.carsSearch[index].numKiloMeter,
                            speed:controller.carsSearch[index].model,
                            car:controller.carsSearch[index],
                          );
                        },
                        itemCount: controller.carsSearch.length,
                        scrollDirection: Axis.vertical,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: GetX<SearchViewModel>(
                builder:  (contrller) =>
                contrller.getCarSearchProgress.value ? CircularProgressIndicator():Center(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
