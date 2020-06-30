import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthreminders/Doctors/Appoinments.dart';
import 'package:healthreminders/Doctors/BuildListItemAppoinments.dart';
import 'package:healthreminders/Doctors/BuildListItemDoctors.dart';
import 'package:healthreminders/Doctors/Doctors.dart';
import 'package:healthreminders/LabTests/BuildListItemLabTests.dart';
import 'package:healthreminders/LabTests/LabTests.dart';
import 'package:healthreminders/MainPages/Medicine.dart';
import 'package:healthreminders/MedicineReminders/Models/BuildListItemMedicines.dart';
import 'package:healthreminders/Models/User.dart';
import 'package:healthreminders/Models/loading.dart';
import 'package:healthreminders/StartupPages/SignUp.dart';
import 'package:healthreminders/StartupPages/WelcomePage.dart';
import 'package:provider/provider.dart';
import 'package:scrolling_day_calendar/scrolling_day_calendar.dart';
import 'package:healthreminders/Models/buildListItem(NameEmail).dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final databaseReference = Firestore.instance;
final uid =  _auth.currentUser();



class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> attachments = [];
  bool isHTML = false;

  final _recipientController = TextEditingController(
    text: 'example@example.com',
  );

  final _subjectController = TextEditingController(text: 'The subject');

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

//  int selectedDay;

  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e); //
    }
  }

//  Widget pageItems = Text('');
//  DateTime selectedDate = DateTime.now();
//  DateTime startDate = DateTime.now().subtract(Duration(days: 31));
//  DateTime endDate = DateTime.now().add(Duration(days: 31));
//  String widgetKeyFormat = "dd-MM-yyyy";
//  Map<String, Widget> widgets = Map();


  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Home Screen",
              style: TextStyle(
                  fontFamily: 'Monster'
              ),
            ),
          ),
          backgroundColor: Colors.teal,
        ),

      body:ListView(
        children: [
          Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 15, right: 185, top: 20),
                child: Text(
                  "Your Reminders:",
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
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  children: <Widget>  [
                    StreamBuilder<QuerySnapshot>(
                        stream: Firestore.instance.collection('Medicines')
                            .where('uid',  isEqualTo: user.uid)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData)
                            return Padding(
                                padding: EdgeInsets.only(top: 250, left: 75),
                                child: Text(
                                    'Fetching your Reminders...',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                    )
                                )
                            );
                          else errorMedicine(context);
                          return Expanded(
                            child: SizedBox(
                              height: 700,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data.documents.length,
                                itemBuilder: (context, index) =>
                                    buildListItemMedicine(
                                        context,
                                        snapshot.data.documents[index]),
                              ),
                            ),
                          );
                        }
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  children: <Widget>[
                    StreamBuilder<QuerySnapshot>(
                        stream: Firestore.instance.collection("Doctors")
                            .where('uid',  isEqualTo: user.uid)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData)
                            return Padding(
                                padding: EdgeInsets.only(top: 150, right: 25),
                                child: Text(
                                    '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                    )
                                )
                            );
                          else errorDoctors(context);
                          return Expanded(
                            child: SizedBox(
                              height: 700,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data.documents.length,
                                itemBuilder: (context, index) =>
                                    buildListItemDoctors(
                                        context,
                                        snapshot.data.documents[index]),
                              ),
                            ),
                          );
                        }
                        ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  children: <Widget>[
                    StreamBuilder<QuerySnapshot>(
                        stream: Firestore.instance.collection("Appoinments")
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData)
                            return Text('');
                          else errorAppoinments(context);
                          return Expanded(
                            child: SizedBox(
                              height: 700,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data.documents.length,
                                itemBuilder: (context, index) =>
                                    buildListItemAppoinments(
                                        context,
                                        snapshot.data.documents[index]),
                              ),
                            ),
                          );
                        }
                        ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  children: <Widget>[
                    StreamBuilder<QuerySnapshot>(
                        stream: Firestore.instance.collection("LabTests")
                            .where('uid',  isEqualTo: user.uid)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData)
                            return Padding(
                                padding: EdgeInsets.only(top: 150, right: 25),
                                child: Text(
                                    '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                    )
                                )
                            );
                          else errorLabTests(context);
                          return Expanded(
                            child: SizedBox(
                              height: 700,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data.documents.length,
                                itemBuilder: (context, index) =>
                                    buildListItemLabTests(
                                        context,
                                        snapshot.data.documents[index]),
                              ),
                            ),
                          );
                        }
                        ),
                  ],
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
                      stream: Firestore.instance.collection("Users").snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData)
                          return Text('Loading...');
                        else googleName();
                          Loading();
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


//  Widget widgetBuilder(DateTime selectedDate) {
//    Container(
//      alignment: Alignment.bottomCenter,
//      height: 60,
//      width: 250,
//      child: Material(
//        borderRadius: BorderRadius.circular(1000),
//        shadowColor: Colors.tealAccent,
//        color: Colors.teal,
//        elevation: 7.0,
//        child: FlatButton(
//            onPressed: () {
//              Navigator.push(
//                  context, MaterialPageRoute(builder: (context) => AddMedicine()));
//            },
//            child: Center(
//              child: Text(
//                "Add a Med",
//                style: TextStyle(
//                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
//                  fontFamily: "Monster",
//                  fontSize: 20.0,
//
//                ),
//              ),
//            )
//        ),
//      ),
//    );
//  }
//}



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
}