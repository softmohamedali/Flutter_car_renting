import 'package:fisrtflutter/utils/mycolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget NotificationItem({
  required String title,
  required String body,
  required String imgUrl,
  required String time,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Container(
      child: Column(
        children: [
          Row(
            children: [
              ClipOval(
                child: Image(
                  image: NetworkImage(
                      "https://media.istockphoto.com/vectors/notification-bell-icon-for-incoming-inbox-message-vector-bell-and-vector-id1032603922?k=20&m=1032603922&s=170667a&w=0&h=5CirUmXEBvyYVerFo_RE5O7ATDbo59mn4Rc-Cqu1rLM="),
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  Text(body)],
                )
              ),
              Text(time)
            ],
          ),
          SizedBox(height: 10,),
          Container(
            width: double.infinity,
            height: 0.5,
            color: MyColors.black,
          )
        ],
      ),
    ),
  );
}
