import 'package:fisrtflutter/view_models/FavViewModel.dart';
import 'package:fisrtflutter/view_models/auth_viewmodel.dart';
import 'package:fisrtflutter/view_models/car_by_compony_viewmodel.dart';
import 'package:fisrtflutter/view_models/companys_viewmodel.dart';
import 'package:fisrtflutter/view_models/contact_viewmodel.dart';
import 'package:fisrtflutter/view_models/home_view_model.dart';
import 'package:fisrtflutter/view_models/main_layout_viewmodel.dart';
import 'package:fisrtflutter/view_models/notificationviewmodel.dart';
import 'package:fisrtflutter/view_models/search_viewmodel.dart';
import 'package:fisrtflutter/view_models/sell_car_viewmodel.dart';
import 'package:get/get.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel(),fenix: true);
    Get.lazyPut(() => MainLayoutViewModel());
    Get.lazyPut(() => SellCarViewModel(),fenix: true);
    Get.lazyPut(() => HomeViewModel(),fenix: true);
    Get.lazyPut(() => FavViewModel(),fenix: true);
    Get.lazyPut(()=>CompanysViewModel(),fenix: true);
    Get.lazyPut(()=>CarByComponyViewModel(),fenix: true);
    Get.lazyPut(() => SearchViewModel(),fenix:true);
    Get.lazyPut(() => ContactViewModel(),fenix:true);
    Get.lazyPut(() => NotificationViewModel(),fenix:true);

  }

}