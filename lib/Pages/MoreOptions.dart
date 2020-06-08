import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scrolling_day_calendar/scrolling_day_calendar.dart';
import 'package:healthreminders/Pages/WelcomePage.dart';




final FirebaseAuth _auth = FirebaseAuth.instance;

class MoreOptions extends StatefulWidget {

  @override
  _MedicineState createState() => _MedicineState();
}

class _MedicineState extends State<MoreOptions> {
  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e); //
    }
  }

  Widget pageItems = Text("Inital value");
  DateTime selectedDate = DateTime.now();
  DateTime startDate = DateTime.now().subtract(Duration(days: 10));
  DateTime endDate = DateTime.now().add(Duration(days: 10));
  String widgetKeyFormat = "yyyy-MM-dd";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
            padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
            child: Text(
              "More Options",
              style: TextStyle(
                  fontFamily: 'Monster'
              ),
            )
        ),
        backgroundColor: Colors.teal,
      ),

        body: Center(
          child: Text('Hi'),
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





