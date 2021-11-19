import 'package:fisrtflutter/ui/mycolors.dart';
import 'package:fisrtflutter/ui/widget/mywidget.dart';
import 'package:fisrtflutter/utils/resultState.dart';
import 'package:fisrtflutter/view_models/auth_viewmodel.dart';
import 'package:fisrtflutter/view_models/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'login_screen.dart';

class HomeScreen extends GetWidget{
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var showbottom = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: MyColors.main_background,
      appBar: AppBar(
        iconTheme: IconThemeData(color: MyColors.green),
        backgroundColor: MyColors.main_background,
        elevation: 0,
        title: Container(
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
                SeeAllButton("See all")
              ],
            ),
            GetBuilder<HomeViewModel>(
              builder:(controller) {
                return Container(
                  height: 90,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return CatigoryItem(
                          controller.companys[index].name,
                          ""
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
                SeeAllButton("See all")
              ],
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ProductItem(
                        "car", "", true, "", "", "", "", "");
                  },
                  itemCount: 10,
                  scrollDirection: Axis.vertical,
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
                  onTab: () {},
                ),
                DrawerItem(
                  icon: Icons.lock,
                  title: "legacy privacy",
                  onTab: () {},
                ),
                DrawerItem(
                  icon: Icons.question_answer_outlined,
                  title: "contact with us",
                  onTab: () {},
                ),
                DrawerItem(
                  icon: Icons.language,
                  title: "languase",
                  onTab: () {},
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

  Widget SeeAllButton(String text) {
    return OutlinedButton.icon(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        side: BorderSide(width: 1.0, color: MyColors.green),
        padding: EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 10,
        ),
        minimumSize: Size(50, 23),
      ),
      icon: Icon(
        Icons.navigate_next,
        color: MyColors.green,
        size: 18,
      ),
      label: Padding(
        padding: EdgeInsets.all(0),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: MyColors.green,
          ),
        ),
      ),
    );
  }

  Widget CatigoryItem(String name, String image) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: MyColors.white,
          ),
          width: 90,
          height: 90,
          child: Column(
            children: [
              Image(
                image: NetworkImage(
                    "https://cdn.mosoah.com/wp-content/uploads/2019/11/23153530/%D8%B5%D9%88%D8%B1-%D8%B4%D8%B9%D8%A7%D8%B1-%D9%83%D9%8A%D8%A7-%D8%AC%D8%AF%D9%8A%D8%AF%D8%A9-2-825x500.png"),
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
        SizedBox(
          width: 10,
        )
      ],
    );
  }

  Widget ProductItem(String name, String image, bool isfav, String model,
      String feaut, String location, String km, String speed) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Row(
            children: [
              Image(
                image: NetworkImage(
                    "https://auto-drives.com/wp-content/uploads/2021/03/2022-bmw-i4-1.jpg"),
                width: 130,
                height: 110,
                fit: BoxFit.fill,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "data",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.zero,
                            width: 30,
                            height: 30,
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.favorite_border)),
                          ),
                        ],
                      ),
                      Text("model"),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        child: Text(
                          "6000m",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: MyColors.green,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            "data",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          )),
                          Text(
                            "data",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
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
