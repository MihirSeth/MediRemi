import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthreminders/Services/PushNotifications.dart';
import 'package:healthreminders/StartupPages/WelcomePage.dart';
import 'package:healthreminders/Models/buildListItem(NameEmail).dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthreminders/StartupPages/SignUp.dart';


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
        title:  Center(
          child: Text(
                "More Reminders",
                style: TextStyle(
                    fontFamily: 'Monster'
                ),
              ),
        ),

        backgroundColor: Colors.teal,
      ),

        drawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: Firestore.instance.collection("Names")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData)
                          return Text('Loading...');
                        else ErrorNames();
                        return ListView.builder(
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index) =>
                              buildListItem(
                                  context, snapshot.data.documents[index]),

                        );
                      }
                  ),
//                child: Center(
//                  child: Text(
//                      '$Names',
//                    style: TextStyle(
//                      color: Colors.white,
//                      fontWeight: FontWeight.bold,
//                    ),
//                  ),
//                ),
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
                              title: Text('Settings')
                          ),
                          ListTile(
                              leading: ImageIcon(
                                  AssetImage('assets/Whatsapp.png'),
                                  color: Colors.green
                              ),
                              title: Text('Whatsapp')
                          ),
                          ListTile(
                              leading: Icon(Icons.email),
                              title: Text('Email')
                          ),
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

void ErrorNames() {
  Column(
      children: <Widget>[
        Text(
            'Signed Up with not enough information. Go back to sign up page and sign up again'
        ),

        InkWell(
            onTap: () {
              BuildContext context;
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
            },

            child: Text(
              "Login with Google",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "Monster",

              ),

            )
        )
      ]
  );
}