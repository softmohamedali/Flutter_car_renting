import 'package:fisrtflutter/models/cars.dart';
import 'package:fisrtflutter/ui/screens/body/showcar_screen.dart';
import 'package:fisrtflutter/view_models/FavViewModel.dart';
import 'package:fisrtflutter/view_models/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

import '../../utils/mycolors.dart';

Widget ProductItem({
  required String name,
  required String image,
  required bool isfav,
  required String model,
  required String feaut,
  required String location,
  required String km,
  required String speed,
  required Cars car
}) {

  return GestureDetector(
    onTap: ()
    {
      Get.to(ShowCarScreen(mCars: car));
    },
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Row(
            children: [
              Image(
                image: NetworkImage(image),
                width: 130,
                height: 110,
                fit: BoxFit.fill,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              name,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),GetBuilder<FavViewModel>(
                            builder:(favController) => Container(
                                padding: EdgeInsets.zero,
                                width: 30,
                                height: 30,
                                child: IconButton(
                                    onPressed: () {
                                      if(isfav)
                                        {
                                          favController.deleteFav(car);
                                          isfav=false;
                                        }else{
                                        favController.InsertFavorite(car);
                                        isfav=true;
                                      }
                                    },
                                    icon:isfav ? Icon(Icons.favorite,color: MyColors.blue,) :
                                    Icon(Icons.favorite_border)
                                ),
                              ),
                          ),
                        ],
                      ),
                      Text(model),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        child: Text(
                          km,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: MyColors.blue,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                                feaut,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                          Text(
                            location,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    ),
  );
}