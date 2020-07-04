import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final databaseReference = Firestore.instance;


buildListItemAppoinmentsHomePage(BuildContext context, DocumentSnapshot document) {
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
                      'Appoinment',
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

                          ),
                        ),
                        Text(
                          document['Doctor Name'],
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
                        Icon(Icons.alarm, color: Colors.black,size: 20.0),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Time of Appoinment: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
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
                        Icon(Icons.assignment, color: Colors.black,size: 20.0),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Date of Appoinment: It is on ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,

                          ),
                        ),
                        Text(
                          document['Date of Appoinment'],
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
                          document['Month of Appoinment'],
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
                          document['Year of Appoinment'],
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
                        Icon(Icons.alarm, color: Colors.black,size: 20.0),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Day of Appoinment: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,

                          ),
                        ),
                        Text(
                          document['Day of Appoinment'],
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
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
                                .collection('Appoinments')
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


