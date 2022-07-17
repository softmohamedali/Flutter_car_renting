import 'package:fisrtflutter/core/controllers/home_controller.dart';
import 'package:fisrtflutter/utils/mycolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetWidget<HomeControler>{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeController=Get.find<HomeControler>();

    return Container(
      child:GetX<HomeControler>(
        builder: (controller){
          return  Scaffold(
            appBar:AppBar(title:Text(homeController.screenTitleList[homeController.currentScreen.value]),),
            bottomNavigationBar:  BottomNavigationBar(
              currentIndex: homeController.currentScreen.value,
              onTap: (index) {
                homeController.onTapBottomNav(index);
              },
              selectedItemColor: MyColors.blue,
              unselectedItemColor: MyColors.unactive_icon,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled), label: "products"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border), label: "carts"),
              ],
            ),
            body: homeController.screenList[homeController.currentScreen.value],
          );
        },
      ),
    );
  }
}
