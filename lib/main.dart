import 'package:flutter/material.dart';
import 'package:healthreminders/Models/User.dart';
import 'package:healthreminders/Services/auth.dart';
import 'package:provider/provider.dart';
import 'package:healthreminders/Models/loading.dart';



import 'Models/Wrapper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal
        ),
        home: Wrapper(),
      ),
    );
  }
}

