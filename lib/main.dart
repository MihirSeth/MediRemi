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

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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

