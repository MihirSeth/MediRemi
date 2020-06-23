import 'package:flutter/material.dart';
import 'package:healthreminders/MainPages/Medicine.dart';
import 'package:healthreminders/MedicineReminders/Models/medicine_type.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthreminders/Models/User.dart';
import 'DatabaseMedicine.dart';


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
  String _interval;
  String _startingTime;
  String _durationTime;
  String _durationType;
  String _uid;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String dropdownValue = 'Tablet';

  final myController = TextEditingController();




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
                        padding: EdgeInsets.only( right: 225),

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
                    fontWeight: FontWeight.bold,
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
              fontWeight: FontWeight.bold,
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
                              fontWeight: FontWeight.bold,
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
                      hint: Text('Select Medicine Type'),
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
                                child: DropdownButton<String>(
                                  underline: Container(
                                    height: 2,
                                    color: Colors.teal,
                                  ),
                                  hint: Text('Number of Hours'),
                                  value: _interval,
                                  items: [
                                    DropdownMenuItem<String>(
                                        child: Row(
                                          children: <Widget>[
                                            Text('2 Hours', style: TextStyle(color: Colors.black),
                                            ),

                                          ],
                                        ),
                                        value: '2 Hours'
                                    ),
                                    DropdownMenuItem<String>(
                                        child: Row(
                                          children: <Widget>[
                                            Text('4 Hours', style: TextStyle(color: Colors.black),
                                            ),

                                          ],
                                        ),
                                      value: '4 Hours'

                                    ),
                                    DropdownMenuItem<String>(
                                        child: Row(
                                          children: <Widget>[
                                            Text('6 Hours' , style: TextStyle(color: Colors.black),
                                            ),

                                          ],
                                        ),
                                        value: '6 Hours'
                                    ),
                                    DropdownMenuItem<String>(
                                        child: Row(
                                          children: <Widget>[
                                            Text('8 Hours', style: TextStyle(color: Colors.black),
                                            ),

                                          ],
                                        ),
                                        value: '8 Hours'
                                    ),
                                    DropdownMenuItem<String>(
                                        child: Row(
                                          children: <Widget>[
                                            Text('12 Hours', style: TextStyle(color: Colors.black),
                                            ),

                                          ],
                                        ),
                                        value: '12 Hours'
                                    ),
                                    DropdownMenuItem<String>(
                                        child: Row(
                                          children: <Widget>[
                                            Text('24 Hours', style: TextStyle(color: Colors.black),
                                            ),

                                          ],
                                        ),
                                        value: '24 Hours'
                                    )
                                  ],
                                  onChanged: (String newValue) {
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
                    padding: EdgeInsets.only(left: 25, right: 25),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 258),
                          child: Text(
                              "Starting Time",
                              style: TextStyle(
                                color: Colors.teal,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,

                              )
                          ),
                        ),
                        TextFormField(
                            maxLength: 5,
                            onSaved: (input) => _startingTime = input,
                            decoration: InputDecoration(
                              hintText: "Write in 24 hours method in Hours:Minutes",
                              hintStyle: TextStyle(
                                fontFamily: "Monster",
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal),),

                            ))

                      ],
                    ),
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
                                                fontWeight: FontWeight.bold,
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
                                          hint: Text('Days/Weeks/Months/Years?'),
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

                  Navigator.pop(context, MaterialPageRoute(builder: (context) =>
                      Medicine()));

                  String _uid = await getCurrentUser();


                  await DatabaseService().medicineData(
                  _medicineName,
                      _dosage,
                      _pills,
                      _medicineType,
                      _interval,
                      _startingTime,
                      _durationTime,
                      _durationType,
                      _uid,
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

                ]
              ),
            ),
          ],
        )
    );
 }

}

Future getCurrentUser() async {
  final FirebaseUser user = await _auth.currentUser();
  final _uid = user.uid;
  print(_uid);
  return _uid.toString();
}