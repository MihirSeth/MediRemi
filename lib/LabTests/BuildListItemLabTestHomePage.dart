import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final databaseReference = Firestore.instance;


buildListItemLabTestsHomePage(BuildContext context, DocumentSnapshot document) {
  return Column(
      children: <Widget>[
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          ),
          shadowColor: Colors.teal,
          borderOnForeground: true,
          margin: EdgeInsets.only(right: 20, left:20),
          elevation: 10,

          child: Container(
            child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top:10),
                    child: Text(
                      'Lab Test',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          decoration: TextDecoration.underline
                      ),
                    ),
                  ),
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
                            color: Colors.blueGrey,
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
                            color: Colors.blueGrey,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          " ",
                        ),
                        Text(
                          document['Time Type'],
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
                          'Date of Lab Test: ',
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
                            color: Colors.blueGrey,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          '/',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,

                          ),
                        ),
                        Text(
                          document['Month of Lan Test'],
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          '/',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,

                          ),
                        ),
                        Text(
                          document['Year of Lab Test'],
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: <Widget>[
                        Icon(Icons.arrow_forward, color: Colors.black,size: 20.0,),

                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Day of Lab Test: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          document['Day for Lab Test'],
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
                            color: Colors.blueGrey,
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
                          onPressed: () async {
                            await databaseReference
                                .collection('LabTests')
                                .document(document.documentID)
                                .delete();
                          }
                      ),
                    ],
                  )
                ]
            ),
          ),

        ),
        SizedBox(
          height: 40,
        ),
      ]
  );

}


