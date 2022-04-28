import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotifyPage extends StatefulWidget {
  @override
  _NotifyPageState createState() => _NotifyPageState();
}

class _NotifyPageState extends State<NotifyPage> {
  late FlutterLocalNotificationsPlugin fltrNotification;

  @override
  void initState() {
    super.initState();
    var androidInitilize = new AndroidInitializationSettings('ic_launcher');
    var iOSinitialize = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        android: androidInitilize, iOS: iOSinitialize);
    fltrNotification = new FlutterLocalNotificationsPlugin();
    fltrNotification.initialize(initializationSettings,
        onSelectNotification: notificationSelected);
  }

  Future _showNotification() async {
    var androidDetails = new AndroidNotificationDetails("channelId", "channelName", importance: Importance.max, priority: Priority.max);
    var iOSDetails = new IOSNotificationDetails();
    var generateNotificationDetails = new NotificationDetails(android: androidDetails,iOS: iOSDetails );

    await fltrNotification.show(0, "title", "body", generateNotificationDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
        onPressed: _showNotification,
        child: Text("hello"),
      ),
    ));
  }

  Future notificationSelected(payload) async {}
}
