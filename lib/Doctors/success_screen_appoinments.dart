import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:healthreminders/Doctors/Appoinments.dart';

class SuccessScreenAppoinments extends StatefulWidget {
  @override
  _SuccessScreenAppoinmentsState createState() => _SuccessScreenAppoinmentsState();
}

class _SuccessScreenAppoinmentsState extends State<SuccessScreenAppoinments> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(milliseconds: 2200),
          () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
              Appoinments()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: Container(
          child: Center(
            child: FlareActor(
              "assets/Success Check.flr",
              alignment: Alignment.center,
              fit: BoxFit.contain,
              animation: "Untitled",
            ),
          ),
        ),
      ),
    );
  }
}