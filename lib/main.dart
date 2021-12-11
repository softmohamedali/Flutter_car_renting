
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fisrtflutter/di/binding.dart';
import 'package:fisrtflutter/ui/layout/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> firebaseMassigingHandler(RemoteMessage massage)async
{

}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var token=await FirebaseMessaging.instance.getToken();
  print( "${token}tooooooooooooooooooooooken");

  FirebaseMessaging.onMessage.listen((event) {
    print( "listennnnnnnnnnnnnnnnnnnnnnnnnn");
  });

  FirebaseMessaging.onMessageOpenedApp.listen((event) {

  });

  FirebaseMessaging.onBackgroundMessage(firebaseMassigingHandler);

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



