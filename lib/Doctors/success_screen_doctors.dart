import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

import 'Doctors.dart';

class SuccessScreenDoctors extends StatefulWidget {
  @override
  _SuccessScreenDoctorsState createState() => _SuccessScreenDoctorsState();
}

class _SuccessScreenDoctorsState extends State<SuccessScreenDoctors> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(milliseconds: 2200),
          () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
                Doctors()));
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