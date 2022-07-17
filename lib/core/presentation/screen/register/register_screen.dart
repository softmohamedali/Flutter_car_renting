import 'package:fisrtflutter/core/controllers/register_controller.dart';
import 'package:fisrtflutter/core/presentation/screen/register/register_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class RegisterScreen extends  GetWidget<RegisterController>{
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RegisterView();
  }
}
