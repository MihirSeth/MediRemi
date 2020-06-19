//bottom: PreferredSize(
//          preferredSize: Size(double.infinity, 68),
//    child: Padding(
//            padding:  EdgeInsets.fromLTRB(0, 10, 0, 0),
//            child: DateIndicator(
//                indicatorColor: Colors.white,
//                activeBubbleColor: Colors.white,
//                numberColor: Colors.white,
//                holderColor: Colors.teal,
//                textColor: Colors.black,
//                selectedBorderColor: Colors.white70,
//                indicatorShadowColor: Colors.white,
//                onHolderTap: (int day) =>
//                    Navigator.push(
//                        context, MaterialPageRoute(builder: (context) => Medicine()))
//            )
//            ),
//          ),



//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/material.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//
//
//ListView(
//children: [
//Column(
//children: <Widget>[
//Container(
//padding: EdgeInsets.only(left: 15, right:185, top: 20),
//child: Text(
//"Your Medicines:",
//style: TextStyle(
//fontSize: 25,
//fontWeight: FontWeight.bold,
//),
//),
//),
//Column(
//mainAxisAlignment: MainAxisAlignment.end,
//crossAxisAlignment: CrossAxisAlignment.center,
//children: <Widget>[
//Padding(
//padding:  EdgeInsets.only(top:300),
//child: Container(
//alignment: Alignment.bottomCenter,
//height: 60,
//width: 250,
//child: Material(
//borderRadius: BorderRadius.circular(1000),
//shadowColor: Colors.tealAccent,
//color: Colors.teal,
//elevation: 7.0,
//child: FlatButton(
//onPressed: () {
//Navigator.push(
//context, MaterialPageRoute(builder: (context) => AddMedicine()));
//},
//child: Center(
//child: Text(
//"Add a Med",
//style: TextStyle(
//color: Colors.white,
//fontWeight: FontWeight.bold,
//fontFamily: "Monster",
//fontSize: 20.0,
//
//),
//),
//)
//),
//),
//),
//),
//
//
//],
//),
//
//],
//),
//],
//),
//
//
//
//Padding(
//padding: EdgeInsets.only(top: 20),
//child: Card(
//color: Colors.white,
//child: Column(
//children: <Widget>[
//ListTile(
//leading: Icon(Icons.settings),
//title: Text('Settings')
//),
//ListTile(
//leading: Icon(Icons.add ),
//title: Text('Whatsapp')
//),
//],
//),
//),
//),
//Padding(
//padding: EdgeInsets.only(top: 20),
//child: Card(
//color: Colors.white,
//child: Column(
//children: <Widget>[
//ListTile(
//leading: Icon(Icons.settings),
//title: Text('Settings')
//),
//ListTile(
//leading: Icon(Icons.add ),
//title: Text('Whatsapp')
//),
//],
//),
//),
//),
