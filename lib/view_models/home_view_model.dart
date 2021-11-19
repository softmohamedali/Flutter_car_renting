import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fisrtflutter/models/company.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController{
  var _firestore=FirebaseFirestore.instance;
  var companys=<Company>[];

  HomeViewModel()
  {
    getCompny();
  }
  @override
  void onInit() {

  }

  @override
  void onClose() {

  }

  @override
  void onReady() {

  }

  getCompny() async{
    await _firestore.collection("compnyname").get().then((value){
      value.docs.forEach((element) {
        companys.add(Company.fromJson(element.data()));
      });
    });
    update();
  }
}