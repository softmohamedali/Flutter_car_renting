import 'package:fisrtflutter/ui/widget/mywidget.dart';
import 'package:fisrtflutter/utils/mycolors.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.main_background,
      appBar: CustomToolBar(title: "My Account",showBack: false),
    );
  }
}
