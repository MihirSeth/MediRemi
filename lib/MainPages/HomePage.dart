import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  Widget pageItems = Text("Inital value");
  DateTime selectedDate = DateTime.now();
  DateTime startDate = DateTime.now().subtract(Duration(days: 10));
  DateTime endDate = DateTime.now().add(Duration(days: 10));
  String widgetKeyFormat = "yyyy-MM-dd";

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
//


        body: ScrollingDayCalendar(
          startDate: startDate,
          endDate: endDate,
          selectedDate: selectedDate,
          onDateChange: (direction, DateTime selectedDate) {
            setState(() {
              pageItems = _widgetBuilder(selectedDate);
            });
          },
          dateStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          pageItems: pageItems,
          displayDateFormat: "dd/MM/yyyy",
          dateBackgroundColor: Colors.grey,
          forwardIcon: Icons.arrow_forward,
          backwardIcon: Icons.arrow_back,
          pageChangeDuration: Duration(
            milliseconds: 400,
          ),
          noItemsWidget: Center(
            child: Text(
                "No items have been added for this date"), // add buttons etc here to add new items for date
          ),
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


  Widget _widgetBuilder(DateTime selectedDate) {
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