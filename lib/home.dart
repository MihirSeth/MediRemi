import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthreminders/Services/SignOut.dart';
import 'package:healthreminders/Pages/WelcomePage.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class Home extends StatefulWidget {



  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e); //
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
            "Home Screen",
                style: TextStyle(
                fontFamily: 'Monster'
            ),
        )
        ),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child:  ButtonBar(

          alignment: MainAxisAlignment.center, // this will take space as minimum as posible(to center)
          children: <Widget>[
            RaisedButton.icon(
              label:  Text('Hello'),
              icon: Icon(Icons.home),
              onPressed: (){}
            ),
            RaisedButton(
              child:  Text('Hi'),
              onPressed: null,
            ),
          ],
        ),
      ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.teal,
                ),
              ),
              RaisedButton.icon(
                icon: Icon(Icons.person),
                label: Text('Logout'),
                onPressed: () {
                  _signOut().whenComplete(() {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage();

                        },
                      ),
                    );
                  });
                },
              ),
            ],
          ),
        ))
    ;
  }
}

