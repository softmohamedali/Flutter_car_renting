import 'dart:convert';
import 'dart:io';
import 'package:fisrtflutter/utils/constants.dart';
import 'package:http/http.dart' as http;

class NotificationService {
  final HttpClient httpClient = HttpClient();
  final String fcmUrl = 'https://fcm.googleapis.com/fcm/send';

  final fcmKey =Constats.SERVER_KEY;

  Future<void> sendFcm({
    required String title,
    required String body,
    required String fcmToken,
  }) async {
    var response = await http.post(Uri.parse(fcmUrl),
        body: jsonEncode({
          "to": fcmToken,
          "priority": "high",
          "notification": {"title": title, "body": body}
        }),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'key=$fcmKey'
        });

    if (response.statusCode == 200) {
      print(response.body.toString());
    } else {
      print(response.reasonPhrase);
    }
  }
}

void sendNotificationsTime() async {
  await Future.delayed(const Duration(seconds: 5));
  await NotificationService()
      .sendFcm(title: "title", body: "body", fcmToken: "your fcm token");
}