import 'package:fisrtflutter/data/firebase_source/FirebaseSource.dart';
import 'package:fisrtflutter/models/cars.dart';
import 'package:get/get.dart';

class SearchViewModel extends GetxController {
  String query="";
  var carsSearch=<Cars>[].obs;
  var getCarSearchProgress=false.obs;

  getSearchCar() async {
    getCarSearchProgress.value=true;
    await FirebaseSource().getSearchCars(query).get().then((value) {
      value.docs.forEach((element) {
        carsSearch.add(Cars.fromJson(element.data()));
      });
      getCarSearchProgress.value=false;
    }).catchError((onError) {
      Get.snackbar("error", onError);
      getCarSearchProgress.value=false;
    });
  }
}
