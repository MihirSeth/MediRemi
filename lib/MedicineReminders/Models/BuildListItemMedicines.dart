import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';




final databaseReference = Firestore.instance;


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
                                  fontFamily: 'Roboto',


                                ),
                              ),
                              Text(
                                document['Name'],
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontFamily: 'Roboto',
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
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                document['Dosage'],
                                style: TextStyle(
                                  color: Colors.blueGrey,
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
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                document['Type'],
                                style: TextStyle(
                                  color: Colors.blueGrey,
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

                                ),
                              ),
                              Text(
                                document['Interval'],
                                style: TextStyle(
                                  color: Colors.blueGrey,
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

                                ),
                              ),
                              Text(
                                document['Pills'],
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                        ),
                        ListTile(
                          title: Row(
                            children: <Widget>[
                              Icon(Icons.alarm, color: Colors.black,size: 20.0),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Starting Time: ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,

                                ),
                              ),
                              Text(
                                document['Starting Time'],
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                        ),

                        ButtonBar(
                            children: <Widget>[
//                              IconButton(
//                                              icon: Icon(
//                                                  Icons.delete,
//                                                color: Colors.teal,
//                                                size: 30,
//                                              ),
//                                              onPressed: () async {
//                                                  await databaseReference
//                                                    .collection('Medicines')
//                                                    .document(document.documentID)
//                                                    .delete();
//                                              }
//                                          )
                              FlatButton(
                                  child: Text(
                                    'DELETE',
                                    style: TextStyle(
                                        color: Colors.teal,
                                    ),
                                  ),
                                  onPressed: () async {
                                    await databaseReference
                                        .collection('Medicines')
                                        .document(document.documentID)
                                        .delete();
                                  }
                              ),
                            ]
                        )
                      ]
                  ),
                ),
              ),
        ]
    );
}
