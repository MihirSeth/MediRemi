import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:healthreminders/Doctors/Appoinments.dart';

final databaseReference = Firestore.instance;


buildListItemLabTests(BuildContext context, DocumentSnapshot document) {
  return Column(
      children: <Widget>[
        Card(
          child: Container(
            child: Column(
                children: <Widget>[
                  ListTile(
                    title: Row(
                      children: <Widget>[
                        Icon(Icons.assessment, color: Colors.black,size: 20.0,),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Lab Test Name: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,

                          ),
                        ),
                        Text(
                          document['Lab Tests Name'],
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
                        Icon(Icons.location_on, color: Colors.black,size: 20.0,),

                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Address of Lab Test: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          document['Address of Lab Test'],
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
                          'Time of Lab Test: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          document['Time'],
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          document['Time Type'],
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
                          'Date and Day of Lab Test: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            decoration: TextDecoration.underline,

                          ),
                        ),
                        Text(
                          document['Date of Lab Test'],
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          document['Day of Lab Test'],
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
                        Icon(Icons.arrow_forward, color: Colors.black,size: 20.0,),

                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Reason for Lab Tests Lab Test: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          document['Reason for Lab Test'],
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
                      StreamBuilder<QuerySnapshot>(
                          stream: databaseReference.collection('Lab Tests').snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Column(
                                children: snapshot.data.documents.map((doc) {
                                  return FlatButton(
                                      child: Text(
                                        'DELETE',
                                        style: TextStyle(
                                            color: Colors.teal
                                        ),
                                      ),
                                      onPressed: () async {
                                        await databaseReference
                                            .collection('Lab Tests')
                                            .document(doc.documentID)
                                            .delete();
                                      }
                                  );
                                }).toList(),
                              );
                            } else { // put this else block
                              return Container(
                                child: Text('No Data Found'),
                              );
                            }
                          } ),
                    ],
                  )
                ]
            ),
          ),

        ),

      ]
  );

}


