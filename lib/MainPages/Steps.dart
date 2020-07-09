import 'package:flutter/material.dart';


class Steps extends StatefulWidget {
  @override
  _StepsState createState() => _StepsState();
}

class _StepsState extends State<Steps> {
//  Pedometer _pedometer;
//  StreamSubscription<int> _subscription;
//  String _stepCountValue = '?';
//
//  @override
//  void initState() {
//    super.initState();
//    initPlatformState();
//  }

//  // Platform messages are asynchronous, so we initialize in an async method.
//  Future<void> initPlatformState() async {
//    startListening();
//  }
//
//  void onData(int stepCountValue) {
//    print(stepCountValue);
//  }
//
//  void startListening() {
//    _pedometer = new Pedometer();
//    _subscription = _pedometer.pedometerStream.listen(_onData,
//        onError: _onError, onDone: _onDone, cancelOnError: true);
//  }
//
//  void stopListening() {
//    _subscription.cancel();
//  }
//
//  void _onData(int newValue) async {
//    print('New step count value: $newValue');
//    setState(() => _stepCountValue = "$newValue");
//  }
//
//  void _onDone() => print("Finished pedometer tracking");
//
//  void _onError(error) => print("Flutter Pedometer Error: $error");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: const Text('Pedometer example app'),
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
                  "hello",
                  style: TextStyle(fontSize: 100, color: Colors.blue),
              )
            ],
          )
        )
      );
     }
   }

