import 'package:fisrtflutter/data/local_source/cars_database.dart';
import 'package:fisrtflutter/models/notification.dart';
import 'package:get/get.dart';

class NotificationViewModel extends GetxController{

  var notis=<MyNotification>[].obs;

  var getNotiProgress=false.obs;

  InsertNoti(MyNotification noti)async{
    var db=CarsDataBase.db;
    await db.insertNoti(noti);
    update();
    getNoti();
  }

  getNoti()async{
    getNotiProgress.value=true;
    var db=CarsDataBase.db;
    await db.getAllNotification().then((noti){
      notis.value=noti.cast<MyNotification>();
      getNotiProgress.value=false;
    }).catchError((error){
      Get.snackbar("error", error);
      getNotiProgress.value=false;
    });
  }
}