import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fisrtflutter/data/firebase_source/FirebaseSource.dart';
import 'package:fisrtflutter/data/remote_source/notificationServices.dart';
import 'package:fisrtflutter/models/cars.dart';
import 'package:fisrtflutter/models/company.dart';
import 'package:fisrtflutter/models/user.dart';
import 'package:fisrtflutter/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SellCarViewModel extends GetxController{
  FirebaseFirestore firestore=FirebaseFirestore.instance;
  FirebaseAuth auth=FirebaseAuth.instance;

  late String img="",numHorse="",numHand="",motorSize="",price="";
  late String numKiloMeter="",carStstus="";
  late String phone="", note="";
  late String? userId=auth.currentUser?.uid.toString();
  late Rxn<File> imymg=Rxn();
  var name="".obs,model="".obs,certificEnd="".obs;
  RxBool paymType=false.obs;
  var gerType="".obs;
  var fuelType="".obs;
  var color="".obs;
  var location="".obs;
  var certificExsit="".obs;
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
      var car=Cars(
          name: name.value, model: model.value, img: img, numHorse: numHorse,
          numHand: numHand, motorSize: motorSize, numKiloMeter: numKiloMeter,
          color: color.value, gerType: gerType.value, carStstus: carStstus,
          fuelType: fuelType.value,paymType: paymType.value.toString(),phone: phone,
          location: location.value,certificExsit: certificExsit.value,
          certificEnd: certificEnd.value,note: note,price: price,userId: userId!);
      if(imymg.value==null)
      {
        Get.snackbar("Error", "please Select Img");
        return;
      }
      car.img=await FirebaseSource().saveImg(imymg.value!);
      await firestore.collection("cars").doc().set(car.toJson())
          .then((value) {
        showSellProgress.value=false;
        _showNotificationNewCar();
      }).catchError((error){
        showSellProgress.value=false;
        Get.snackbar("Error", error);
      });
    }catch(e)
    {
      Get.snackbar("Error", e.toString());
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
    }).catchError((error){
      Get.snackbar("error", error.toString());
    });
  }

  //to get image from stdio
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

  getAllCompny() async{
    showCompnyProgress.value=true;
    compnysSearsh.value=[];
    await firestore.collection("compnyname").get().then((value){
      value.docs.forEach((element) {
        compnysSearsh.add(Company.fromJson(element.data()));
      });
      showCompnyProgress.value=false;
    }).catchError((error) {
      Get.snackbar("error", error.toString());
      showCompnyProgress.value = false;
    });
    update();
  }

  _showNotificationNewCar()
  {
    NotificationService().sendFcm(
      title: "MoAli App News",
      body: "New Car Added You Can cheak It Know In New Cars",
      fcmToken: Constats.TOPIC,
    );
  }
}