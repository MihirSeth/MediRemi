import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthreminders/Pages/Medicine.dart';
import 'package:healthreminders/Pages/MoreOptions.dart';
import 'package:healthreminders/Pages/HomePage.dart';

import 'package:healthreminders/Pages/MoreReminders.dart';
import 'package:healthreminders/Pages/WelcomePage.dart';
import 'package:horizontal_indicator/horizontal_indicator.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;

class Home extends StatefulWidget {



  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int _selectedTab = 0;

  final _pageOptions = [
    HomePage(),
    Medicine(),
    MoreOptions(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedTab = index;
    });
  }
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

      body: Center(
        child: _pageOptions[_selectedTab],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
      // this will be set when a new tab is tapped
      items: [
        BottomNavigationBarItem(
          icon:  Icon(Icons.home),
          title: new Text('Home'),
        ),
        BottomNavigationBarItem(
          icon:  ImageIcon(AssetImage('assets/pill.png')),
          title: new Text('Medicines'),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile')
        )
  ],
          onTap: _onItemTapped,
          selectedItemColor: Colors.teal[800],

        ),
        drawer: Drawer(
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
          ),
        )
    );
  }
}
