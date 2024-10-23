import 'package:fisrtflutter/models/cars.dart';
import 'package:fisrtflutter/utils/mycolors.dart';
import 'package:fisrtflutter/ui/widget/mywidget.dart';
import 'package:fisrtflutter/view_models/FavViewModel.dart';
import 'package:fisrtflutter/view_models/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
class ShowCarScreen extends StatelessWidget {

  late Cars mCars;
  var favViewModel=Get.find<FavViewModel>();
  var homeViewModel=Get.find<HomeViewModel>();
  var isfav= false;

  ShowCarScreen({
    required this.mCars
}){}


  @override
  Widget build(BuildContext context) {
    isfav= favViewModel.carIsFav(mCars);
    return Scaffold(
        backgroundColor: MyColors.main_background,
      appBar: CustomToolBar(title: "Car Information's",showBack: true),
      body: Column(
        children: [
          Expanded(
            flex: 12,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
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
                                    onPressed: () {
                                      if(isfav)
                                      {
                                        favViewModel.deleteFav(mCars);
                                        isfav=false;
                                      }else{
                                        favViewModel.InsertFavorite(mCars);
                                        isfav=true;
                                      }
                                    },
                                    icon: Icon(
                                      Icons.favorite_border,
                                      color:isfav? MyColors.blue:MyColors.black,
                                      size: 15,
                                    ),
                                  )),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Report",
                                  style: TextStyle(
                                    color: MyColors.text_2,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 8),
                                child: Text(
                                  "Const :",
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
                                  color: MyColors.blue,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            MyCart(title: "Motor Size", icon:"assets/icons/engine.svg", value: mCars.motorSize),
                            MyCart(title: "Hands Num", icon: "assets/icons/fist.svg", value: mCars.numHand),
                            MyCart(title: "Horse Num", icon: "assets/icons/horse.svg", value: mCars.numHorse),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            MyCart(title: "Gear Type", icon: "assets/icons/gear.svg", value: mCars.gerType),
                            MyCart(title: "Color", icon: "assets/icons/colors.svg", value: mCars.color),
                            MyCart(title: "KM Num", icon: "assets/icons/speed.svg", value: mCars.numKiloMeter),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            MyCart(title: "Motor Type", icon: "assets/icons/engine.svg", value: mCars.fuelType),
                            MyCart(title: "Model", icon:"assets/icons/car.svg", value: mCars.model),
                            MyCart(title: "Status Car", icon: "assets/icons/status.svg", value: mCars.carStstus),
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
                            "Location & Licence",
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
                              "Location:   ",
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
                              "Payment Type :   ",
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
                              "Licence:   ",
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
                              "Licence Type:   ",
                              style: TextStyle(
                                color: MyColors.text_2,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              "Data",
                              style: TextStyle(
                                color: MyColors.text_2,
                                  fontWeight: FontWeight.bold
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
                            "Characters",
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
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(10),
                      color: MyColors.red2,
                    ),
                    child: TextButton(
                      onPressed: () {
                        homeViewModel.openWhats(mCars.phone);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Make A Price",
                            style: TextStyle(
                              color: MyColors.white,
                            ),
                          ),
                          SizedBox(width: 10,),
                          Icon(Icons.attach_money,color: MyColors.white,)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(10),
                      color: MyColors.green,
                    ),

                    child: TextButton(
                      onPressed: () {
                        homeViewModel.openphone(mCars.phone);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Call Now",
                            style: TextStyle(
                              color: MyColors.white,
                            ),
                          ),
                          SizedBox(width: 10,),
                          Icon(Icons.phone,color: MyColors.white,)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}

Widget MyCart({
  required String title,
  required String icon,
  required String value,
}) {
  return Expanded(
    child: Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),

            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 90,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color:  MyColors.text_1,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      value,
                      style: TextStyle(
                        color: MyColors.blue,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),

        Positioned(
          top: -20,
          child: Column(
            children: [
              Center(
                child: Image3DWithShadow(
                  imageUrl:icon,
                  width: 60,
                  height: 60,
                    shadowOffset:10
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}



class Image3DWithShadow extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final double shadowOffset;

  const Image3DWithShadow({
    Key? key,
    required this.imageUrl,
    this.width = 200,
    this.height = 200,
    this.shadowOffset = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height + shadowOffset, // Increase container height to accommodate shadow
      child: Stack(
        children: [
          // Shadow
          Positioned(
            bottom: 0,
            left: shadowOffset / 2,
            right: shadowOffset / 2,
            child: Container(
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 15,
                    spreadRadius: 5,
                  ),
                ],
              ),
            ),
          ),
          // 3D Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001) // perspective
                ..rotateX(0.1) // tilt forward
                ..rotateY(-0.1), // tilt sideways
              alignment: FractionalOffset.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SvgPicture.asset(
                  imageUrl,
                  width: width,
                  height: height,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
