import 'package:fisrtflutter/ui/layout/main_layout.dart';
import 'package:fisrtflutter/ui/screens/body/Terms_condition_screen.dart';
import 'package:fisrtflutter/ui/screens/body/home_screen.dart';
import 'package:fisrtflutter/ui/screens/auth/login_screen.dart';
import 'package:fisrtflutter/view_models/auth_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/mycolors.dart';

class RegisterScreen extends GetWidget<AuthViewModel> {
  var isshow = true;


  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.main_background,
        elevation: 0,
        leading: Container(
          width: double.infinity,
          alignment: Alignment.centerRight,
          child: IconButton(
            onPressed: () {
              Get.off(LoginScreen());
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: MyColors.green,
              size: 30,
            ),
          ),
        ),
      ),
      body: Container(
        color: MyColors.main_background,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            children:[
              Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            controller.name = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "required";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "User Name",
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            controller.email = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "required";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Emial Adress",
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          onChanged: (value) {
                            controller.phone = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "required";
                            }
                            return null;
                          },
                          obscureText: isshow,
                          decoration: InputDecoration(
                            labelText: "Phone Number",
                            prefixIcon: Icon(Icons.phone),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          onChanged: (value) {
                            controller.password = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "required";
                            }
                            return null;
                          },
                          obscureText: isshow,
                          decoration: InputDecoration(
                            labelText: "Password",
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.remove_red_eye),
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "required";
                            }
                            if (value!=controller.password) {
                              return "password not correct";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Confirm Password",
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          width: double.infinity,
                          color: MyColors.green,
                          child: MaterialButton(
                            onPressed: () {
                              _formKey.currentState!.save();
                              if (_formKey.currentState!.validate()) {
                                controller.register();
                              }
                            },
                            child: Text(
                              "Register",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: GetX<AuthViewModel>(
                  builder:  (contrller) =>
                  controller.showRegisterProgrees.value ? CircularProgressIndicator():Center(),
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}
