import 'package:flutter/material.dart';


class Medicine extends StatefulWidget {
  @override
  _MedicineState createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
            child: Text(
              "Medicine",
              style: TextStyle(
                  fontFamily: 'Monster'
              ),
            )
        ),
      );

  }
}
