import 'package:fisrtflutter/data/firebase_source/FirebaseSource.dart';
import 'package:fisrtflutter/models/cars.dart';
import 'package:get/get.dart';

class CarByComponyViewModel extends GetxController{
  var carName="";
  var carsByCompony=<Cars>[].obs;
  CarByComponyViewModel(){
    // getCarsByComny();
  }
  getCarsByComny()async{
    carsByCompony.value=[];
    FirebaseSource().getCarsByCompany(carName).snapshots()
        .forEach((element) {
        element.docs.forEach((element) {
          carsByCompony.add(Cars.fromJson(element.data()));
          Get.snackbar("${Cars.fromJson(element.data()).name}", "message");
      });
    });
  }

}