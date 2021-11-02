import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailTextController=TextEditingController();

  var passwordTextController=TextEditingController();

  var isshow=true;

  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child:Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
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
                      emailTextController.text=value;
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
                      passwordTextController.text=value;
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
                            setState(() {
                              isshow=!isshow;
                            });
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
                        if(formKey.currentState!.validate()){
                          print("success");
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
                          onPressed: (){},
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
    );
  }
}
