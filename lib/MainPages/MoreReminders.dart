import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthreminders/Doctors/Models/BuildListDoctorsHomePage.dart';
import 'package:healthreminders/LabTests/BuildListItemLabTestHomePage.dart';
import 'package:healthreminders/MainPages/Medicine.dart';
import 'package:healthreminders/Models/User.dart';
import 'package:healthreminders/StartupPages/WelcomePage.dart';
import 'package:healthreminders/Models/BuildListItemNameEmail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthreminders/StartupPages/SignUp.dart';
import 'package:provider/provider.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;
final uid =  _auth.currentUser();

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
        title:  Center(
          child: Text(
                "More Reminders",
                style: TextStyle(
                    fontFamily: 'Monster'
                ),
              ),
        ),

        backgroundColor: Colors.teal,
//        actions: <Widget>[
//          Padding(
//            padding:  EdgeInsets.only(right: 15.0),
//            child: Row(
//              children: <Widget>[
//                FlatButton(
//                  onPressed: () async {
//                      Navigator.pop(context, MaterialPageRoute(builder: (context) =>
//                          AddDoctors()));
//                  },
//                  child: Text(
//                    'Add Doctors',
//                    style: TextStyle(
//                        color: Colors.white,
//                    ),
//                  ),
//                ),
//                FlatButton(
//                  onPressed: () async {
//                    Navigator.pop(context, MaterialPageRoute(builder: (context) =>
//                        AddAppoinments()));
//                  },
//                  child: Text(
//                    'Add Medicines',
//                    style: TextStyle(
//                        color: Colors.white
//                    ),
//                  ),
//                ),
//              ],
//            ),
//          ),
//        ],
      ),
        body:
        ListView(
          children: [
            Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                  child: Text(
                    "More Reminders:",
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
                                stream:  Firestore.instance.collection('Doctors')
                                    .where('uid', isEqualTo: user.uid)
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData)
                                    return Text(" ");

                                  return Expanded(
                                    child: SizedBox(
                                      height: 700,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: snapshot.data.documents.length,
                                        itemBuilder: (context, index) =>
                                            buildListItemDoctorsHomePage(
                                                context,
                                                snapshot.data.documents[index]),

                                      ),
                                    ),
                                  );
                                }
                            ),
                            StreamBuilder<QuerySnapshot>(
                                stream:  Firestore.instance.collection('LabTests')
                                    .where('uid', isEqualTo: user.uid)
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData)
                                    return Text('');

                                  return Expanded(
                                    child: SizedBox(
                                      height: 700,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: snapshot.data.documents.length,
                                        itemBuilder: (context, index) =>
                                            buildListItemLabTestsHomePage(
                                                context,
                                                snapshot.data.documents[index]),

                                      ),
                                    ),
                                  );
                                }
                            ),
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
                      stream: Firestore.instance.collection("Users")
                          .where('uid',  isEqualTo: user.uid)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData)
                          return Text('Loading...');
                        else googleName();
                        return ListView.builder(
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index) =>
                              buildListItem(
                                  context, snapshot.data.documents[index]),

                        );
                      }
                  ),
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

void errorNames() {
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