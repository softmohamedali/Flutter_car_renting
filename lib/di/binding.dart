import 'package:fisrtflutter/view_models/auth_viewmodel.dart';
import 'package:fisrtflutter/view_models/home_view_model.dart';
import 'package:fisrtflutter/view_models/main_layout_viewmodel.dart';
import 'package:fisrtflutter/view_models/sell_car_viewmodel.dart';
import 'package:get/get.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => MainLayoutViewModel());
    Get.lazyPut(() => SellCarViewModel());
    Get.lazyPut(() => HomeViewModel());
  }

}