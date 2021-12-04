import 'package:fisrtflutter/ui/screens/body/all_cars_screen.dart';
import 'package:fisrtflutter/ui/screens/body/companys_screen.dart';
import 'package:fisrtflutter/ui/screens/body/search_screen.dart';
import 'package:fisrtflutter/ui/screens/body/whoweare_screen.dart';
import 'package:fisrtflutter/utils/mycolors.dart';
import 'package:fisrtflutter/ui/widget/car_catigory_wiidget.dart';
import 'package:fisrtflutter/ui/widget/car_item_widget.dart';
import 'package:fisrtflutter/ui/widget/see_all_button.dart';
import 'package:fisrtflutter/view_models/FavViewModel.dart';
import 'package:fisrtflutter/view_models/auth_viewmodel.dart';
import 'package:fisrtflutter/view_models/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../auth/login_screen.dart';
import 'Legacy_Privacy_Screen.dart';
import 'contact_withus_screen.dart';
import 'language_screen.dart';

class HomeScreen extends GetWidget{
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var showbottom = false;
  var exController=Get.find<FavViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: MyColors.main_background,
      appBar: AppBar(
        iconTheme: IconThemeData(color: MyColors.green),
        backgroundColor: MyColors.main_background,
        elevation: 0,
        title: GestureDetector(
          onTap: (){
            Get.to(SearchScreen());
          },
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: MyColors.white,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: MyColors.black,
                ),
                Text(
                  "Click to searsh about car",
                  style: TextStyle(
                    color: MyColors.black,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 10,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Famous companies",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SeeAllButton("See all",CompanysScreen())
              ],
            ),
            GetBuilder<HomeViewModel>(
              builder:(controller) {
                return Container(
                  height:110,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return CatigoryItem(
                          controller.companys[index].name,
                          controller.companys[index].img
                      );
                    },
                    itemCount:controller.companys.length,
                    scrollDirection: Axis.horizontal,
                  ),
                );
              }
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Last cars",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SeeAllButton("See all",AllCarsScreen())
              ],
            ),
            Expanded(
              child: Container(
                child: GetX<HomeViewModel>(
                  builder:(controller) => ListView.builder(
                    itemBuilder: (context, index) {
                      return ProductItem(
                          name: controller.homeCars[index].name,
                          image:controller.homeCars[index].img,
                          isfav:exController.carIsFav(controller.homeCars.value[index]),
                          model:controller.homeCars[index].model,
                          feaut:controller.homeCars[index].fuelType,
                          location:controller.homeCars[index].location,
                          km:controller.homeCars[index].numKiloMeter,
                          speed:controller.homeCars[index].model,
                          car:controller.homeCars[index],
                      );
                    },
                    itemCount: controller.homeCars.length,
                    scrollDirection: Axis.vertical,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Material(
          color: MyColors.main_background,
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: ListView(
              children: [
                DrawerItem(
                  icon: Icons.home_filled,
                  title: "Home",
                  onTab: () {

                  },
                ),
                DrawerItem(
                  icon: Icons.ten_k_sharp,
                  title: "who we are",
                  onTab: () {
                    Get.to(WhoWeAreScreen());
                  },
                ),
                DrawerItem(
                  icon: Icons.lock,
                  title: "legacy privacy",
                  onTab: () {
                    Get.to(LegacyPrivacyScreen());
                  },
                ),
                DrawerItem(
                  icon: Icons.question_answer_outlined,
                  title: "contact with us",
                  onTab: () {
                    Get.to(ContactWithUsScreen());
                  },
                ),
                DrawerItem(
                  icon: Icons.language,
                  title: "languase",
                  onTab: () {
                    Get.to(LanguageScreen());
                  },
                ),
                GetBuilder<AuthViewModel>(
                  builder:(controller) => TextButton(
                    onPressed: () {
                      if(controller.auth()==null)
                      {
                        Get.to(LoginScreen());
                      }
                      else{
                        controller.logout();
                      }
                    },
                    child: Text(
                      controller.auth()==null ?"Log in" : "log out",
                      style: TextStyle(color: MyColors.green,fontWeight: FontWeight.w900,
                          fontSize: 25,fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}


DrawerItem(
    {required IconData icon,
      required String title,
      required Function() onTab}) {
  return ListTile(
    leading: Icon(
      icon,
      color: MyColors.green,
    ),
    title: Text(
      title,
      style: TextStyle(color: MyColors.green),
    ),
    onTap: onTab,
  );
}