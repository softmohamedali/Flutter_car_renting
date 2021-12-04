import 'package:fisrtflutter/ui/widget/mywidget.dart';
import 'package:fisrtflutter/ui/widget/search_company_dialog.dart';
import 'package:fisrtflutter/utils/mycolors.dart';
import 'package:fisrtflutter/utils/mysizes.dart';
import 'package:fisrtflutter/ui/widget/car_item_widget.dart';
import 'package:fisrtflutter/view_models/main_layout_viewmodel.dart';
import 'package:fisrtflutter/view_models/sell_car_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellCarScreen extends GetWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: CustomToolBar(title: "Sell My Car",showBack: false),
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GetX<SellCarViewModel>(
          builder:(controller) => ListView.builder(
              itemBuilder: (context, index) {
                return ProductItem(
                    name:controller.myCarsSels[index].name,
                    image:controller.myCarsSels[index].img,
                    isfav:true,
                    model:controller.myCarsSels[index].location,
                    feaut:"",
                    location:"",
                    km:"",
                    speed:"",
                    car:controller.myCarsSels[index],
                );
              },
            itemCount:controller.myCarsSels.length,
            scrollDirection: Axis.vertical,
          ),
        ),
      ),
    );
  }
}

Widget CustomBottomSheet(
    {
      required GlobalKey<FormState> formkey,
      required BuildContext context
    })
{
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
                            child: mycontroller.imymg.value == null
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
                                    backgroundImage: mycontroller.imymg.value == null
                                        ? null
                                        : FileImage(mycontroller.imymg.value!),
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
                  GetX<SellCarViewModel>(
                    builder:(controller) =>TextFormField(
                      controller:TextEditingController(text: controller.name.value),
                      decoration: InputDecoration(
                        labelText: "companies Name *",
                      ),
                      onChanged: (value) {
                        controller.name.value=value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "this faield require";
                        }
                        return null;
                      },
                      readOnly: true,
                      onTap: (){
                        Get.defaultDialog(
                          title: "Select Company",
                          content: SearchCompanyDialog(
                            context: context,
                            onlogbuttonTap: (){},
                            onregisterbuttonTap: (){},
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "model years *",
                    ),
                    onChanged: (value) {
                      controller.model=value;
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
                      labelText: "horce count *",
                    ),
                    onChanged: (value) {
                      controller.numHorse = value;
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
                      labelText: "hand count *",
                    ),
                    onChanged: (value) {
                      controller.numHand = value;
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
                      labelText: "gearbox type *",
                    ),
                    onChanged: (value) {
                      controller.gerType = value;
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
                      controller.fuelType = value;
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
                      controller.numKiloMeter = value;
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
                      labelText: "motor size *",
                    ),
                    onChanged: (value) {
                      controller.motorSize = value;
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
                      controller.phone = value;
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
                      labelText: "car status *",
                    ),
                    onChanged: (value) {
                      controller.carStstus = value;
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
                      labelText: "location *",
                    ),
                    onChanged: (value) {
                      controller.location = value;
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
                      labelText: "exite Licence *",
                    ),
                    onChanged: (value) {
                      controller.certificExsit = value;
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
                      labelText: "end Licence *",
                    ),
                    onChanged: (value) {
                      controller.certificEnd = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "this faield require";
                      }
                      return null;
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
                    height: 10,
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: "Note *",
                    ),
                    onChanged: (value) {
                      controller.note = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "this faield require";
                      }
                      return null;
                    },
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
                      Switch(value: true, onChanged: (bool) {
                        controller.paymType=bool.toString();
                      }),
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














