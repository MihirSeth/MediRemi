import 'package:flutter/material.dart';


class MoreOptions extends StatefulWidget {
  @override
  _MedicineState createState() => _MedicineState();
}

class _MedicineState extends State<MoreOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Center(
            child: Text(
              "Hi",
              style: TextStyle(
                  fontFamily: 'Monster'
              ),
            )
        ),

      );

  }
}

