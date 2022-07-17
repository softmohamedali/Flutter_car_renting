import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fisrtflutter/core/presentation/screen/home/home_screen.dart';
import 'package:fisrtflutter/utils/mycolors.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  FirebaseFirestore _firestore=FirebaseFirestore.instance;
  Rxn<User?> _user = Rxn<User>();
  String? get user => _user.value?.email;
  auth() => _firebaseAuth.currentUser;


  var isPasswordShow=true.obs;
  var email="";

  var password="";
  var loginProgressisShow=false.obs;
  @override
  void onInit() {
    _user.bindStream(_firebaseAuth.authStateChanges());
  }





  singIn() async{
    loginProgressisShow.value=true;
    if(email.isEmpty||password.isEmpty)
      {
        loginProgressisShow.value=false;
        Get.snackbar(
            "Authentication Sing In Error ",
            "some failed missing",
            colorText: MyColors.black,
            snackPosition: SnackPosition.BOTTOM
        );
        return;
      }
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      Get.off(HomeScreen());
      loginProgressisShow.value=false;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        loginProgressisShow.value=false;
        Get.snackbar(
            "Authentication Sing In Error ",
            e.code,
            colorText: MyColors.black,
            snackPosition: SnackPosition.BOTTOM
        );
      } else if (e.code == 'wrong-password') {
        loginProgressisShow.value=false;
        Get.snackbar(
            "Authentication Sing In Error ",
            e.code,
            colorText: MyColors.black,
            snackPosition: SnackPosition.BOTTOM
        );
      }
    }
  }
}