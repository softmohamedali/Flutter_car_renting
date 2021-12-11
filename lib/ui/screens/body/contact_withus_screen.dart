import 'package:fisrtflutter/ui/widget/mywidget.dart';
import 'package:fisrtflutter/utils/mycolors.dart';
import 'package:fisrtflutter/view_models/contact_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactWithUsScreen extends StatelessWidget {
  var contactViewModel=Get.find<ContactViewModel>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.main_background,
      appBar: CustomToolBar(title: "Contact With Us",showBack: true),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Icon(
                      Icons.headset_mic_outlined,
                      color: MyColors.blue,
                      size: 80,
                    ),
                    SizedBox(height:10,),
                    Text("Contact With Us",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: MyColors.blue,
                      ),
                    ),
                    SizedBox(height:20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text("Full name",style: TextStyle(
                          fontSize: 15,
                          color: MyColors.text_1
                      ),),
                      Container(
                        height: 40,
                        child: TextFormField(
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelText: "write full name",
                          ),
                          onChanged: (value) {
                            contactViewModel.name=value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "this faield require";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],),
                    SizedBox(height:20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("phone number",style: TextStyle(
                            fontSize: 15,
                            color: MyColors.text_1
                        ),),
                        Container(
                          height: 40,
                          child: TextFormField(
                            decoration: InputDecoration(
                                floatingLabelBehavior: FloatingLabelBehavior.never,
                                labelText: "write phone number",
                            ),
                            onChanged: (value) {
                              contactViewModel.phone=value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "this faield require";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],),
                    SizedBox(height:20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("massage",style: TextStyle(
                            fontSize: 15,
                            color: MyColors.text_1
                        ),),
                        Container(
                          height: 40,
                          child: TextFormField(
                            decoration: InputDecoration(
                                floatingLabelBehavior: FloatingLabelBehavior.never,
                                labelText: "write massage",
                            ),
                            onChanged: (value) {
                              contactViewModel.massage=value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "this faield require";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],),
                    SizedBox(height:40,),
                    Container(
                      width: double.infinity,
                      color: MyColors.blue,
                      child: TextButton(
                        onPressed: () {
                          contactViewModel.sendMassage();
                        },
                        child: Text(
                          "send",
                          style: TextStyle(
                            color: MyColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: GetX<ContactViewModel>(
              builder:  (contrller) =>
              contrller.progressSendMassage.value ? CircularProgressIndicator():Center(),
            ),
          )
        ],
      ),
    );
  }
}
