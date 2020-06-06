import 'package:flutter/material.dart';
import 'package:healthreminders/home.dart';
import 'package:healthreminders/Pages/WelcomePage.dart';
import 'package:healthreminders/Pages/SignUp.dart';
import 'package:provider/provider.dart';
import 'package:healthreminders/Models/User.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    // return either the Home or Authenticate widget
    if (user == null){
      return LoginPage();
    } else {
      return Home();
    }

  }
}