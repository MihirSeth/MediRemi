import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

buildListItem(BuildContext context, DocumentSnapshot document) {
  return ListTile(
      title: Container(
        padding: EdgeInsets.fromLTRB(0, 25, 0, 45),
        child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.person, color: Colors.white,size: 30.0,),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    document['Name'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.email, color: Colors.white,size: 25.0,),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    document['Email'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ]),
      ));
}
