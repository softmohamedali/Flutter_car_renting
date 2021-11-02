import 'package:fisrtflutter/ui/mycolors.dart';
import 'package:fisrtflutter/ui/screens/account_screen.dart';
import 'package:fisrtflutter/ui/screens/fav_screen.dart';
import 'package:fisrtflutter/ui/screens/home_screen.dart';
import 'package:fisrtflutter/ui/screens/notification_screen.dart';
import 'package:fisrtflutter/ui/screens/sellcar_screen.dart';
import 'package:fisrtflutter/ui/screens/showcar_screen.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  var currentIndex=0;
  var screens=[
    HomeScreen(),
    NotificationScreen(),
    SellCarScreen(),
    FavScreen(),
    ShowCarScreen(),// AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex=index;
          });
        },
        selectedItemColor: MyColors.green,
        unselectedItemColor: MyColors.unactive_icon,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_active_outlined),label: "notification"),
          BottomNavigationBarItem(icon: Icon(Icons.car_repair),label: "sell car"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border),label: "favorit"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "account"),
        ],
      ),
    );
  }
}
