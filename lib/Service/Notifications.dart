import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService extends ChangeNotifier {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
//initialize
  Future initialize() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("covid");
    IOSInitializationSettings iosInitializationSettings =
        IOSInitializationSettings();
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  //instant notification
  Future instantNotification() async {
    var android = AndroidNotificationDetails("id", "channel", "description");
    var ios = IOSNotificationDetails();
    var platform = new NotificationDetails(
      android: android,
      iOS: ios,
    );
    await _flutterLocalNotificationsPlugin.show(
        0,
        "You reached out to covid help center now",
        "Click here to coninue",
        platform,
        payload: "Stay safe stay home");
  }

  //Image notification
  Future imageNotification() async {
    var bigpicture = BigPictureStyleInformation(
      DrawableResourceAndroidBitmap("covid"),
      largeIcon: DrawableResourceAndroidBitmap("covid"),
      contentTitle: "You reached out to covid help care center",
      summaryText: "Stay safe stay home",
      htmlFormatContent: true,
      htmlFormatContentTitle: true,
    );
    var android = AndroidNotificationDetails("id", "channel", "description",
        styleInformation: bigpicture);
    var platform = new NotificationDetails(
      android: android,
    );
    await _flutterLocalNotificationsPlugin.show(
        0,
        "You reached out to covid help center now",
        "Click here to coninue",
        platform,
        payload: "Stay safe stay home");
  }

  Future stylishNotification() async {
    var android = AndroidNotificationDetails("id", "channel", "description",
        color: Colors.orange,
        enableLights: true,
        enableVibration: true,
        largeIcon: DrawableResourceAndroidBitmap("covid"),
        styleInformation: MediaStyleInformation(
          htmlFormatContent: true,
          htmlFormatTitle: true,
        ));
    var platform = new NotificationDetails(
      android: android,
    );
    await _flutterLocalNotificationsPlugin.show(
        0, "Demo", "Tap to do", platform);
  }

  //sheduled notification
  Future sheduledNotification() async {
    var interval = RepeatInterval.daily;
    var bigpicture = BigPictureStyleInformation(
      DrawableResourceAndroidBitmap("covid"),
      largeIcon: DrawableResourceAndroidBitmap("covid"),
      contentTitle: "Demo notification",
      summaryText: "summary",
      htmlFormatContent: true,
      htmlFormatContentTitle: true,
    );
    var android = AndroidNotificationDetails("id", "channel", "description",
        styleInformation: bigpicture);
    var platform = new NotificationDetails(
      android: android,
    );
    await _flutterLocalNotificationsPlugin.periodicallyShow(
        0, "Demoschedulenotification", "Tap to do", interval, platform);
  }

  //cancel notification
  Future cancelNotification() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }
}
