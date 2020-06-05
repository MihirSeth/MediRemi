import 'package:flutter/material.dart';
import 'package:horizontal_indicator/horizontal_indicator.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: DateIndicator(
            indicatorColor: Colors.white,
            activeBubbleColor: Colors.white,
            numberColor: Colors.white,
            holderColor: Colors.teal,
            textColor: Colors.black,
            selectedBorderColor: Colors.white,
            indicatorShadowColor: Colors.white,
          )
      ),

      );

  }
}
