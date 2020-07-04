import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:healthreminders/Doctors/success_screen_appoinments.dart';

import 'Appoinments.dart';
import 'Services/AppoinmentDatabase.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;


class AddAppoinments extends StatefulWidget {
  @override
  _AddAppoinmentsState createState() => _AddAppoinmentsState();
}

class _AddAppoinmentsState extends State<AddAppoinments> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _doctorsName;
  String _appoinmentReason;
  String _doctorAddress;
  String _time;
  String _timeType;
  String _dayAppoinment;
  String _dateAppoinment;
  String _monthAppoinment;
  String _yearAppoinment;

  final _timeDatabase = DateTime.now();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  String appoinmentDoctorName;
  String appoinmentTime;
  int appoinmentDate;
  int appoinmentMonth;
  int appoinmentYear;


  void getInfoMedicine () async{
    var medicineDetails = Firestore.instance.collection('Appoinments').where('uid',  isEqualTo: uid);
    medicineDetails.getDocuments().then((data) {
      if (data.documents.length > 0) {
        setState(() {
          appoinmentDoctorName = data.documents[0].data['Doctor Name'];
          appoinmentTime = data.documents[0].data['Time'];
          appoinmentDate = data.documents[0].data['Date of Appoinment'];
          appoinmentMonth = data.documents[0].data['Date of Appoinment'];
          appoinmentYear = data.documents[0].data['Date of Appoinment'];

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
          "Add Appoinments",
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
                            padding: EdgeInsets.only(right: 220),
                            child: Text(
                                'Doctor Name',
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
                                      ImageIcon(
                                        AssetImage(
                                          'assets/Doctor.png',
                                        ),
                                        size: 40,
                                        color: Colors.white,
                                      ),
                                      backgroundColor: Colors.black,
                                      radius: 30,
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
                                          return 'Please type the Doctor Name';
                                        }
                                      },
                                      onSaved: (input) => _doctorsName = input,
                                      decoration: InputDecoration(

                                        hintText: "Appoinment Name",
                                        hintStyle: TextStyle(
                                          fontFamily: "Monster",
                                          fontWeight: FontWeight.bold,
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
                  padding: EdgeInsets.only(right: 170),
                  child: Text(
                      "Appoinment Details",
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
                                Icons.edit,
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
                                  return 'Please type the Appoinment Details';
                                }
                              },
                              onSaved: (input) => _appoinmentReason = input ,
                              decoration: InputDecoration(
                                hintText: "Appoinment Details",
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
                  padding: EdgeInsets.only(right: 270),
                  child: Text(
                      "Location",
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
                                  return 'Please type the Doctors address';
                                }
                              },
                              onSaved: (input) => _doctorAddress = input,
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
                  height: 30.0,
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
                                              return 'Please type the Time';
                                            }
                                          },
                                          onSaved: (input) => _time = input,
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
                                              child:Text('AM', style: TextStyle(color: Colors.black),
                                              ),
                                              value: 'AM'
                                          ),
                                          DropdownMenuItem<String>(
                                              child:Text('PM', style: TextStyle(color: Colors.black),
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
                  height: 15,
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
                  height: 5,
                ),
                Container(
                  padding: EdgeInsets.only(top:0, left: 25, right: 260),

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
                            value: _dayAppoinment,
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
                                _dayAppoinment = newValue;
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
                  padding: EdgeInsets.only(top:0, left: 20, right: 150),

                  child: Row(
                    children: <Widget>[
                      Container(
                        child:
                        Expanded(

                          child: TextFormField(
                              validator: (input) {
                                if (input.isEmpty) {
                                  return 'Please type the Date';
                                }
                              },
                              onSaved: (input) => _dateAppoinment = input,
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
                                }
                              },
                              onSaved: (input) => _monthAppoinment = input,
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
                                }
                              },
                              onSaved: (input) => _yearAppoinment = input,
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
                        onPressed: () async {
                          final _form = _formKey.currentState;
                          if (_form.validate()) {
                            _form.save();

                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
                                SuccessScreenAppoinments()));

                            String _uid = await getCurrentUser();

                            await DatabaseService().appoinmentData(
                              _doctorsName,
                             _appoinmentReason,
                             _doctorAddress,
                             _time,
                              _timeType,
                              _dayAppoinment,
                              _dateAppoinment,
                              _monthAppoinment,
                              _yearAppoinment,
                              _timeDatabase,
                              _uid,
                            );
                          }
                          scheduleNotificationAppoinments();
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

  Future<void> scheduleNotificationAppoinments() async {
    var vibrationPattern = Int64List(4);
    vibrationPattern[0] = 0;
    vibrationPattern[1] = 1000;
    vibrationPattern[2] = 5000;
    vibrationPattern[3] = 2000;
    var scheduledNotificationDateTime =
    DateTime.utc(appoinmentYear, appoinmentMonth, appoinmentYear,7,0,0,0,0).add(Duration(seconds: 5));
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
          'Appoinment Reminder with $appoinmentDoctorName',
          'Today is your Appoinment with $appoinmentDoctorName at $appoinmentTime. ',
        scheduledNotificationDateTime,
        platformChannelSpecifics);
}


Future getCurrentUser() async {
  final FirebaseUser user = await _auth.currentUser();
  final _uid = user.uid;
  print(_uid);
  return _uid.toString();
}}