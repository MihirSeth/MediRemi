import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../AddMedicine.dart';


buildListItemMedicine(BuildContext context, DocumentSnapshot document) {
  return Column(
        children: <Widget>[
             Card(
              child: Container(
                child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Row(
                          children: <Widget>[
                            Icon(Icons.assignment, color: Colors.black,size: 20.0,),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Name of the Medicine: ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,

                              ),
                            ),
                            Text(
                              document['Name'],
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      ListTile(
                        title: Row(
                          children: <Widget>[
                            ImageIcon(
                                AssetImage('assets/pill.png'),
                                color: Colors.black,
                                size: 20.0
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Dosage: ',
                              style: TextStyle(
                              color: Colors.black,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              document['Dosage'],
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      ListTile(
                        title: Row(
                          children: <Widget>[
                            Icon(Icons.arrow_forward, color: Colors.black,size: 20.0),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Medicine Type: ',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              document['Type'],
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      ListTile(
                        title: Row(
                          children: <Widget>[
                            Icon(Icons.arrow_forward, color: Colors.black,size: 20.0),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Interval: ',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                decoration: TextDecoration.underline,

                              ),
                            ),
                            Text(
                              document['Interval'],
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      ListTile(
                        title: Row(
                          children: <Widget>[
                            Icon(Icons.arrow_forward, color: Colors.black,size: 20.0),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Pills: ',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                decoration: TextDecoration.underline,

                              ),
                            ),
                            Text(
                              document['Pills'],
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                      ListTile(
                        title: Row(
                          children: <Widget>[
                            Icon(Icons.arrow_forward, color: Colors.black,size: 20.0),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Starting Time: ',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                decoration: TextDecoration.underline,

                              ),
                            ),
                            Text(
                              document['Starting Time'],
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                      ButtonBar(
                        children: <Widget>[
                        FlatButton(
                            child: Text(
                                'DELETE',
                              style: TextStyle(
                                color: Colors.teal
                              ),
                            ),
                          onPressed: ()  async {

                          }
                    ),
                        ],
                      )
                    ]
                ),
              ),

        ),

        ]
    );

}


