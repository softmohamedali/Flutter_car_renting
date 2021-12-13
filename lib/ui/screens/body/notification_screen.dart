import 'package:fisrtflutter/ui/widget/mywidget.dart';
import 'package:fisrtflutter/ui/widget/notification_widget.dart';
import 'package:fisrtflutter/utils/mycolors.dart';
import 'package:fisrtflutter/view_models/notificationviewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

class NotificationScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.main_background,
      appBar: CustomToolBar(
        title: "My Notification",
        showBack: false
      ),
      body:  Container(
        padding: EdgeInsets.all(10),
        child: Stack(
          children: [
            GetX<NotificationViewModel>(
                builder:(controller) {
                  if(controller.notis.value.length>0)
                  {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return NotificationItem(
                            title: controller.notis.value[index].title!,
                            body:controller.notis.value[index].body!,
                        );
                      },
                      itemCount: controller.notis.value.length,
                      scrollDirection: Axis.vertical,
                    );
                  }
                  else{
                    return Center(child: Text("No Notification",style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),));
                  }
                }
            ),
            Center(
              child: GetX<NotificationViewModel>(
                builder:  (contrller) =>
                contrller.getNotiProgress.value ? CircularProgressIndicator():Center(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
