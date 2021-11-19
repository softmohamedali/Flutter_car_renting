import 'package:fisrtflutter/ui/mycolors.dart';
import 'package:fisrtflutter/ui/screens/register_screen.dart';
import 'package:fisrtflutter/view_models/auth_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<AuthViewModel> {

  var isshow=true;

  final _formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          Padding(
          padding: const EdgeInsets.all(20.0),
          child:Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "logIn",
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      keyboardType:TextInputType.emailAddress,
                      onChanged: (value){
                        controller.email=value;
                      },
                      validator: (value){
                        if(value!.isEmpty)
                        {
                          return "required";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Emial Adress",
                        prefixIcon: Icon(Icons.email),
                        border:OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      keyboardType:TextInputType.visiblePassword,
                      onChanged: (value){
                        controller.password=value;
                      },
                      validator: (value){
                        if(value!.isEmpty)
                        {
                          return "required";
                        }
                        return null;
                      },
                      obscureText: isshow,
                      decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: Icon(Icons.lock),

                        suffixIcon: IconButton(
                          onPressed: (){

                          },
                          icon:Icon(Icons.remove_red_eye),
                        ),
                        border:OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.blue,
                      child: MaterialButton(
                        onPressed: (){
                          _formKey.currentState!.save();
                          if(_formKey.currentState!.validate())
                          {
                            controller.singIn();
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
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("forget My Password ?"),
                        TextButton(
                          onPressed: (){
                            Get.to(RegisterScreen());
                          },
                          child: Text("register"),
                        )
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
          Center(
            child: GetX<AuthViewModel>(
                   builder:  (contrller) =>
                       controller.showLoginProgrees.value ? CircularProgressIndicator():Center(),
            ),
          )
        ],
      ),
    );
  }
}

