import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'AddMedicine.dart';




final databaseReference = Firestore.instance;



buildListItemMedicineHomePage(BuildContext context, DocumentSnapshot document) {
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
//                  decoration: BoxDecoration(
//                    borderRadius: BorderRadius.circular(1000),
//                          ),
            child: Column(
                children: <Widget>[
//                          Padding(
//                            padding: EdgeInsets.only(top:10),
//                            child: Text(
//                              'Medicine',
//                              style: TextStyle(
//                                color: Colors.black,
//                                fontSize: 20,
//                                fontWeight: FontWeight.bold,
//                                fontFamily: 'Roboto',
//                                decoration: TextDecoration.underline
//                              ),
//                            ),
//                          ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 50, top: 10),
                    child: Row(
                      children: <Widget>[
//                                Icon(Icons.assignment, color: Colors.black,size: 20.0,),

                        Text(
                          document['Name'],
                          style: TextStyle(
                              color: Colors.teal,
                              fontFamily: 'Roboto',
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 50, top: 20),
                    child: Row(
                      children: <Widget>[
//                                ImageIcon(
//                                    AssetImage('assets/pill.png'),
//                                    color: Colors.black,
//                                    size: 20.0
//                                ),
//                                SizedBox(
//                                  width: 15,
//                                ),
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
                        ),
                        Text(
                          ' mg',
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
                  Padding(
                    padding: EdgeInsets.only(left: 50, top: 10),
                    child: Row(
                      children: <Widget>[
//                                Icon(Icons.arrow_forward, color: Colors.black,size: 20.0),
//                                SizedBox(
//                                  width: 15,
//                                ),
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
                  Padding(
                    padding: EdgeInsets.only(left: 50, top: 10),
                    child: Row(
                      children: <Widget>[
//                                Icon(Icons.arrow_forward, color: Colors.black,size: 20.0),
//                                SizedBox(
//                                  width: 15,
//                                ),
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
                        ),
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
                              'ADD MEDICINES',
                              style: TextStyle(
                                color: Colors.teal,
                              ),
                            ),
                            onPressed: () async {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return AddMedicine();
                                    },
                                  )
                              );
                            }
                        ),
                        Padding(
                          padding: EdgeInsets.only(right:10),
                          child: Text(
                            'For more details and deleting go to the Medicine Page',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ]
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


