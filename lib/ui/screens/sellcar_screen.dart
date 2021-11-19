import 'package:fisrtflutter/ui/mycolors.dart';
import 'package:fisrtflutter/ui/mysizes.dart';
import 'package:fisrtflutter/ui/widget/search_company_dialog.dart';
import 'package:fisrtflutter/utils/main_layout_state.dart';
import 'package:fisrtflutter/view_models/main_layout_viewmodel.dart';
import 'package:fisrtflutter/view_models/sell_car_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SellCarScreen extends GetWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var textControoler = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('sell car'),
      ),
      floatingActionButton: GetX<MainLayoutViewModel>(
        builder: (controller) => FloatingActionButton(
          onPressed: () {
            if (controller.sellBottomIsShow.value) {
              Get.back();
              controller.bottomSheetClicked();
            } else {
              scaffoldKey.currentState!.showBottomSheet((context) {
                return CustomBottomSheet(formkey: formKey, context: context);
              });
              controller.bottomSheetClicked();
            }
          },
          child: Icon(controller.bottomFabIcon.value),
        ),
      ),
    );
  }
}

Widget CustomBottomSheet(
    {required GlobalKey<FormState> formkey, required BuildContext context}) {
  var controller = Get.find<SellCarViewModel>();
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Stack(
      children: [
        Container(
          color: MyColors.main_background,
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    child: Text(
                      "Add Image",
                      style: TextStyle(
                        color: MyColors.black,
                        fontSize: MySizes.text_size_veryLarg,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.getImg();
                    },
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        GetX<SellCarViewModel>(
                          builder: (mycontroller) => Container(
                            width: 100,
                            height: 100,
                            child: mycontroller.img.value == null
                                ? Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(110),
                                      color: MyColors.green,
                                    ),
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                      "select Image",
                                      style: TextStyle(color: MyColors.white),
                                    ),
                                  )
                                : CircleAvatar(
                                    backgroundImage: mycontroller.img.value == null
                                        ? null
                                        : FileImage(mycontroller.img.value!),
                                  ),
                          ),
                        ),
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
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    readOnly: true,
                    onTap: () {
                      Get.defaultDialog(
                        content: MyDialogLogIn(
                            OnregisterbuttonTap: () {},
                            OnlogbuttonTap: () {},
                            context: context),
                      );
                    },
                    decoration: InputDecoration(
                      labelText: "companies and models *",
                    ),
                    onChanged: (value) {
                      // controller.companyAndModel = value;
                    },
                    validator: (value) {
                      // if (value!.isEmpty) {
                      //   return "this faield require";
                      // }
                      // return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "city *",
                    ),
                    onChanged: (value) {
                      controller.city = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "this faield require";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "public model *",
                    ),
                    onChanged: (value) {
                      controller.publicModel = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "this faield require";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "style",
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "gearbox type *",
                    ),
                    onChanged: (value) {
                      controller.gearBoxType = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "this faield require";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "color *",
                    ),
                    onChanged: (value) {
                      controller.color = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "this faield require";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "fuel type ",
                    ),
                    onChanged: (value) {
                      controller.fuleType = value;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "km *",
                    ),
                    onChanged: (value) {
                      controller.km = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "this faield require";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "price *",
                    ),
                    onChanged: (value) {
                      controller.price = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "this faield require";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "phone number *",
                    ),
                    onChanged: (value) {
                      controller.phoneNumber = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "this faield require";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "whatsapp number ",
                    ),
                    onChanged: (value) {
                      controller.whatsNumber = value;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "preview place ",
                    ),
                    onChanged: (value) {
                      controller.previewPlace = value;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "preperation ",
                    ),
                    onChanged: (value) {
                      controller.prepration = value;
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "some note about car status (new , old ,good status ,......)",
                    style: TextStyle(
                      color: MyColors.text_2,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: double.infinity,
                    height: 0.3,
                    color: MyColors.black,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text(
                        "installment ability",
                        style: TextStyle(
                          color: MyColors.text_1,
                          fontSize: MySizes.text_size_medium,
                        ),
                      ),
                      Switch(value: true, onChanged: (bool) {}),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      "full the field that contain * first",
                      style: TextStyle(
                        color: MyColors.red,
                        fontSize: MySizes.text_size_medium,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    color: MyColors.green,
                    child: TextButton(
                      onPressed: () {
                        formkey.currentState!.save();
                        if (formkey.currentState!.validate()) {
                          controller.saveCarInfo();
                        }
                      },
                      child: Text(
                        "sell my car",
                        style: TextStyle(
                          color: MyColors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
        Center(
          child: GetX<SellCarViewModel>(
            builder:  (mcontrller) =>
            mcontrller.showSellProgress.value ? CircularProgressIndicator():Center(),
          ),
        ),
      ],
    ),

  );
}

MyDialogLogIn(
    {required Null Function() OnlogbuttonTap,
    required Null Function() OnregisterbuttonTap,
    required BuildContext context}) {
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
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.width * 0.7,
          child: ListView(),
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
