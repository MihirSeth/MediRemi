import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:healthreminders/LabTests/sucess_screen_labtests.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'LabTests.dart';
import 'LabTestsDatabase.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;


class AddLabTests extends StatefulWidget {
  @override
  _AddLabTestsState createState() => _AddLabTestsState();
}

class _AddLabTestsState extends State<AddLabTests> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 String _labtestName;
  String _labtestAddress;
  String _time;
  String _timeType;
  String _reasonLabTest;
  String _dayLabTest;
  String _dateLabTest;
  String _monthLabTest;
  String _yearLabTest;
  final _timeDatabase = DateTime.now();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  String labtestName;
  String labtestTime;
  int labtestDate;
  int labtestMonth;
  int labtestYear;
  String labtestLocation;


  void getInfoMedicine () async{
    var medicineDetails = Firestore.instance.collection('LabTests').where('uid',  isEqualTo: uid);
    medicineDetails.getDocuments().then((data) {
      if (data.documents.length > 0) {
        setState(() {
          labtestName = data.documents[0].data['Lab Tests Name'];
          labtestTime = data.documents[0].data['Time'];
          labtestDate = data.documents[0].data['Date of Lab Test'];
          labtestMonth = data.documents[0].data['Date of Lab Test'];
          labtestYear = data.documents[0].data['Date of Lab Test'];
          labtestLocation = data.documents[0].data['Address of Lab Test'];

        }
        );
      }
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Lab Tests",
          style: TextStyle(
              fontFamily: 'Monster'
          ),
        ),
      ),
      body:
      ListView(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(top: 15, left: 25, right: 25),
                    child:
                    Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 200),
                            child: Text(
                                'Lab Tests Name',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                )
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding:  EdgeInsets.only(top: 20),
                                    child: CircleAvatar(
                                      child:
                                      Icon(
                                        Icons.assessment,
                                        size: 25,
                                        color: Colors.white,
                                      ),

                                      backgroundColor: Colors.black,
                                      radius: 20,
                                    ),
                                  )
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Container(
                                child:
                                Expanded(
                                  flex: 7,
                                  child: TextFormField(
                                      validator: (input) {
                                        if (input.isEmpty) {
                                          return 'Please type the Lab Test Name';
                                        } return '';
                                      },
                                      onSaved: (input) => _labtestName = input,
                                      decoration: InputDecoration(

                                        hintText: "Name",
                                        hintStyle: TextStyle(
                                          fontFamily: "Monster",
                                          color: Colors.grey,
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.teal),),
                                      )
                                  ),
                                ),
                              ),
                            ],
                          )

                        ],
                      ),


                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 90),
                  child: Text(
                      "The Address of the Lab Test",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,

                      )
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.only(top:0, left: 25, right: 25),

                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding:  EdgeInsets.only(bottom: 10),
                            child: CircleAvatar(
                              child:
                              Icon(
                                Icons.location_on,
                                size: 25,
                                color: Colors.white,
                              ),

                              backgroundColor: Colors.black,
                              radius: 20,
                            ),
                          )
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        child:
                        Expanded(
                          flex: 7,
                          child: TextFormField(
                              validator: (input) {
                                if (input.isEmpty) {
                                  return 'Please type the Lab Test Address';
                                }return '';
                              },
                              onSaved: (input) => _labtestAddress = input,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "Address",
                                hintStyle: TextStyle(
                                  fontFamily: "Monster",
                                  color: Colors.grey,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal),),
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    child: Column(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 320),
                              child:
                              Text(
                                  "Time",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top:0, left: 25, right: 25),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 17, ),
                                      child: TextFormField(
                                          validator: (input) {
                                            if (input.isEmpty) {
                                              return 'Please type the Lab Test Time';
                                            } return '';
                                          },
                                          onSaved: (input) => _time = input,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            hintText: "Time (Hours:Minutes)",
                                            hintStyle: TextStyle(
                                              fontFamily: "Monster",
                                              color: Colors.grey,
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: Colors.teal),),

                                          )
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 0, left: 0),
                                      child: DropdownButton<String>(
                                        underline: Container(
                                          height: 2,
                                          color: Colors.teal,
                                        ),
                                        hint: Text(
                                          'AM/PM?',
                                          style: TextStyle(
                                              color: Colors.grey
                                          ),
                                        ),
                                        value: _timeType,
                                        items: [
                                          DropdownMenuItem<String>(
                                              child:Text('AM', style: TextStyle(color: Colors.teal),
                                              ),
                                              value: 'AM'
                                          ),
                                          DropdownMenuItem<String>(
                                              child:Text('PM', style: TextStyle(color: Colors.teal),
                                              ),
                                              value: 'PM'
                                          ),
                                        ],
                                        onChanged: (String newValue) {
                                          setState(() {
                                            _timeType = newValue;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],

                              ),
                            )

                          ],
                        ),
                      ],
                    )
                ),
                SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: EdgeInsets.only(right: 130),
                  child: Text(
                      "Reason for the Lab Test",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,

                      )
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.only(top:0, left: 25, right: 25),

                  child: Row(
                    children: <Widget>[
                      Container(
                        child:
                        Expanded(

                          child: TextFormField(
                              validator: (input) {
                                if (input.isEmpty) {
                                  return 'Please type the Lab Test Reason';
                                } return '';
                              },
                              onSaved: (input) => _reasonLabTest = input,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "Reason",
                                hintStyle: TextStyle(
                                  fontFamily: "Monster",
                                  color: Colors.grey,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal),),
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: EdgeInsets.only(right: 170),
                  child: Text(
                      "Day of Appoinment",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,

                      )
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.only(top:0, left: 25, right: 200),

                  child: Row(
                    children: <Widget>[
                      Container(
                        child:
                        Expanded(

                          child: DropdownButton<String>(
                            underline: Container(
                              height: 2,
                              color: Colors.teal,
                            ),
                            hint: Text(
                              'Day',
                              style: TextStyle(
                                  color: Colors.grey
                              ),
                            ),
                            value: _dayLabTest,
                            items: [
                              DropdownMenuItem<String>(
                                  child:Text('Monday', style: TextStyle(color: Colors.black),
                                  ),
                                  value: 'Monday'
                              ),
                              DropdownMenuItem<String>(
                                  child:Text('Tuesday', style: TextStyle(color: Colors.black),
                                  ),
                                  value: 'Tuesday '
                              ),
                              DropdownMenuItem<String>(
                                  child:Text('Wednesday', style: TextStyle(color: Colors.black),
                                  ),
                                  value: 'Wednesday'
                              ),
                              DropdownMenuItem<String>(
                                  child:Text('Thursday', style: TextStyle(color: Colors.black),
                                  ),
                                  value: 'Thursday'
                              ),
                              DropdownMenuItem<String>(
                                  child:Text('Friday', style: TextStyle(color: Colors.black),
                                  ),
                                  value: 'Friday'
                              ),
                              DropdownMenuItem<String>(
                                  child:Text('Saturday', style: TextStyle(color: Colors.black),
                                  ),
                                  value: 'Saturday'
                              ),
                              DropdownMenuItem<String>(
                                  child:Text('Sunday', style: TextStyle(color: Colors.black),
                                  ),
                                  value: 'Sunday'
                              ),
                            ],
                            onChanged: (String newValue) {
                              setState(() {
                                _dayLabTest = newValue;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: EdgeInsets.only(right: 170),
                  child: Text(
                      "Date of Appoinment",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,

                      )
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.only(top:0, left: 25, right: 25),

                  child: Row(
                    children: <Widget>[
                      Container(
                        child:
                        Expanded(

                          child: TextFormField(
                              validator: (input) {
                                if (input.isEmpty) {
                                  return 'Please type the Date';
                                } return '';
                              },
                              onSaved: (input) => _dateLabTest = input,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "Date",
                                hintStyle: TextStyle(
                                  fontFamily: "Monster",
                                  color: Colors.grey,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal),),
                              )
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        child:
                        Expanded(
                          child: TextFormField(
                              validator: (input) {
                                if (input.isEmpty) {
                                  return 'Please type the Month';
                                } return '';
                              },
                              onSaved: (input) => _monthLabTest = input,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "Month",
                                hintStyle: TextStyle(
                                  fontFamily: "Monster",
                                  color: Colors.grey,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal),),
                              )
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        child:
                        Expanded(
                          child: TextFormField(
                              validator: (input) {
                                if (input.isEmpty) {
                                  return 'Please type the Year';
                                } return '';
                              },
                              onSaved: (input) => _yearLabTest = input,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "Year",
                                hintStyle: TextStyle(
                                  fontFamily: "Monster",
                                  color: Colors.grey,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal),),
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  height: 50,
                  width: 250,
                  child: Material(
                    borderRadius: BorderRadius.circular(1000),
                    shadowColor: Colors.tealAccent,
                    color: Colors.teal,
                    elevation: 7.0,
                    child: FlatButton(
                        onPressed: () async{
                          final _form = _formKey.currentState;
                          if (_form.validate()) {
                            _form.save();

                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
                                SuccessScreenLabTests()));


                            String _uid = await getCurrentUser();

                            await DatabaseService().labtestData(
                                _labtestName,
                                _labtestAddress,
                                 _time,
                                 _timeType,
                                 _reasonLabTest,
                                 _dayLabTest,
                                 _dateLabTest,
                                _monthLabTest,
                                _yearLabTest,
                                _timeDatabase,
                                _uid
                            );
                          }

                        },
                        child: Center(
                          child: Text(
                            "Done",
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
        ],
      ),

    );
  }
  Future<void> scheduleNotification(LabTests labTests) async {
    var vibrationPattern = Int64List(4);
    vibrationPattern[0] = 0;
    vibrationPattern[1] = 1000;
    vibrationPattern[2] = 5000;
    vibrationPattern[3] = 2000;
    var scheduledNotificationDateTime =
    DateTime.utc(labtestYear, labtestMonth, labtestYear,7,0,0,0,0).add(Duration(seconds: 5));
    var androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'your other channel id',
      'your other channel name',
      'your other channel description',
      sound: RawResourceAndroidNotificationSound('notification'),
      importance: Importance.Max,
      priority: Priority.High,
      showWhen: true,
    );
    var iOSPlatformChannelSpecifics =
    IOSNotificationDetails(sound: 'notification.aiff');
    NotificationDetails platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.schedule(
        0,
        'Reminder for Lab Test',
        'Today is your Lab Test for $labtestName at $labtestTime and the location is $labtestLocation. ',
        scheduledNotificationDateTime,
        platformChannelSpecifics);
  }
}
Future getCurrentUser() async {
  final FirebaseUser user = await _auth.currentUser();
  final _uid = user.uid;
  print(_uid);
  return _uid.toString();
}