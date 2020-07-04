import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:healthreminders/LabTests/LabTests.dart';

class SuccessScreenLabTests extends StatefulWidget {
  @override
  _SuccessScreenLabTestsState createState() => _SuccessScreenLabTestsState();
}

class _SuccessScreenLabTestsState extends State<SuccessScreenLabTests> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(milliseconds: 2200),
          () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
                LabTests()));
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