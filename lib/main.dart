import 'package:firebase_core/firebase_core.dart';
import 'package:fisrtflutter/di/binding.dart';
import 'package:fisrtflutter/ui/layout/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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



