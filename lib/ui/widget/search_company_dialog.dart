import 'package:fisrtflutter/utils/mycolors.dart';
import 'package:fisrtflutter/view_models/sell_car_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchCompanyDialog extends GetWidget {
  SearchCompanyDialog({
    required Null Function() onlogbuttonTap,
    required Null Function() onregisterbuttonTap,
    required BuildContext context,
  }){}
  var sellCarViewModel=Get.find<SellCarViewModel>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Row(
              children: [
                Icon(Icons.search),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "company name",
                    ),
                    onChanged: (value){
                      sellCarViewModel.companySearshValue=value;
                      sellCarViewModel.getCompanys();
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.width * 0.5,
            child: GetX<SellCarViewModel>(
              builder:(controller) => ListView.separated(
                  itemBuilder: (context,indexx) => compnyItem(
                      name: controller.compnysSearsh[indexx].name,
                    context: context
                  ),
                  separatorBuilder: (context,indexx) =>SizedBox(height: 10,),
                  itemCount: controller.compnysSearsh.value.length,
              ),
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
  required BuildContext context
}){
  var controller=Get.find<SellCarViewModel>();
  return GestureDetector(
    onTap: (){
      controller.name.value=name;
      Get.back();
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