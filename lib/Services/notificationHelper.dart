//import 'package:flutter/material.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//import 'package:rxdart/subjects.dart';
//
//
//
//final BehaviorSubject<ReminderNotification> didReceiveLocalNotificationSubject =
//BehaviorSubject<ReminderNotification>();
//
//final BehaviorSubject<String> selectNotificationSubject =
//BehaviorSubject<String>();
//
//Future<void> initNotifications(
//    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
//  var initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
//  var initializationSettingsIOS = IOSInitializationSettings(
//      requestAlertPermission: false,
//      requestBadgePermission: false,
//      requestSoundPermission: false,
//      onDidReceiveLocalNotification:
//          (int id, String title, String body, String payload) async {
//        didReceiveLocalNotificationSubject.add(ReminderNotification(
//            id: id, title: title, body: body, payload: payload));
//      });
//  var initializationSettings = InitializationSettings(
//      initializationSettingsAndroid, initializationSettingsIOS);
//  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//      onSelectNotification: (String payload) async {
//        if (payload != null) {
//          debugPrint('notification payload: ' + payload);
//        }
//        selectNotificationSubject.add(payload);
//      });
//}