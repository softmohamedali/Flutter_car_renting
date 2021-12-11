import 'package:fisrtflutter/data/firebase_source/FirebaseSource.dart';
import 'package:fisrtflutter/models/massage.dart';
import 'package:get/get.dart';

class ContactViewModel extends GetxController{
  var name,phone,massage,date;
  var progressSendMassage=false.obs;

  sendMassage(){
    progressSendMassage.value=true;
    FirebaseSource().sendMassage(Massage(
      fulName: name,
      phone: phone,
      massage: massage,
      date: DateTime.now().toString()
    )).then((value) {
      progressSendMassage.value=false;
      Get.snackbar("Massage Send Successfuly"
          , "thank you for sending a massage we will contact with you At the earliest");
    }).catchError((error){
      progressSendMassage.value=false;
      Get.snackbar("Error", error);
    });
  }

}