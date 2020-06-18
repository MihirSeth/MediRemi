import 'package:flutter/material.dart';
import 'package:healthreminders/Doctors/AddDoctors.dart';

class Doctors extends StatefulWidget {
  @override
  _DoctorsState createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Doctors",
          style: TextStyle(
              fontFamily: 'Monster'
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
        Center(
        child: Container(
          alignment: Alignment.bottomCenter,
          height: 60,
          width: 250,
          child: Material(
            borderRadius: BorderRadius.circular(1000),
            shadowColor: Colors.tealAccent,
            color: Colors.teal,
            elevation: 7.0,
            child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => AddDoctors()));
                },
                child: Center(
                  child: Text(
                    "Add a Doctor",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Monster",
                      fontSize: 20.0,

                    ),
                  ),
                )
            ),
          ),
        ),
      ),
    ]
        )
      )
    );
  }
}
