import 'package:flutter/material.dart';

import 'AddAppoinment.dart';

class Appoinments extends StatefulWidget {
  @override
  _AppoinmentsState createState() => _AppoinmentsState();
}

class _AppoinmentsState extends State<Appoinments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Appoinments",
            style: TextStyle(
                fontFamily: 'Monster'
            ),
          ),
        ),
        body: Padding(
            padding: EdgeInsets.only(bottom: 20),
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
                                  context, MaterialPageRoute(builder: (context) => AddAppoinments()));
                            },
                            child: Center(
                              child: Text(
                                "Add a Appoinment",
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
