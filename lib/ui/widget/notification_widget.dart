
import 'package:flutter/cupertino.dart';

Widget NotificationItem({
  required String title,
  required String body
}){
  return Container(
    child: Row(
      children: [
        Expanded(child: Text(title)),
        Text(body)
      ],
    ),
  );
}