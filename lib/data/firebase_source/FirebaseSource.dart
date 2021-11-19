import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fisrtflutter/models/user.dart';

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
}