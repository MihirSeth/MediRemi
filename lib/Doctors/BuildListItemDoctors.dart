import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:healthreminders/Doctors/AddAppoinment.dart';
import 'package:healthreminders/Doctors/Appoinments.dart';

final databaseReference = Firestore.instance;


buildListItemDoctors(BuildContext context, DocumentSnapshot document) {
  return Column(
      children: <Widget>[
        Card(
          child: Container(
            child: Column(
                children: <Widget>[
                  ListTile(
                    title: Row(
                      children: <Widget>[
                        Icon(Icons.person, color: Colors.black,size: 20.0,),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Name of the Doctor: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,

                          ),
                        ),
                        Text(
                          document['Doctor Name'],
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
                        Icon(Icons.assignment, color: Colors.black,size: 20.0,),

                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Doctor Speciality: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          document['Doctor Speciality'],
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
                          'Phone Number of Doctor: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          document['Phone Number'],
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
                          'Email ID of the Doctor: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            decoration: TextDecoration.underline,

                          ),
                        ),
                        Text(
                          document['Email ID'],
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
                        Icon(Icons.location_on, color: Colors.black,size: 20.0),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Doctors Address: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            decoration: TextDecoration.underline,

                          ),
                        ),
                        Text(
                          document['Address'],
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
                          stream: databaseReference.collection('Doctors').snapshots(),
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
                                            .collection('Doctors')
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
                          }),
                      FlatButton(
                          child: Text(
                            'ADD APPOINMENTS',
                            style: TextStyle(
                                color: Colors.teal
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context, MaterialPageRoute(
                                builder: (context) => AddAppoinments()));
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


