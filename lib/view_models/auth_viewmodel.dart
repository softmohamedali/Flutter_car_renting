import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fisrtflutter/data/firebase_source/FirebaseSource.dart';
import 'package:fisrtflutter/models/cars.dart';
import 'package:fisrtflutter/models/user.dart';
import 'package:fisrtflutter/ui/layout/main_layout.dart';
import 'package:fisrtflutter/utils/mycolors.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController{
  GoogleSignIn _googleSignIn=GoogleSignIn(scopes: ["email"]);
  FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  FirebaseFirestore _firestore=FirebaseFirestore.instance;
  Rxn<User?> _user = Rxn<User>();
  String? get user => _user.value?.email;
  var showLoginProgrees=false.obs;
  var showRegisterProgrees=false.obs;


  late String email,password,name,phone;

  @override
  void onInit() {
    _user.bindStream(_firebaseAuth.authStateChanges());
  }

  @override
  void onClose() {

  }

  @override
  void onReady() {

  }

  auth() => _firebaseAuth.currentUser;

  void singIn() async{
    showLoginProgrees.value=true;
    try{
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      showLoginProgrees.value=false;
      Get.back();
    }catch(e){
      showLoginProgrees.value=false;
      Get.snackbar(
          "Authentication Sing In Error ",
          e.toString(),
        colorText: MyColors.black,
        snackPosition: SnackPosition.BOTTOM
      );
    }
  }

  void register() async{
    showLoginProgrees.value=true;
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password
      ).then((value) => {
        saveUserInfo(value)

      });
      showLoginProgrees.value=false;
    }catch(e){
      showLoginProgrees.value=false;
      Get.snackbar(
          "Register Error ",
          e.toString(),
          colorText: MyColors.black,
          snackPosition: SnackPosition.BOTTOM
      );
    }
  }

  saveUserInfo(UserCredential user)
  {
    FirebaseSource().saveUserInfo(
        Userx(
            userId: user.user!.uid,
            name: name,
            email: user.user!.email,
            userPhone: phone
        )
    );
  }

  void logout() => _firebaseAuth.signOut();

}





















































// void googleSingIn()async{
//   final GoogleSignInAccount? googleUser=await _googleSignIn.signIn();
//   var googleSingInAuth=await googleUser!.authentication;
//   final credintial=GoogleAuthProvider.credential(
//     idToken:googleSingInAuth.idToken ,
//     accessToken:googleSingInAuth.accessToken ,
//   );
//
//   await _firebaseAuth.signInWithCredential(credintial).then((value) => {
//   saveUserInfo(value)
//   });
// }
