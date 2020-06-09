import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthreminders/MainPages/Medicine.dart';
import 'package:healthreminders/MainPages/MoreOptions.dart';
import 'package:healthreminders/MainPages/HomePage.dart';
import 'package:healthreminders/MainPages/MoreReminders.dart';
import 'package:healthreminders/StartupPages/WelcomePage.dart';


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
    MoreReminders(),
    MoreOptions(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
            icon: Icon(Icons.alarm),
            title: Text('More Reminders')
        ),
        BottomNavigationBarItem(
        icon:  ImageIcon(AssetImage('assets/dots.png')),
        title: Text('More Options')
        )
  ],
        selectedItemColor: Colors.black,
        backgroundColor: Colors.teal,
        unselectedItemColor: Colors.teal[800],
        unselectedLabelStyle: TextStyle(color:Colors.black),

    onTap: (int index) {
      setState(() {
        _selectedTab = index;
      },


      );
    })
            );

  }
}
