
import 'package:fisrtflutter/core/controllers/register_controller.dart';
import 'package:fisrtflutter/core/presentation/screen/login/login_screen.dart';
import 'package:fisrtflutter/core/presentation/util/validation.dart';
import 'package:fisrtflutter/utils/mycolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RegisterView extends StatelessWidget {
  var isshow = true;


  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var registercontroller=Get.find<RegisterController>();
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
              color: MyColors.blue,
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
                            },
                            validator: (value) {
                              var validator=Validation.validateSimpleText(value);
                              if(!validator.valid){
                                return validator.error;
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

                            },
                            validator: (value) {
                              var validator=Validation.validateEmail(value);
                              if(!validator.valid){
                                return validator.error;
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
                            },
                            validator: (value) {
                              var validator=Validation.validatePhone(value);
                              if(!validator.valid){
                                return validator.error;
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

                            },
                            validator: (value) {
                              var validator=Validation.validatePassword(value);
                              if(!validator.valid){
                                return validator.error;
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
                              var validator=Validation.validatePassword(value);
                              if(!validator.valid){
                                return validator.error;
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
                            color: MyColors.blue,
                            child: MaterialButton(
                              onPressed: () {
                                _formKey.currentState!.save();
                                if (_formKey.currentState!.validate()) {
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
                  child: GetX<RegisterController>(
                    builder:  (contrller) =>
                    contrller.registerProgressisShow.value? CircularProgressIndicator():Center(),
                  ),
                )
              ]
          ),
        ),
      ),
    );
  }
}
