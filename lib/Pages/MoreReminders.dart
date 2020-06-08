import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthreminders/Pages/WelcomePage.dart';



final FirebaseAuth _auth = FirebaseAuth.instance;

class MoreReminders extends StatefulWidget {
  @override
  _MedicineState createState() => _MedicineState();
}

class _MedicineState extends State<MoreReminders> {
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
              "More Reminders",
              style: TextStyle(
                  fontFamily: 'Monster'
              ),
            )
        ),
        backgroundColor: Colors.teal,
      ),
//      body:   CalendarTimeline(
//        initialDate: DateTime(2020, 2, 20),
//        firstDate: DateTime(2020, 2, 15),
//        lastDate: DateTime(2021, 11, 20),
//        onDateSelected: (date) => print(date),
//        leftMargin: 20,
//        monthColor: Colors.black,
//        dayColor: Colors.teal[200],
//        dayNameColor: Color(0xFF333A47),
//        activeDayColor: Colors.white,
//        activeBackgroundDayColor: Colors.redAccent[100],
//        dotsColor: Color(0xFF333A47),
//      ),


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




