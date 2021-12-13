
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fisrtflutter/di/binding.dart';
import 'package:fisrtflutter/models/notification.dart';
import 'package:fisrtflutter/ui/layout/main_layout.dart';
import 'package:fisrtflutter/view_models/notificationviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Future<void> firebaseMassigingHandler(RemoteMessage massage)async
// {
//   var vm=Get.find<NotificationViewModel>();
//   vm.InsertNoti(MyNotification(title: "title", body: "body"));
//
// }

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // var fcm=FirebaseMessaging.instance;
  // fcm.subscribeToTopic("myTopic");
  // FirebaseMessaging.onMessage.listen((event) {
  //   var vm=Get.find<NotificationViewModel>();
  //   vm.InsertNoti(MyNotification(title: "title", body: "body"));
  // });
  //
  // FirebaseMessaging.onMessageOpenedApp.listen((event) {
  //   var vm=Get.find<NotificationViewModel>();
  //   vm.InsertNoti(MyNotification(title: "title", body: "body"));
  // });
  //
  // FirebaseMessaging.onBackgroundMessage(firebaseMassigingHandler);

  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      home:MainLayout(),
    );
  }

}



