import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fisrtflutter/ui/screens/body/account_screen.dart';
import 'package:fisrtflutter/ui/screens/body/fav_screen.dart';
import 'package:fisrtflutter/ui/screens/body/home_screen.dart';
import 'package:fisrtflutter/ui/screens/body/notification_screen.dart';
import 'package:fisrtflutter/ui/screens/auth/register_screen.dart';
import 'package:fisrtflutter/ui/screens/body/sellcar_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'package:get/get_state_manager/get_state_manager.dart';

class MainLayoutViewModel extends GetxController {
  // navigation
  var _currentIndex = 0;
  FirebaseAuth firebaseAuth=FirebaseAuth.instance;

  auth() => firebaseAuth.currentUser;

  get currentIndex => _currentIndex;



  var screens = [
    HomeScreen(),
    NotificationScreen(),
    SellCarScreen(),
    FavScreen(),
  ];
  void logout() => firebaseAuth.signOut();
  void onChangeIndex(index) {
    _currentIndex = index;
    update();
  }

  //show sell car bottom sheet
  var sellBottomIsShow=false.obs;
  var bottomFabIcon=Icons.add.obs;
  bottomSheetClicked()
  {
    if(sellBottomIsShow.value)
      {
        sellBottomIsShow.value=false;
        bottomFabIcon.value=Icons.add;
      }else{
      sellBottomIsShow.value=true;
      bottomFabIcon.value=Icons.close;
    }
  }


}
