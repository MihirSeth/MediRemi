import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthreminders/MedicineReminders/AddMedicine.dart';
import 'package:healthreminders/Models/loading.dart';
import 'package:healthreminders/StartupPages/SignUp.dart';
import 'package:healthreminders/StartupPages/WelcomePage.dart';
import 'package:scrolling_day_calendar/scrolling_day_calendar.dart';
import 'package:healthreminders/Services/Database.dart';
import 'package:healthreminders/Models/buildListItem(NameEmail).dart';

final FirebaseAuth _auth = FirebaseAuth.instance;



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedDay;

  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e); //
    }
  }

  Widget pageItems = Text('');
  DateTime selectedDate = DateTime.now();
  DateTime startDate = DateTime.now().subtract(Duration(days: 31));
  DateTime endDate = DateTime.now().add(Duration(days: 31));
  String widgetKeyFormat = "dd-MM-yyyy";
  Map<String, Widget> widgets = Map();


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
            ),
          ),
          backgroundColor: Colors.teal,
        ),

      body: ScrollingDayCalendar(
        startDate: startDate,
        endDate: endDate,
        selectedDate: selectedDate,
        onDateChange: (direction, DateTime selectedDate) {
          setState(() {
            pageItems = widgetBuilder(selectedDate);
          });
        },
        dateStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        displayDateFormat: "dd MMM, yyyy",
        dateBackgroundColor: Colors.grey,
        forwardIcon: Icons.arrow_forward,
        backwardIcon: Icons.arrow_back,
        pageChangeDuration: Duration(
          milliseconds: 200,
        ),
          pageItems: pageItems,
        widgets: widgets,
        widgetKeyFormat: widgetKeyFormat,
        noItemsWidget: Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
               Container(
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
                                context, MaterialPageRoute(builder: (context) => AddMedicine()));
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

              ],
            ),
          ),
        )

        ),



        drawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: Firestore.instance.collection("Names").snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData)
                          return Text('Loading...');
                        else ErrorNames();
                          Loading();
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


  Widget widgetBuilder(DateTime selectedDate) {
    Container(
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
                  context, MaterialPageRoute(builder: (context) => AddMedicine()));
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