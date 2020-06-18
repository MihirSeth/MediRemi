import 'package:flutter/material.dart';
import 'package:healthreminders/Doctors/AddDoctors.dart';

import 'AddLabTests.dart';

class LabTests extends StatefulWidget {
  @override
  _LabTestsState createState() => _LabTestsState();
}

class _LabTestsState extends State<LabTests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Lab Tests",
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
                                  context, MaterialPageRoute(builder: (context) => AddLabTests()));
                            },
                            child: Center(
                              child: Text(
                                "Add Lab Tests",
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
