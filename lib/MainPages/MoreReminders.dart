import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthreminders/Doctors/Models/BuildListDoctorsHomePage.dart';
import 'package:healthreminders/LabTests/BuildListItemLabTestHomePage.dart';
import 'package:healthreminders/ProfilePages/ProfilePage.dart';
import 'package:healthreminders/ProfilePages/ProfilePageGoogle.dart';
import 'package:healthreminders/Models/BuildListItemGoogle.dart';
import 'package:healthreminders/Models/User.dart';
import 'package:healthreminders/StartupPages/LoginPage.dart';
import 'package:healthreminders/Models/BuildListItemNameEmail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthreminders/StartupPages/SignUp.dart';
import 'package:healthreminders/VIdeoCalling/Video_Pages/index.dart';
import 'package:provider/provider.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final uid = _auth.currentUser();

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
    final user = Provider.of<User>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "More Reminders",
            style: TextStyle(fontFamily: 'Monster'),
          ),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: ListView(
          children: [
            Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                  child: Text(
                    "More Information:",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: Divider(
                    color: Colors.black,
                    thickness: 2,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    StreamBuilder<QuerySnapshot>(
                        stream: Firestore.instance
                            .collection('Doctors')
                            .where('uid', isEqualTo: user.uid)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData)
                            return Padding(
                                padding: EdgeInsets.only(top: 250, left: 75),
                                child: Text('Fetching More Reminders...',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                    )));

                          return Expanded(
                            child: SizedBox(
                              height: 700,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data.documents.length,
                                itemBuilder: (context, index) =>
                                    buildListItemDoctorsHomePage(context,
                                        snapshot.data.documents[index]),
                              ),
                            ),
                          );
                        }),
                    StreamBuilder<QuerySnapshot>(
                        stream: Firestore.instance
                            .collection('LabTests')
                            .where('uid', isEqualTo: user.uid)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) return Text('');

                          return Expanded(
                            child: SizedBox(
                              height: 700,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data.documents.length,
                                itemBuilder: (context, index) =>
                                    buildListItemLabTestsHomePage(context,
                                        snapshot.data.documents[index]),
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ],
            ),
          ],
        ),
        drawer: Drawer(
            child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance
                      .collection("Users")
                      .where('uid', isEqualTo: user.uid)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData)
                      return Text('Loading...');
                    else
                      googleName();
                    return ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) => buildListItem(
                          context, snapshot.data.documents[index]),
                    );
                  }),
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
            ),
            Container(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Profile'),
                    onTap: () async {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ProfilePage();
                          },
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Google Profile'),
                    onTap: () async {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ProfilePageGoogle();
                          },
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.video_call),
                    title: Text('Video Calling'),
                    onTap: () async {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return IndexPage();
                          },
                        ),
                      );
                    },
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
                ]),
              ),
            ),
          ],
        )));
  }

  googleName() {
    StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection("Users Google").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Text('Loading...');
          else
            googleName();
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) =>
                buildListItemGoogle(context, snapshot.data.documents[index]),
          );
        });
  }
}

void errorNames() {
  Column(children: <Widget>[
    Text(
        'Signed Up with not enough information. Go back to sign up page and sign up again'),
    InkWell(
        onTap: () {
          BuildContext context;
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignupPage()));
        },
        child: Text(
          "Login with Google",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Monster",
          ),
        ))
  ]);
}
