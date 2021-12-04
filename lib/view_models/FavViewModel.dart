import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fisrtflutter/data/local_source/cars_database.dart';
import 'package:fisrtflutter/models/cars.dart';
import 'package:fisrtflutter/models/company.dart';
import 'package:get/get.dart';

class FavViewModel extends GetxController{

  var favCars=<Cars>[].obs;
  // var favLength= favCars.value.length;
  var getFavProgress=false.obs;
  FavViewModel()
  {
    getFavorite();
  }
  InsertFavorite(Cars car)async{
    var db=CarsDataBase.db;
    await db.insertCArs(car);
    update();
    getFavorite();
    print("fav cars num ---------- ${favCars.value.length}");
  }

  deleteFav(Cars car) async{
    var db=CarsDataBase.db;
    await db.delelteFav(car);
    getFavorite();
    update();
  }

  bool carIsFav(Cars car)
  {
    var isFav=false;
    favCars.value.forEach((element) {
      if(element.name==car.name)
        {
          isFav= true;
        }
    });
    return isFav;
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
}