import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fisrtflutter/data/firebase_source/FirebaseSource.dart';
import 'package:fisrtflutter/data/local_source/cars_database.dart';
import 'package:fisrtflutter/models/cars.dart';
import 'package:fisrtflutter/models/company.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeViewModel extends GetxController{
  var firestore=FirebaseFirestore.instance;
  var companys=<Company>[];
  var allCars=<Cars>[].obs;
  var homeCars=<Cars>[].obs;
  var favCars=<Cars>[].obs;
  var getFavProgress=false.obs;
  var getAllCarProgress=false.obs;
  HomeViewModel()
  {
    getCompny();
    getCars();
    getAllCars();
    getFavorite();

  }


  getAllCars()async{
    getAllCarProgress.value=true;
    await firestore.collection("cars").get().then((value) {
      value.docs.forEach((element) {
        allCars.add(Cars.fromJson(element.data()));
      });
      getAllCarProgress.value=false;
    }).catchError((onError){
      Get.snackbar("error", onError);
      getAllCarProgress.value=false;
    });
  }

  getCars()async{
    await firestore.collection("cars").limit(15).get().then((value) {
      value.docs.forEach((element) {
        homeCars.add(Cars.fromJson(element.data()));
      });

    }).catchError((onError){
      Get.snackbar("error", onError);
    });
  }

  getCompny() async{
    await firestore.collection("compnyname").get().then((value){
      value.docs.forEach((element) {
        companys.add(Company.fromJson(element.data()));
      });
    });
    update();
  }

  InsertFavorite(Cars car)async{
    var db=CarsDataBase.db;
    await db.insertCArs(car);
  }

  getFavorite()async{
    getFavProgress.value=true;
    var db=CarsDataBase.db;
    await db.getAllCars().then((cars){
      favCars.value=cars;
      getFavProgress.value=false;
    }).catchError((error){
      Get.snackbar("error", error);
      getFavProgress.value=false;
    });
  }

  openWhats(String num)async{
    await launch("https://wa.me/002${num}?text=hi i come from moali app");
  }
  openphone(String num)async{
    await launch("tel:${num}");
  }
}