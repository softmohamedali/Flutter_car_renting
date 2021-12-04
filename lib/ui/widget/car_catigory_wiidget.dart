import 'package:fisrtflutter/ui/screens/body/cars_by_company_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../utils/mycolors.dart';

Widget CatigoryItem(String name, String image) {
  return GestureDetector(
    onTap: (){
      Get.to(CarByCompanyScreen(company: name));
    },
    child: Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: MyColors.white,
            ),
            width: 90,
            height:90,
            child: Column(
              children: [
                Image(
                  image: NetworkImage(
                      image),
                  width: 60,
                  height: 60,
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}