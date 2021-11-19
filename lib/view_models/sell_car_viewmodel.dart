import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fisrtflutter/data/firebase_source/FirebaseSource.dart';
import 'package:fisrtflutter/models/cars.dart';
import 'package:fisrtflutter/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SellCarViewModel extends GetxController{
  late String companyAndModel,city,publicModel,style,gearBoxType,color;
  late String fuleType,km,price,phoneNumber,whatsNumber,previewPlace,prepration;
  late String someNote,installmentAbility;
  late Rxn<File> img=Rxn();
  var showSellProgress=false.obs;
  FirebaseFirestore firestore=FirebaseFirestore.instance;
  FirebaseAuth auth=FirebaseAuth.instance;
  saveCarInfo()async{
    showSellProgress.value=true;
    var car=Cars(
        name: "ffb", model: "publicModel",
        numHorse: "gearBoxType", numHand: "fuleType",
        motorSize: "whatsNumber", numKiloMeter: "km",
        color: "color", gerType: "prepration", carStstus: "prepration",
        motorType: "previewPlace", location: "previewPlace", paymType: "installmentAbility",
        certificType: "someNote", certificEnd: "someNote", phone: "phoneNumber",
        specials: "someNote", img:" ");
    try{

      if(img.value==null)
      {
        Get.snackbar("Error", "please Select Img");
        return;
      }
      car.img=await FirebaseSource().saveImg(img.value!);
    }catch(e)
    {
      Get.snackbar("Error", e.toString());
      print(e.toString()+"mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
    }
    await firestore.collection("cars").doc(auth.currentUser!.uid.toString()).set(car.toJson())
    .then((value) {
      showSellProgress.value=false;
    }).catchError((error){
      showSellProgress.value=false;
      Get.snackbar("Error", error);
    });
  }

  void getImg() async{
    var myImg=await ImagePicker().pickImage(source: ImageSource.gallery);
    img.value=File(myImg!.path);
  }
}