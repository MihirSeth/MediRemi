import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthreminders/Pages/WelcomePage.dart';



final FirebaseAuth _auth = FirebaseAuth.instance;


class Medicine extends StatefulWidget {
  @override
  _MedicineState createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {

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
                "Medicines",
                style: TextStyle(
                    fontFamily: 'Monster'
                ),
              )
          ),
          backgroundColor: Colors.teal,
        ),
        body:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                alignment: Alignment.bottomCenter,
                height: 60,
                width: 250,
                child: Material(
                  borderRadius: BorderRadius.circular(1000),
                  shadowColor: Colors.tealAccent,
                  color: Colors.teal,
                  elevation: 7.0,
                  child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => LoginPage()));
                      },
                      child: Center(
                        child: Text(
                          "Add a Med",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Monster",
                            fontSize: 20.0,

                          ),
                        ),
                      )
                  ),
                ),
              ),
            ),
          ],
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
  }}