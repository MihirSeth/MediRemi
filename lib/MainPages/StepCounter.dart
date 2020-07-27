import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:pedometer/pedometer.dart';
import 'package:hive/hive.dart';


class StepsCounter extends StatefulWidget {
  @override
  _StepsCounterState createState() => _StepsCounterState();
}

class _StepsCounterState extends State<StepsCounter> {
  Pedometer _pedometer;
  StreamSubscription<int> _subscription;
  Box<int> stepsBox = Hive.box('steps');
  int todaySteps;

  final Color carbonBlack = Color(0xff1a1a1a);

  @override
  void initState() {
    super.initState();
    startListening();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: const Text('Step Counter'),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Icon(
                  Icons.directions_walk,
                  size: 90,
                ),
                new Text(
                  'Steps taken:',
                  style: TextStyle(fontSize: 30),
                ),
                new Text(
                  todaySteps?.toString() ?? '0',
                  style: TextStyle(fontSize: 100, color: Colors.blue),
              )
            ],
          )
        )
      );
     }
  @override
  void dispose() {
    stopListening();
    super.dispose();
  }

  Widget gradientShaderMask({@required Widget child}) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [
          Colors.orange,
          Colors.deepOrange.shade900,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
      child: child,
    );
  }

  void startListening() {
    _pedometer = Pedometer();
    _subscription = _pedometer.pedometerStream.listen(
      getTodaySteps,
      onError: _onError,
      onDone: _onDone,
      cancelOnError: true,
    );
  }

  void _onDone() => print("Finished pedometer tracking");
  void _onError(error) => print("Flutter Pedometer Error: $error");

  Future<int> getTodaySteps(int value) async {
    print(value);
    int savedStepsCountKey = 999999;
    int savedStepsCount = stepsBox.get(savedStepsCountKey, defaultValue: 0);

    int todayDayNo = Jiffy(DateTime.now()).dayOfYear;
    if (value < savedStepsCount) {
      // Upon device reboot, pedometer resets. When this happens, the saved counter must be reset as well.
      savedStepsCount = 0;
      // persist this value using a package of your choice here
      stepsBox.put(savedStepsCountKey, savedStepsCount);
    }

    // load the last day saved using a package of your choice here
    int lastDaySavedKey = 888888;
    int lastDaySaved = stepsBox.get(lastDaySavedKey, defaultValue: 0);

    // When the day changes, reset the daily steps count
    // and Update the last day saved as the day changes.
    if (lastDaySaved < todayDayNo) {
      lastDaySaved = todayDayNo;
      savedStepsCount = value;

      stepsBox
        ..put(lastDaySavedKey, lastDaySaved)
        ..put(savedStepsCountKey, savedStepsCount);
    }

    setState(() {
      todaySteps = value - savedStepsCount;
    });
    stepsBox.put(todayDayNo, todaySteps);
    return todaySteps; // this is your daily steps value.
  }

  void stopListening() {
    _subscription.cancel();
  }
   }

