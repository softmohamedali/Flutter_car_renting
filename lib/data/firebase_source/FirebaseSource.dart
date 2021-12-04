import 'dart:ffi';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fisrtflutter/models/user.dart';
import 'package:fisrtflutter/utils/constants.dart';

class FirebaseSource{
   FirebaseFirestore firestore=FirebaseFirestore.instance;
   FirebaseStorage storage=FirebaseStorage.instance;
   FirebaseAuth auth=FirebaseAuth.instance;
   saveUserInfo(Userx user)async{
     await firestore.collection("users").doc(user.userId).set(user.toJson());
   }

   Future<String> saveImg(File imgfile)async{
     late String url;
     var ref=storage.ref()
         .child("${auth.currentUser!.uid.toString()}/images/${imgfile.path.codeUnits}");
     var task=await ref.putFile(imgfile);
     url=await task.ref.getDownloadURL();
     return url;
   }

   getCarsByCompany(String compnyName) =>
     firestore.collection(Constats.CARS_COLLECTION).
     where('name', isEqualTo: compnyName);

   getCompanys(String searshKey) =>
       firestore.collection(Constats.COMPNY_COLLECTION)
           .where('name',isEqualTo:searshKey );

   getSearchCars(String name) =>
       firestore.collection(Constats.CARS_COLLECTION)
       .orderBy("name")
       .startAt([name.trim()])
       .endAt([name.trim()+"\uf8ff"]);


//     .orderBy(Constants.PRODUCT_NAME)
//     .startAt(name.trim())
//     .endAt(name.trim())
//     .get()
// .
}