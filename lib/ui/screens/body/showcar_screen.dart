import 'package:fisrtflutter/models/cars.dart';
import 'package:fisrtflutter/utils/mycolors.dart';
import 'package:fisrtflutter/ui/widget/mywidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowCarScreen extends StatelessWidget {

  late Cars mCars;

  ShowCarScreen({
    required this.mCars
}){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomToolBar(title: "car",showBack: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(
                    children: [
                      Image(
                          width: double.infinity,
                          height: 180,
                          fit: BoxFit.fill,
                          image: NetworkImage(mCars.img)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: EdgeInsets.all(0),
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(242),
                                    color: MyColors.white,
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.share,
                                    color: MyColors.black,
                                    size: 15,
                                  ),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 0,top: 8,bottom: 8,right: 8),
                            child: Container(
                              width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(422),
                                  color: MyColors.white,
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.favorite_border,
                                    color: MyColors.black,
                                    size: 15,
                                  ),
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "report",
                        style: TextStyle(
                          color: MyColors.text_2,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 8),
                      child: Text(
                        "const",
                        style: TextStyle(
                          color: MyColors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      mCars.price,
                      style: TextStyle(
                        color: MyColors.green,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  MyCart(title: "motor size", icon: Icons.horizontal_split, value: mCars.motorSize),
                  MyCart(title: "hand num", icon: Icons.handyman, value: mCars.numHand),
                  MyCart(title: "hourse num", icon: Icons.home_repair_service_outlined, value: mCars.numHorse),
                ],
              ),
              Row(
                children: [
                  MyCart(title: "gear type", icon: Icons.home_repair_service_outlined, value: mCars.gerType),
                  MyCart(title: "color", icon: Icons.home_repair_service_outlined, value: mCars.color),
                  MyCart(title: "km num", icon: Icons.home_repair_service_outlined, value: mCars.numKiloMeter),
                ],
              ),
              Row(
                children: [
                  MyCart(title: "motor type", icon: Icons.home_repair_service_outlined, value: mCars.fuelType),
                  MyCart(title: "model", icon: Icons.home_repair_service_outlined, value: mCars.model),
                  MyCart(title: "status car", icon: Icons.home_repair_service_outlined, value: mCars.carStstus),
                ],
              ),
              SizedBox(height: 4,),
              Container(
                width: double.infinity,
                height: 0.3,
                color: MyColors.black,
              ),
              SizedBox(height: 8,),
              Container(
                width: double.infinity,
                child: Text(
                  "Location and Licence",
                  style: TextStyle(
                    color: MyColors.text_1,
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(height: 4,),
              Row(
                children: [
                  Text(
                    "location:   ",
                    style: TextStyle(
                      color: MyColors.text_1,
                    ),
                  ),
                  Text(
                    mCars.location,
                    style: TextStyle(
                      color: MyColors.text_1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4,),
              Row(
                children: [
                  Text(
                    "payment type :   ",
                    style: TextStyle(
                      color: MyColors.text_1,
                    ),
                  ),
                  Text(
                    mCars.paymType,
                    style: TextStyle(
                      color: MyColors.text_1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4,),
              Row(
                children: [
                  Text(
                    "lecence:   ",
                    style: TextStyle(
                      color: MyColors.text_1,
                    ),
                  ),
                  Text(
                    mCars.paymType,
                    style: TextStyle(
                      color: MyColors.text_1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4,),
              Row(
                children: [
                  Text(
                    "lecence type:   ",
                    style: TextStyle(
                      color: MyColors.text_2,
                      fontWeight: FontWeight.w200
                    ),
                  ),
                  Text(
                    "data",
                    style: TextStyle(
                      color: MyColors.text_2,
                        fontWeight: FontWeight.w200
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8,),
              Container(
                width: double.infinity,
                height: 0.3,
                color: MyColors.black,
              ),
              SizedBox(height: 8,),
              Container(
                width: double.infinity,
                child: Text(
                  "Charachters",
                  style: TextStyle(
                      color: MyColors.text_1,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(height: 45,),
            ],
          ),
        ),
      )
    );
  }
}

Widget MyCart({
  required String title,
  required IconData icon,
  required String value,
})
{
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: MyColors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  color:MyColors.black ,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 5,),
              Icon(
                icon,
                color: MyColors.green,
                size: 50,
              ),
              SizedBox(height: 5,),
              Text(
                value,
                style: TextStyle(
                  color:MyColors.black ,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
