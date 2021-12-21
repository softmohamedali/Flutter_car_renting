import 'dart:ffi';

import 'package:fisrtflutter/utils/mycolors.dart';
import 'package:fisrtflutter/view_models/sell_car_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class DialogSelectItem extends GetWidget {
  List<String> list;
  Null Function(String) onItemClick;
  DialogSelectItem({
    required BuildContext context,
    required this.list,
    required this.onItemClick
  }){}
  var sellCarViewModel=Get.find<SellCarViewModel>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.width * 0.5,
            child: ListView.separated(
                itemBuilder: (context,indexx) => compnyItem(
                    name: list[indexx],
                    context: context,
                  onItemClick: onItemClick
                ),
                separatorBuilder: (context,indexx) =>SizedBox(height: 10,),
                itemCount: list.length,
              ),
          ),
          Container(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("cancle"),
            ),
          )
        ],
      ),
    );
  }
}

compnyItem({
  required String name,
  required BuildContext context,
  required Null Function(String) onItemClick
}){
  return GestureDetector(
    onTap: (){
      onItemClick(name);
    },
    child: Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: 1,
          color: MyColors.black,
          child: null,
        )
      ],
    ),
  );
}