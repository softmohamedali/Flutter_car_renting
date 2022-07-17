import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fisrtflutter/core/presentation/screen/home/home_screen.dart';
import 'package:fisrtflutter/core/presentation/screen/login/login_screen.dart';
import 'package:fisrtflutter/utils/mycolors.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController{

  var isPasswordShow=true.obs;
  var email="";
  var password="";
  var phone="";
  var name="";
  var confirmPassword="";
  var registerProgressisShow=false.obs;

  register(){
    registerProgressisShow.value=true;
    try{
      Get.to(LoginScreen());
    }catch(e){
      registerProgressisShow.value=true;
    }
  }


}