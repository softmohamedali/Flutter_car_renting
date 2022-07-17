
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fisrtflutter/core/presentation/screen/cart/cart_screen.dart';
import 'package:fisrtflutter/core/presentation/screen/login/login_screen.dart';
import 'package:fisrtflutter/core/presentation/screen/product/product_screen.dart';
import 'package:get/get.dart';

class HomeControler extends GetxController{
  FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  FirebaseFirestore _firestore=FirebaseFirestore.instance;
  auth() => _firebaseAuth.currentUser;

  var currentScreen=0.obs;
  var screenList=[
    ProductScreen(),
    CartScreen()
  ];

  var screenTitleList=[
    "Products",
    "Cart"
  ];




  @override
  void onReady() {
    print(auth()==null);
    if(auth()==null){
      Get.off(LoginScreen());
    }
  }

  onTapBottomNav(int screenNum){
    currentScreen.value=screenNum;
  }






}