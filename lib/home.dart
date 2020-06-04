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
      bottomNavigationBar: BottomNavigationBar(
      currentIndex: 0, // this will be set when a new tab is tapped
      items: [
        BottomNavigationBarItem(
          icon:  Icon(Icons.home),
          title: new Text('Home'),
        ),
        BottomNavigationBarItem(
          icon:  ImageIcon(AssetImage('assets/pill.png')),
          title: new Text('Messages'),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile')
        )
      ],
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
        ))
    ;
  }
}
