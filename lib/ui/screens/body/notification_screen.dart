import 'package:fisrtflutter/ui/widget/mywidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomToolBar(
        title: "My Notification",
        showBack: false
      ),
    );
  }
}
