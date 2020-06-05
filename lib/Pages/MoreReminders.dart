import 'package:flutter/material.dart';

class MoreReminders extends StatefulWidget {
  @override
  _MedicineState createState() => _MedicineState();
}

class _MedicineState extends State<MoreReminders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
            child: Text(
              "Hello",
              style: TextStyle(
                  fontFamily: 'Monster'
              ),
            )
        ),
        backgroundColor: Colors.teal,
      );


  }
}