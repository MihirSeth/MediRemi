import 'package:flutter/material.dart';
import 'package:horizontal_indicator/horizontal_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthreminders/Pages/Medicine.dart';
import 'package:healthreminders/Pages/MoreOptions.dart';
import 'package:healthreminders/Pages/HomePage.dart';
import 'package:healthreminders/Pages/WelcomePage.dart';
import 'package:healthreminders/Pages/SignUp.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e); //
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Padding(
              padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
              child: Text(
                "Home Screen",
                style: TextStyle(
                    fontFamily: 'Monster'
                ),
              )
          ),
          backgroundColor: Colors.teal,
        ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: DateIndicator(
            indicatorColor: Colors.white,
            activeBubbleColor: Colors.white,
            numberColor: Colors.white,
            holderColor: Colors.teal,
            textColor: Colors.black,
            selectedBorderColor: Colors.white,
            indicatorShadowColor: Colors.white,
          )
      ),
        drawer:Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text(''),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                        children: <Widget>[
                          ListTile(
                              leading: Icon(Icons.settings),
                              title: Text('Settings')),
                          ListTile(
                            leading: Icon(Icons.exit_to_app),
                            title: Text('Logout'),
                            onTap: () {
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
                        ]
                    ),
                  ),
                ),
              ],
            )
        )
      );
  }
}
