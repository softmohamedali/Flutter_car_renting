
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fisrtflutter/core/presentation/screen/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/binding/binding.dart';
import 'core/presentation/screen/home/home_screen.dart';
import 'core/presentation/screen/login/login_screen.dart';



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

    return GetMaterialApp(
      initialBinding: TaskBinding(),
      debugShowCheckedModeBanner: false,
      home:HomeScreen(),
    );
  }

}



