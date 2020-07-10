import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:healthreminders/Doctors/Appointments.dart';
import 'package:healthreminders/Doctors/Doctors.dart';
import 'package:healthreminders/LabTests/LabTests.dart';
import 'package:healthreminders/MainPages/Medicine.dart';
import 'package:healthreminders/MainPages/Steps.dart';
import 'package:healthreminders/MainPages/home.dart';
import 'package:healthreminders/Models/User.dart';
import 'package:healthreminders/Notes/Notes.dart';
import 'package:healthreminders/StartupPages/WelcomePage.dart';
import 'package:healthreminders/Models/BuildListItemNameEmail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthreminders/StartupPages/SignUp.dart';
import 'package:provider/provider.dart';
import 'package:flutter_share_me/flutter_share_me.dart';




final FirebaseAuth _auth = FirebaseAuth.instance;
final uid =  _auth.currentUser();


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
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  List<String> attachments = [];
  bool isHTML = false;

  final _recipientController = TextEditingController(
    text: 'example@example.com',
  );

  final _subjectController = TextEditingController(text: 'Reminder');

  final _bodyController = TextEditingController(
    text: 'Mail body.',
  );

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> send() async {
    final Email email = Email(
      body: _bodyController.text,
      subject: _subjectController.text,
      recipients: [_recipientController.text],
      attachmentPaths: attachments,
      isHTML: isHTML,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      platformResponse = error.toString();
    }

    if (!mounted) return;

    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(platformResponse),
    ));
  }
  String msg = 'Download my Medicine Reminders App through https://drive.google.com/file/d/1IGeEAbc4UlmIIO0cJT5RJ310RMlHuSPi/view?usp=sharing';


  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return Scaffold(
//      backgroundColor: Colors.black,
      appBar: AppBar(
        title:  Center(
            child: Text(
                  "More Options",
                  style: TextStyle(
                      fontFamily: 'Monster'
                  ),
                ),
          ),
        backgroundColor: Colors.teal,
      ),


        body: ListView(
          children: [
            Column(
              children: <Widget>[
                Container(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.person_add),
                            title: Text('Doctors'),
                            onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return Doctors();
                                    },
                                  ),
                                );
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.add_circle),
                            title: Text('Appointments'),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Appointments();
                                  },
                                ),
                              );
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.assessment),
                              title: Text('Lab Tests'),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return LabTests();
                                  },
                                ),
                              );
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.assignment),
                            title: Text('Notes'),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Notes();
                                  },
                                ),
                              );
                            },
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 20, left: 20),
                            child: Divider(
                              color: Colors.blueGrey,
                              thickness: 2,
                            ),
                          ),
                          ListTile(
                              leading: ImageIcon(
                                  AssetImage('assets/Whatsapp.png'),
                                  color: Colors.green
                              ),
                              title: Text('Share us on WhatsApp'),
                              onTap: () {
                                FlutterShareMe()
                                    .shareToWhatsApp(msg: msg);
                              }
                          ),
                          ListTile(
                              leading: Icon(Icons.email),
                              title: Text('Share us'),
                            onTap: () async {
                              FlutterShareMe()
                                  .shareToSystem(msg: msg);
                              FirebaseUser user = await FirebaseAuth.instance.currentUser();
                              user.delete();
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.delete),
                            title: Text('Delete Account'),
                            onTap: () async {
                              AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                elevation: 5,
                                title: Center(child: Text('Alert')),
                                titleTextStyle: TextStyle(
                                  color: Colors.teal,
                                  fontFamily: 'Monster',
                                  fontSize: 20.0,
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                                content: Text('Are you sure you want to delete your account. Please delete all your data before moving on with deleting your Account.'),
                                contentTextStyle: TextStyle(
                                  fontFamily: 'Monster',
                                  color: Colors.black,
                                ),
                                actions: [
                                  FlatButton(
                                    onPressed: () async {
                                      FirebaseUser user = await FirebaseAuth.instance.currentUser();
                                      user.delete();
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return LoginPage();
                                          },
                                        ),
                                      );
                                         },
                                    child: Text('Delete your Account'),
                                  ),
                                  FlatButton(
                                    onPressed: () async {
                                      Navigator.of(context).pop(
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return Home();
                                          },
                                        ),
                                      );
                                      },
                                    child: Text('Go back to the screen to delete your Documents'),
                                  ),
                                ],
                              );
                            },
                          ),
//                          ListTile(
//                            leading: Icon(Icons.directions_walk),
//                            title: Text('Steps'),
//                            onTap: () {
//                              Navigator.of(context).push(
//                                MaterialPageRoute(
//                                  builder: (context) {
//                                    return Steps();
//                                  },
//                                ),
//                              );
//                        }
//                        )
                        ]
                    ),
                  ),
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
                              leading: Icon(Icons.email),
                              title: Text('Email'),
                            onTap: () {
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


errorNames() {
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

