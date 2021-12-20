import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

class NotificationApi {
  static final _notification = FlutterLocalNotificationsPlugin();
  static final onNotifications=BehaviorSubject<String?>();

  static Future init({bool initSchedula=false})async{
    final android=AndroidInitializationSettings("@mipmap/ic_launcher");
    final ios=IOSInitializationSettings();
    final settings=InitializationSettings(android: android,iOS: ios);
    await _notification.initialize(
      settings,
      onSelectNotification: (payload) async{
        onNotifications.add(payload);
      }
    );
  }

  static Future showNotification(
          {int id = 0,
          String title = "",
          String body = "",
          String payload = ""}) async =>
      _notification.show(id, title, body, await _notificationDetails(),
          payload: payload);

  static _notificationDetails()async {
    return NotificationDetails(
      android:AndroidNotificationDetails(
        "channel id ",
        "channel name",
        channelDescription: "channel description",
        importance: Importance.max
      ),
      iOS: IOSNotificationDetails()
    );
  }
}
