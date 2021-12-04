import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fisrtflutter/models/company.dart';
import 'package:get/state_manager.dart';

class CompanysViewModel extends GetxController{
  var firestore=FirebaseFirestore.instance;
  var companys=<Company>[].obs;
  var getCompanysProgress=false.obs;
  CompanysViewModel()
  {
    getCompny();
  }

  getCompny() async{
    await firestore.collection("compnyname").get().then((value){
      value.docs.forEach((element) {
        companys.add(Company.fromJson(element.data()));
      });
    });
    update();
  }
}