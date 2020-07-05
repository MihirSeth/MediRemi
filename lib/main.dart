import 'package:flutter/material.dart';
import 'package:healthreminders/Doctors/AddAppointment.dart';
import 'package:healthreminders/Doctors/AddDoctors.dart';
import 'package:healthreminders/Doctors/Appointments.dart';
import 'package:healthreminders/Doctors/Doctors.dart';
import 'package:healthreminders/MainPages/Medicine.dart';
import 'package:healthreminders/Models/User.dart';
import 'package:healthreminders/Notes/AddNotes.dart';
import 'package:healthreminders/Services/auth.dart';
import 'package:provider/provider.dart';
import 'LabTests/AddLabTests.dart';
import 'LabTests/LabTests.dart';
import 'MedicineReminders/AddMedicine.dart';
import 'Models/Wrapper.dart';
import 'Notes/Notes.dart';
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
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    super.initState();
    var initializationSettingsAndroid =
    new AndroidInitializationSettings('app_logo');
    var initializationSettingsIOS = new IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
//      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );
    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);

  }
  Future onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
    await Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => Wrapper()),
    );
  }
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
          '/addappointments': (context) => AddAppoinments(),
          '/addnotes': (context) => AddNotes(),
          '/addlabtest': (context) => AddLabTests(),
          '/medicines': (context) => Medicine(),
          '/doctors': (context) => Doctors(),
          '/appointments': (context) => Appointments(),
          '/notes': (context) =>  Notes(),
          '/labtest': (context) => LabTests(),
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


