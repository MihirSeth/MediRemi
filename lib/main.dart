import 'package:flutter/material.dart';
import 'package:healthreminders/Doctors/AddAppoinment.dart';
import 'package:healthreminders/Doctors/AddDoctors.dart';
import 'package:healthreminders/Doctors/Appoinments.dart';
import 'package:healthreminders/Doctors/Doctors.dart';
import 'package:healthreminders/MainPages/Medicine.dart';
import 'package:healthreminders/Models/User.dart';
import 'package:healthreminders/Services/auth.dart';
import 'package:provider/provider.dart';
import 'MedicineReminders/AddMedicine.dart';
import 'Models/Wrapper.dart';
import 'StartupPages/PasswordReset.dart';
import 'StartupPages/SignUp.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() => runApp(HealthRemindersApp());

class HealthRemindersApp extends StatefulWidget {

  // This widget is the root of your application.
  @override
  _HealthRemindersAppState createState() => _HealthRemindersAppState();
}

class _HealthRemindersAppState extends State<HealthRemindersApp> {
//    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
////  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
//
//  @override
//
//  void initState() {
//    super.initState();
//    var initializationSettingsAndroid =
//    new AndroidInitializationSettings('heartbeat.jpg');
//    var initializationSettingsIOS = new IOSInitializationSettings(
//      requestSoundPermission: false,
//      requestBadgePermission: false,
//      requestAlertPermission: false,
////      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
//    );
//    var initializationSettings = new InitializationSettings(
//        initializationSettingsAndroid, initializationSettingsIOS);
//    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
//    flutterLocalNotificationsPlugin.initialize(initializationSettings,
//        onSelectNotification: onSelectNotification);
//  }
//  Future onSelectNotification(String payload) async {
//    debugPrint("payload : $payload");
//    showDialog(
//      context: context,
//      builder: (_) => new AlertDialog(
//        title: new Text('Notification'),
//        content: new Text('$payload'),
//      ),
//    );
//  }
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          "/signup" : (BuildContext context) => new SignupPage(),
          "/passwordreset" : (BuildContext context) => new PasswordReset(),
          '/addmedicine': (context) => AddMedicine(),
          '/adddoctor': (context) => AddDoctors(),
          '/addappoinments': (context) => AddAppoinments(),
          '/medicines': (context) => Medicine(),
          '/doctors': (context) => Doctors(),
          '/appoinments': (context) => Appoinments(),
        },
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Wrapper(),
      ),
    );
  }
}


