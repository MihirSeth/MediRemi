import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthreminders/Doctors/Appointments.dart';
import 'package:healthreminders/Doctors/BuildListAppointmentsHomePage.dart';
import 'package:healthreminders/Doctors/BuildListItemAppointments.dart';
import 'package:healthreminders/Doctors/BuildListItemDoctors.dart';
import 'package:healthreminders/Doctors/Doctors.dart';
import 'package:healthreminders/LabTests/BuildListItemLabTestHomePage.dart';
import 'package:healthreminders/LabTests/BuildListItemLabTests.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:healthreminders/LabTests/LabTests.dart';
import 'package:healthreminders/MainPages/Medicine.dart';
import 'package:healthreminders/MedicineReminders/BuildListMedicineHomePage.dart';
import 'package:healthreminders/MedicineReminders/Models/BuildListItemMedicines.dart';
import 'package:healthreminders/Models/User.dart';
import 'package:healthreminders/Models/loading.dart';
import 'package:healthreminders/StartupPages/SignUp.dart';
import 'package:healthreminders/StartupPages/WelcomePage.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:scrolling_day_calendar/scrolling_day_calendar.dart';
import 'package:healthreminders/Models/buildListItem(NameEmail).dart';
import 'package:intl/intl.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final databaseReference = Firestore.instance;
final uid =  _auth.currentUser();



class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  get data => StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('Medicines')
          .where('uid', isEqualTo: uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Padding(
              padding: EdgeInsets.only(
                  top: 250, left: 75),
              child: Text(
                  'Fetching your Medicines...',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  )
              )
          );
        else
          errorMedicine(context);
        return Expanded(
          child: SizedBox(
            height: 700,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) =>
                  buildListItemMedicineHomePage(
                      context,
                      snapshot.data.documents[index]),

            ),
          ),
        );}
  );
  int selectedDay;

  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e); //
    }
  }
  Stream getData() {
    Stream stream1 = Firestore.instance.collection('Medicines').where('uid', isEqualTo: uid).snapshots();
    Stream stream2 = Firestore.instance.collection('Appointments').where('uid', isEqualTo: uid).snapshots();

    return Observable.merge(([stream1, stream2]));
  }

  Widget pageItems = Text('');
  DateTime selectedDate = DateTime.now();
  DateTime startDate = DateTime.now().subtract(Duration(days: 31));
  DateTime endDate = DateTime.now().add(Duration(days: 31));
  String widgetKeyFormat = "dd/MM/yyyy";
  Map<String, Widget> widgets = Map();


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

        body: ListView(
          children: [
            Column(
              children: <Widget>[
//                ScrollingDayCalendar(
//                    startDate: startDate,
//                    endDate: endDate,
//                    selectedDate: selectedDate,
//                    onDateChange: (direction, DateTime selectedDate) {
//                      setState(() {
//                        pageItems = widgetBuilder(selectedDate);
//                      });
//                    },
//                    dateStyle: TextStyle(
//                      fontWeight: FontWeight.bold,
//                      color: Colors.white,
//                    ),
//                    displayDateFormat: "dd MMM, yyyy",
//                    dateBackgroundColor: Colors.grey,
//                    forwardIcon: Icons.arrow_forward,
//                    backwardIcon: Icons.arrow_back,
//                    pageChangeDuration: Duration(
//                      milliseconds: 200,
//                    ),
//                    pageItems: pageItems,
//                    widgets: widgets,
//                    widgetKeyFormat: widgetKeyFormat,
//                    noItemsWidget:
//                    Center(
//                        child: Container(
//                          child: Text(
//                            'NO REMINDERS ADDED. ADD REMINDERS TO BEGIN',
//                            style: TextStyle(
//                                color: Colors.teal
//                            ),
//                          ),
//                        )
//                    )
//                ),

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
                SizedBox(
                  height: 10,
                ),

                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        StreamBuilder<QuerySnapshot>(
                            stream: getData(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData)
                                return Padding(
                                    padding: EdgeInsets.only(
                                        top: 250, left: 75),
                                    child: Text(
                                          'Fetching your Reminders...',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.0,
                                        )
                                    )
                                );

                              return Expanded(
                                child: SizedBox(
                                  height: 700,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: snapshot.data.documents.length,
                                    itemBuilder: (context, index) =>
                                        buildListItemMedicineHomePage(
                                            context,
                                            snapshot.data.documents[index]),

                                  ),
                                ),
                              );
                            }
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        StreamBuilder<QuerySnapshot>(
                            stream: Firestore.instance.collection('Appointments')
                                .where('uid', isEqualTo: uid)
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData)
                                return Text(
                                  '',
                                );
                              else
                                errorMedicine(context);
                              return Expanded(
                                child: SizedBox(
                                  height: 700,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: snapshot.data.documents.length,
                                    itemBuilder: (context, index) =>
                                        buildListItemAppointmentsHomePage(
                                            context,
                                            snapshot.data.documents[index]),

                                  ),
                                ),
                              );
                            }
                        ),
                      ],

                    )
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
                          .where('uid', isEqualTo: user.uid)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData)
                          return Text('Loading...');
                        else
                          googleName();
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


  void errorNames() {
    Column(
        children: <Widget>[
          Text(
              'Signed Up with not enough information. Go back to sign up page and sign up again'
          ),

          InkWell(
              onTap: () {
                BuildContext context;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignupPage()));
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

  Widget widgetBuilder(DateTime selectedDate) {
    String dateString = DateFormat(widgetKeyFormat).format(selectedDate);
    if (data.containsKey(dateString)) {
      List items = data[dateString];
      return ListView(
        children: [
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  StreamBuilder<QuerySnapshot>(
                      stream: Firestore.instance.collection('Appointments')
                          .where('uid', isEqualTo: uid)
                          .where('Date of Appointment', isEqualTo: dateString)
                          .where('Month of Appointment', isEqualTo: dateString)
                          .where('Year of Appointment', isEqualTo: dateString)

                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData)
                          return Padding(
                              padding: EdgeInsets.only(
                                  top: 250, left: 75),
                              child: Text(
                                  'Fetching your Reminders...',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                  )
                              )
                          );
                        else
                          errorMedicine(context);
                        return Expanded(
                          child: SizedBox(
                            height: 700,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data.documents.length,
                              itemBuilder: (context, index) =>
                                  buildListItemAppointmentsHomePage(
                                      context,
                                      snapshot.data.documents[index]),

                            ),
                          ),
                        );
                      }
                  ),
                ],

              )
            ],


          ),
        ],
      );
    }
  }
}