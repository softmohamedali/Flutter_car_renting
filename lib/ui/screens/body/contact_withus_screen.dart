import 'package:fisrtflutter/ui/widget/mywidget.dart';
import 'package:fisrtflutter/utils/mycolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactWithUsScreen extends StatelessWidget {
  const ContactWithUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomToolBar(title: "Contact With Us",showBack: true),
      body: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 20,),
            Icon(
              Icons.headset_mic_outlined,
              color: MyColors.green,
              size: 80,
            ),
            SizedBox(height:10,),
            Text("Contact With Us",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: MyColors.green,
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
                  onChanged: (value) {},
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
                    onChanged: (value) {},
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
                    onChanged: (value) {},
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
              color: MyColors.green,
              child: TextButton(
                onPressed: () {
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
    );
  }
}
