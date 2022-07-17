import 'package:fisrtflutter/core/controllers/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'login_view.dart';

class LoginScreen extends GetWidget<LoginController> {

  @override
  Widget build(BuildContext context) {
    var loginController=Get.find<LoginController>();

    return Scaffold(
      body: LoginView(
        context: context,
        onEmailValueChange: (email){
          loginController.email=email;

        },
        onPasswordValueChange: (password){
          loginController.password=password;
        },
        onLoginClick: (){
          loginController.singIn();
        },
      ),
    );
  }
}
