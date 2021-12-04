import 'package:fisrtflutter/utils/mycolors.dart';
import 'package:fisrtflutter/ui/screens/auth/login_screen.dart';
import 'package:fisrtflutter/ui/screens/auth/register_screen.dart';
import 'package:fisrtflutter/view_models/main_layout_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MainLayout extends StatelessWidget {
  GlobalKey myKey=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainLayoutViewModel>(
        builder: (controller) => Scaffold(
          key: myKey,
              body: controller.screens[controller.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: controller.currentIndex,
                onTap: (index) {
                  if (index == 1 || index == 2 || index == 3 || index == 4) {
                    if (controller.auth() == null) {
                      Get.defaultDialog(
                        title: "you need to log in !",
                        content: MyDialogLogIn(
                          OnlogbuttonTap:(){
                            Get.to(LoginScreen());
                          },
                          OnregisterbuttonTap:(){
                            Get.to(RegisterScreen());
                          },
                        ),
                      );
                    } else {
                      controller.onChangeIndex(index);
                    }
                  } else {
                    controller.onChangeIndex(index);
                  }
                },
                selectedItemColor: MyColors.green,
                unselectedItemColor: MyColors.unactive_icon,
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_filled), label: "home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.notifications_active_outlined),
                      label: "notification"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.car_repair), label: "sell car"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite_border), label: "favorit"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: "account"),
                ],
              ),

            ));
  }
}

MyDialogLogIn({
  required Null Function() OnlogbuttonTap,
  required Null Function() OnregisterbuttonTap
}) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
      children: [
        Container(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: OnlogbuttonTap,
            child:Text("Log In",style: TextStyle(
                color: MyColors.white
            ),),
          ),
        ),
        Container(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(

            ),
            onPressed: OnregisterbuttonTap,
            child:Text("register",style: TextStyle(
                color: MyColors.white
            ),),
          ),
        )
      ],
    ),
  );
}



