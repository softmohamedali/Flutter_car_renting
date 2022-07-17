
import 'package:fisrtflutter/core/controllers/login_controller.dart';
import 'package:fisrtflutter/core/presentation/screen/register/register_screen.dart';
import 'package:fisrtflutter/core/presentation/util/validation.dart';
import 'package:fisrtflutter/core/presentation/util/dimen.dart';
import 'package:fisrtflutter/core/presentation/widgets/password_textfailed.dart';
import 'package:fisrtflutter/core/presentation/widgets/textfailed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  Null Function(String) onPasswordValueChange;
  Null Function(String) onEmailValueChange;
  Null Function() onLoginClick;
  final _formKey=GlobalKey<FormState>();
  LoginView(
      {required BuildContext context,
      required this.onPasswordValueChange,
      required this.onEmailValueChange,
      required this.onLoginClick}) {}

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset('assets/imd_place_holder.webp'),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: Dimen.LARG_PADDING,
                    ),
                    Text(
                      "Log In",
                      style: TextStyle(
                          fontSize: Dimen.LARG_TEXT, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: Dimen.LARG_PADDING,
                    ),
                    MyTextFailed(
                      onValueChange: (value) {
                        onEmailValueChange(value);
                      },
                      validator: (value) {
                        var validator = Validation.validateEmail(value);
                        if (!validator.valid) {
                          return validator.error;
                        }
                        return null;
                      },
                      icon: Icon(Icons.mail),
                      label: "Your Email",
                    ),
                    SizedBox(
                      height: Dimen.SMALL_FIELD_SPACE,
                    ),
                    GetX<LoginController>(
                      builder: (controller) => MyPasswordTextField(
                          onValueChange: (value) {
                            onPasswordValueChange(value);
                          },
                          onVisionPasswordClick: () {
                            controller.isPasswordShow.value =
                                !controller.isPasswordShow.value;
                          },
                          validator: (value) {
                            var validator = Validation.validatePassword(value);
                            if (!validator.valid) {
                              return validator.error;
                            }
                            return null;
                          },
                          label: "Your Password",
                          isShow: controller.isPasswordShow.value),
                    ),
                    SizedBox(
                      height: Dimen.LARG_PADDING,
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.blue,
                      child: MaterialButton(
                        onPressed: () {
                          // _formKey.currentState!.save();
                          if(_formKey.currentState!.validate())
                          {
                            onLoginClick();
                          }
                        },
                        child: Text(
                          "login",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: (){
                        Get.to(RegisterScreen());
                      },
                      child: Text(
                        "don,t have email register",
                        style: TextStyle(
                          color: Colors.blueAccent,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Center(
          child: GetX<LoginController>(
            builder: (contrller) => contrller.loginProgressisShow.value
                ? CircularProgressIndicator()
                : Center(),
          ),
        )
      ],
    );
  }
}
