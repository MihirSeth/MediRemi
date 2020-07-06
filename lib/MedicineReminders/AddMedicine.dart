import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:healthreminders/MainPages/Medicine.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthreminders/MedicineReminders/success_screen_medicines.dart';
import 'DatabaseMedicine.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;

class AddMedicine extends StatefulWidget {
  @override
  _AddMedicineState createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  String _medicineName;
  String _dosage;
  String _pills;
  String _medicineType;
  int _interval;
  String _startingTimeHours;
  String _startingTimeMinutes;
  String _startingTimeType;
  String _durationTime;
  String _durationType;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String dropdownValue = 'Tablet';
  final myController = TextEditingController();
   final _timeDatabase = DateTime.now();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  String medicineName;
  String medicineType;
  String medicineDosage;
  int medicineInterval;
  String medicineStartTimeHours;
  String medicineStartTimeMinutes;
  void getInfoMedicine () async{
    var medicineDetails = Firestore.instance.collection('Medicines').where('uid',  isEqualTo: uid);
    medicineDetails.getDocuments().then((data) {
      if (data.documents.length > 0) {
        setState(() {
          medicineName = data.documents[0].data['Name'];
          medicineType = data.documents[0].data['Type'];
          medicineDosage = data.documents[0].data['Dosage'];
          medicineInterval = data.documents[0].data['Interval'];
          medicineStartTimeHours = data.documents[0].data['Starting Time Hours'];
          medicineStartTimeMinutes = data.documents[0].data['Starting Time Minutes'];
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
      "Add Medicines",
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
                    child: Column(
              children: <Widget>[
              Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 225),

                        child: Text(
                          "Medication Name",
                              style: TextStyle(
                                color: Colors.teal,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,

                              )
                        ),
                      ),

              TextFormField(
                  validator: (input) {
                    if (input.isEmpty) {
                      return 'Please type a Name';
                    }
                  },
                  onSaved: (input) => _medicineName = input,
              decoration: InputDecoration(
                hintText: "Type Medicine or Brand Name",
                hintStyle: TextStyle(
                    fontFamily: "Monster",
                    color: Colors.grey,
                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),),
              )
    ),

                      SizedBox(
                        height: 30.0,
                      ),

                      Padding(
                        padding: EdgeInsets.only(right: 170),
                        child: Text(
                            "Medication Dosage in mg",
                            style: TextStyle(
                              color: Colors.teal,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,

                            )
                        ),
                      ),
                          TextFormField(
                              validator: (input) {
                                if (input.isEmpty) {
                                    return 'Please type the Dosage';
                                }
                              },
                          onSaved: (input) => _dosage = input,
                                    decoration: InputDecoration(
                                    hintText: "Type the Dosage ",
                                    hintStyle: TextStyle(
                                    fontFamily: "Monster",
                                    color: Colors.grey,
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.teal
                                    ),
                                    ),
                          )
                          ),
                      SizedBox(
                        height: 30.0,
                      ),

                      Padding(
                        padding: EdgeInsets.only(right: 155),
                        child: Text(
                            "Number of Pills to be taken",
                            style: TextStyle(
                              color: Colors.teal,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,

                            )
                        ),
                      ),
                      TextFormField(
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Please type the number of pills';
                            }
                          },
                          onSaved: (input) => _pills = input,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Type the Number of pills ",
                            hintStyle: TextStyle(
                              fontFamily: "Monster",
                              color: Colors.grey,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal),),

                          ))
                    ]
              )

    ]
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
                            padding: EdgeInsets.only(right: 250),
                            child:
                              Text(
                                "Medicine Type",
                                style: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                )
                            ),
                          ),
                  Padding(
                    padding: EdgeInsets.only(right: 170),
                    child: DropdownButton<String>(
                      underline: Container(
                        height: 2,
                        color: Colors.teal,
                      ),
                      hint: Text(
                          'Select Medicine Type',
                        style: TextStyle(
                          color: Colors.grey
                        ),
                      ),
                        value: _medicineType,
                        items: [
                          DropdownMenuItem<String>(
                              child: Row(
                                children: <Widget>[
                                  Text(dropdownValue, style: TextStyle(color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 85.0,
                                  ),
                                  ImageIcon(AssetImage('assets/Tablet.png')),
                                ],
                              ),
                              value: 'Tablet'
                          ),
                        DropdownMenuItem<String>(
                          child: Row(
                              children: <Widget>[
                                Text('Pill', style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(
                                  width: 110.0,
                                ),
                                ImageIcon(AssetImage('assets/pill.png')),
                              ],
                          ),
                            value: 'Pill'

                        ),
                        DropdownMenuItem<String>(
                            child: Row(
                              children: <Widget>[
                                Text('Bottle' , style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(
                                  width: 80.0,
                                ),
                                ImageIcon(
                                    AssetImage('assets/Bottle.png'),
                                  size: 35,
                                ),
                              ],
                            ),
                            value: 'Bottle'

                        ),
                        DropdownMenuItem<String>(
                            child: Row(
                              children: <Widget>[
                                Text('Syringe', style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(
                                  width: 65.0,
                                ),
                                ImageIcon(
                                    AssetImage('assets/Syringe.png'),
                                  size: 40,
                                ),
                              ],
                            ),
                            value: 'Syringe'

                        )
                        ],
                              onChanged: (String newValue) {
                              setState(() {
                              _medicineType = newValue;

                              });
                              },
                    ),
                  )

                        ],
                      ),
                    ],
                  )
                  ),
                  SizedBox(
                    height: 25.0,
                  ),

                  Container(
                      child: Column(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 200),
                                child:
                                Text(
                                    "Interval of Reminders",
                                    style: TextStyle(
                                      color: Colors.teal,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    )
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 200),
                                child: DropdownButton<int>(
                                  underline: Container(
                                    height: 2,
                                    color: Colors.teal,
                                  ),
                                  hint: Text(
                                      'Number of Hours',
                                      style: TextStyle(
                                      color: Colors.grey
                                  ),
                                  ),
                                  value: _interval,
                                  items: [
                                    DropdownMenuItem<int>(
                                        child: Row(
                                          children: <Widget>[
                                            Text('2 Hours', style: TextStyle(color: Colors.black),
                                            ),

                                          ],
                                        ),
                                        value: 2
                                    ),
                                    DropdownMenuItem<int>(
                                        child: Row(
                                          children: <Widget>[
                                            Text('4 Hours', style: TextStyle(color: Colors.black),
                                            ),

                                          ],
                                        ),
                                      value: 4

                                    ),
                                    DropdownMenuItem<int>(
                                        child: Row(
                                          children: <Widget>[
                                            Text('6 Hours' , style: TextStyle(color: Colors.black),
                                            ),

                                          ],
                                        ),
                                        value: 6
                                    ),
                                    DropdownMenuItem<int>(
                                        child: Row(
                                          children: <Widget>[
                                            Text('8 Hours', style: TextStyle(color: Colors.black),
                                            ),

                                          ],
                                        ),
                                        value: 8
                                    ),
                                    DropdownMenuItem<int>(
                                        child: Row(
                                          children: <Widget>[
                                            Text('12 Hours', style: TextStyle(color: Colors.black),
                                            ),

                                          ],
                                        ),
                                        value: 12
                                    ),
                                    DropdownMenuItem<int>(
                                        child: Row(
                                          children: <Widget>[
                                            Text('24 Hours', style: TextStyle(color: Colors.black),
                                            ),

                                          ],
                                        ),
                                        value: 24
                                    )
                                  ],
                                  onChanged: (int newValue) {
                                    setState(() {
                                      _interval = newValue;
                                    });
                                  },
                                ),
                              )

                            ],
                          ),
                        ],
                      )
                  ),

                  SizedBox(
                    height: 25.0,
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
                                      color: Colors.teal,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    )
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top:0, left: 25, right: 25),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 17),
                                        child: TextFormField(
                                            validator: (input) {
                                              if (input.isEmpty) {
                                                return 'Please type the Time';
                                              }
                                            },
                                            onSaved: (input) => _startingTimeHours = input,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              hintText: "Hours",
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
                                      width: 15.0,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 10.0),
                                      child: Text(
                                        ':',
                                        style: TextStyle(
                                          fontSize: 30
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15.0,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 17),
                                        child: TextFormField(
                                            validator: (input) {
                                              if (input.isEmpty) {
                                                return 'Please type the Time';
                                              }
                                            },
                                            onSaved: (input) => _startingTimeMinutes = input,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              hintText: "Minutes",
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
                                          value: _startingTimeType,
                                          items: [
                                            DropdownMenuItem<String>(
                                                child:Text('AM', style: TextStyle(color: Colors.blueGrey),
                                                ),
                                                value: 'AM'
                                            ),
                                            DropdownMenuItem<String>(
                                                child:Text('PM', style: TextStyle(color: Colors.blueGrey ),
                                                ),
                                                value: 'PM'
                                            ),
                                          ],
                                          onChanged: (String newValue) {
                                            setState(() {
                                              _startingTimeType = newValue;
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
                    height: 5.0,
                  ),

                  Container(
                      child: Column(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 300),
                                child:
                                Text(
                                    "Duration",
                                    style: TextStyle(
                                      color: Colors.teal,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    )
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top:0, left: 25, right: 25),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 17),
                                        child: TextFormField(
                                            validator: (input) {
                                              if (input.isEmpty) {
                                                return 'Please type the Duration number';
                                              }
                                            },
                                            onSaved: (input) => _durationTime = input,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              hintText: "Number" ,
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
                                      flex: 3,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 0, left: 0),
                                        child: DropdownButton<String>(
                                          underline: Container(
                                            height: 2,
                                            color: Colors.teal,
                                          ),
                                          hint: Text(
                                              'Days/Weeks/Months/Years?',
                                            style: TextStyle(
                                                color: Colors.grey
                                            ),
                                          ),
                                          value: _durationType,
                                          items: [
                                            DropdownMenuItem<String>(
                                                child:Text('Days', style: TextStyle(color: Colors.black),
                                                ),
                                                value: 'Days'
                                            ),
                                            DropdownMenuItem<String>(
                                              child:Text('Weeks', style: TextStyle(color: Colors.black),
                                              ),
                                              value: 'Weeks '
                                            ),
                                            DropdownMenuItem<String>(
                                                child:Text('Months', style: TextStyle(color: Colors.black),
                                                ),
                                                value: 'Months'
                                            ),
                                            DropdownMenuItem<String>(
                                                child:Text('Years', style: TextStyle(color: Colors.black),
                                                ),
                                                value: 'Years'
                                            ),
                                          ],
                                          onChanged: (String newValue) {
                                            setState(() {
                                              _durationType = newValue;
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
                    height: 40,
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
                  try {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) =>
                        SuccessScreenMedicine()));

                    String _uid = await getCurrentUser();
                    await DatabaseService().medicineData(
                      _medicineName,
                      _dosage,
                      _pills,
                      _medicineType,
                      _interval,
                      _startingTimeHours,
                      _startingTimeMinutes,
                      _startingTimeType,
                      _durationTime,
                      _durationType,
                      _uid,
                      _timeDatabase,
                    );
                    scheduleNotificationMedicine();

                  } catch (e) {
                    setState(() {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            // return object of type Dialog
                            return AlertDialog(
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
                              content: Text('There is a error, try again'),
                              contentTextStyle: TextStyle(
                                fontFamily: 'Monster',
                                color: Colors.black,
                              ),
                              actions: <Widget> [
                                FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed('/addmedicine');
                                  },
                                  child: Text('Try Again'),
                                ),
                                FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed('/medicine');
                                  },
                                  child: Text('Cancel Entry'),
                                )
                              ],
                            );
                          }
                      );
                    }
                    );
                  }
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

                ]
              ),
            ),
          ],
        )
    );
 }
  Future<void> scheduleNotificationMedicine() async {
    var vibrationPattern = Int64List(4);
    vibrationPattern[0] = 0;
    vibrationPattern[1] = 1000;
    vibrationPattern[2] = 5000;
    vibrationPattern[3] = 2000;

    var hour = int.parse(_startingTimeHours[0] + _startingTimeHours[1]);
    var ogValue = hour;
    var minute = int.parse(_startingTimeMinutes[2] + _startingTimeMinutes[3]);

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'repeatDailyAtTime channel id',
      'repeatDailyAtTime channel name',
      'repeatDailyAtTime description',
      importance: Importance.Max,
      sound: RawResourceAndroidNotificationSound('notification'),
      ledColor: Color(0xFF3EB16F),
      ledOffMs: 1000,
      ledOnMs: 1000,
      enableLights: true,
    );
    var iOSPlatformChannelSpecifics = IOSNotificationDetails(sound: 'notification.aiff');
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

    for (int i = 0; i < (24 / _interval).floor(); i++) {
      if ((hour + (_interval * i) > 23)) {
        hour = hour + (_interval * i) - 24;
      } else {
        hour = hour + (_interval * i);
      }
      await flutterLocalNotificationsPlugin.showDailyAtTime(
          0,
          'Medicine Reminder: $_medicineName',
          _medicineType.toString() != _medicineType.toString()
              ? 'It is time to take your $_medicineName, according to schedule'
              : 'It is time to take your medicine, according to schedule',
          Time(hour, minute, 0),
          platformChannelSpecifics);
      hour = ogValue;
    }
    await flutterLocalNotificationsPlugin.cancelAll();
  }

}

loading() async {
  Future.delayed(Duration(seconds: 2));
  Container(
    color: Colors.white,
    child: Center(
      child: SpinKitRing(
        color: Colors.teal,
        size: 50.0,
      ),
    ),
  );
}

Future getCurrentUser() async {
  final FirebaseUser user = await _auth.currentUser();
  final _uid = user.uid;
  print(_uid);
  return _uid.toString();
}