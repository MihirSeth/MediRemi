import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthreminders/MedicineReminders/AddMedicine.dart';




final databaseReference = Firestore.instance;



buildListItemMedicineHomePage(BuildContext context, DocumentSnapshot document) {
  return Column(
      children: <Widget>[
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          shadowColor: Colors.teal,
          borderOnForeground: true,
          margin: EdgeInsets.only(right: 20, left:20),
          elevation: 5,
          child: Container(
//                  decoration: BoxDecoration(
//                    borderRadius: BorderRadius.circular(1000),
//                          ),
            child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top:10),
                    child: Text(
                      'Medicine',
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
                        Text(
                          'For more details and deleting go to the Medicine Page',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
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
                      ]
                  )
                ]
            ),

          ),
        ),
        SizedBox(
          height: 10,
        ),
      ]
  );
}


