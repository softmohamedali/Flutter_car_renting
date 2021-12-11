import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fisrtflutter/data/firebase_source/FirebaseSource.dart';
import 'package:fisrtflutter/models/cars.dart';
import 'package:fisrtflutter/models/company.dart';
import 'package:fisrtflutter/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SellCarViewModel extends GetxController{
  FirebaseFirestore firestore=FirebaseFirestore.instance;
  FirebaseAuth auth=FirebaseAuth.instance;

  late String model="",img="",numHorse="",numHand="",motorSize="",price="";
  late String numKiloMeter="",color="",gerType="",carStstus="",fuelType="";
  late String location="",paymType="",certificExsit="",certificEnd="",phone="", note="";
  late String? userId=auth.currentUser?.uid.toString();
  late Rxn<File> imymg=Rxn();
  var name="".obs;


  var showSellProgress=false.obs;
  var showCompnyProgress=false.obs;
  var myCarsSels=<Cars>[].obs;
  var compnysSearsh=<Company>[].obs;
  var companySearshValue="";
  SellCarViewModel(){
    getMySells();
    getCompanys();
  }
  saveCarInfo()async{
    try{
      showSellProgress.value=true;
      var car=Cars(name: name.value, model: model, img: img, numHorse: numHorse,
          numHand: numHand, motorSize: motorSize, numKiloMeter: numKiloMeter,
          color: color, gerType: gerType, carStstus: carStstus, fuelType: fuelType,
          location: location, paymType: paymType, certificExsit: certificExsit,
          certificEnd: certificEnd, phone: phone, note: note,price: price,userId: userId!);
      if(imymg.value==null)
      {
        Get.snackbar("Error", "please Select Img");
        return;
      }
      car.img=await FirebaseSource().saveImg(imymg.value!);
      await firestore.collection("cars").doc().set(car.toJson())
          .then((value) {
        showSellProgress.value=false;
      }).catchError((error){
        showSellProgress.value=false;
        Get.snackbar("Error", error);
      });
    }catch(e)
    {
      Get.snackbar("Error", e.toString());
      print(e.toString()+"mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
    }

  }

  getMySells()async
  {
    await firestore.collection("cars").where("userId",isEqualTo: userId).get()
        .then((value)
    {
      value.docs.forEach((element) {
        myCarsSels.add(Cars.fromJson(element.data()));
      });
      print(",mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm${myCarsSels.length}");
    }).catchError((error){
      Get.snackbar("error", error.toString());
    });
  }

  void getImg() async{
    var myImg=await ImagePicker().pickImage(source: ImageSource.gallery);
    imymg.value=File(myImg!.path);
  }

  getCompanys()async
  {
    showCompnyProgress.value=true;
    compnysSearsh.value=[];
    await FirebaseSource().getCompanys(companySearshValue).get().then((querysnap){
      querysnap.docs.forEach((element) {
        compnysSearsh.add(Company.fromJson(element.data()));
      });
      showCompnyProgress.value=false;
    }).catchError((error){
      Get.snackbar("error", error.toString());
      showCompnyProgress.value=false;
    });
  }
}