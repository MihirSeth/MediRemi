import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthreminders/Pages/WelcomePage.dart';
import 'package:scrolling_day_calendar/scrolling_day_calendar.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;
Widget _pageItems = Text("Inital value");
DateTime selectedDate = DateTime.now();
DateTime startDate = DateTime.now().subtract(Duration(days: 10));
DateTime endDate = DateTime.now().add(Duration(days: 10));
Map<String, Widget> widgets = Map();
String widgetKeyFormat = "dd-MM-yyyy";




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
    return  Scaffold(
        appBar: AppBar(
          title: Padding(
              padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
              child: Text(
                "Home Screen",
                style: TextStyle(
                    fontFamily: 'Monster'
                ),
              )
          ),
          backgroundColor: Colors.teal,
//
        ),

      body: ScrollingDayCalendar(
        startDate: startDate,
        endDate: endDate,
        selectedDate: selectedDate,
//        onDateChange: (direction, DateTime selectedDate) {
//          setState(() {
//            pageItems = _widgetBuilder(selectedDate);
//          });
//        },
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
          child: Text("No items have been added for this date"), // add buttons etc here to add new items for date
        ),
      ),


        drawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
//                  child: StreamBuilder(
//                    stream: Firestore.instance.collection('Names and Email').snapshots(),
//                    builder: (context,snapshot) {
//                      if (!snapshot.hasData) return Text('Loading...');
//                      ListView.builder(
//                          itemExtent: 80.0,
//                        itemCount: snapshot.data.doc.documents.length,
//                        itemBuilder: (context,index) =>
//                            _buildListItem(context,snapshot.data.documents[index]),
//                      );
//                    }
//                  ),
                child: Center(
                  child: Text(
                      '$Names',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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

Widget _widgetBuilder(DateTime selectedDate) {
}

//Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
//  return Column(
//    children: <Widget>[
//      Text(
//        document['Names and Email'].toString(),
//      ),
//    ],
//  );
//}

class Names {
  String Name, Email;

  Names({this.Name, this.Email});
  factory Names.fromJSON(Map<dynamic, dynamic> user) =>  Names(Name: user["Name"], Email: user["Email"]);
}

Future<List<Names>> users = Firestore.instance.collection("Names").snapshots().asyncMap((users) {
  return users.documents.map((user) => Names.fromJSON(user.data)).toList();
}).single;