
import 'package:fisrtflutter/core/controllers/home_controller.dart';
import 'package:fisrtflutter/core/controllers/login_controller.dart';
import 'package:fisrtflutter/core/controllers/product_controller.dart';
import 'package:fisrtflutter/core/controllers/register_controller.dart';
import 'package:get/get.dart';

class TaskBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(),fenix: true);
    Get.lazyPut(() => HomeControler(),fenix: true);
    Get.lazyPut(() => RegisterController(),fenix: true);
    Get.lazyPut(() => ProductController(),fenix: true);

  }

}