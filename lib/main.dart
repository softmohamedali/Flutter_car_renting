
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fisrtflutter/di/binding.dart';
import 'package:fisrtflutter/models/notification.dart';
import 'package:fisrtflutter/ui/layout/main_layout.dart';
import 'package:fisrtflutter/ui/screens/body/fav_screen.dart';
import 'package:fisrtflutter/ui/style/theme.dart';
import 'package:fisrtflutter/view_models/FavViewModel.dart';
import 'package:fisrtflutter/view_models/notificationviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'models/cars.dart';



void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage((mass)async{
    print("onbackgraound massage handelereeeeeeeeeeeeeeeeeeeee");
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    var vm=Get.put(NotificationViewModel());
    var fcm=FirebaseMessaging.instance;
    fcm.subscribeToTopic("myTopic");
    FirebaseMessaging.onMessage.listen((event)async {
      await vm.InsertNoti(MyNotification(title: "title",body: "booody"));
      print("=============================================");
      print("onmassage");
      print("=============================================");
    });

    FirebaseMessaging.onMessageOpenedApp.listen((event)async {
      await vm.InsertNoti(MyNotification(title: "title",body: "booody"));
      print("=============================================");
      print("onmassage");
      print("=============================================");
    });

    FirebaseMessaging.onBackgroundMessage((massage)async{
      await vm.InsertNoti(MyNotification(title: "title",body: "booody"));
      print("=============================================");
      print("onmassage");
      print("=============================================");
    });
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      darkTheme: MyTheme.dark,
      theme: MyTheme.light,
      home:MainLayout(),
    );
  }

}



