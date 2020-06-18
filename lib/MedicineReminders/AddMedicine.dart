import 'package:flutter/material.dart';
import 'package:healthreminders/MedicineReminders/Models/medicine_type.dart';

class AddMedicine extends StatefulWidget {
  @override
  _AddMedicineState createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  String medicine;
  String mgdosage;
  String pills;
  String startingtime;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String dropdownValue = 'Tablet';
  String _value;
  int _value1;
  String _value2;
  String _value3;


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
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 15, left: 25, right: 25),
                  child: Column(
            children: <Widget>[
            Form(
            key: _formKey,
            child: Column(
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
            onSaved: (input) => medicine = input,
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
    onSaved: (input) => mgdosage = input,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
    hintText: "Type the Dosage ",
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
                        onSaved: (input) => pills = input,
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
                      value: _value,
                      items: [
                        DropdownMenuItem<String>(
                            child: Row(
                              children: <Widget>[
                                Text(dropdownValue, style: TextStyle(color: Colors.teal),
                                ),
                                SizedBox(
                                  width: 85.0,
                                ),
                                ImageIcon(AssetImage('assets/Tablet.png')),
                              ],
                            ),
                            value: 'One'
                        ),
                      DropdownMenuItem<String>(
                        child: Row(
                            children: <Widget>[
                              Text('Pill', style: TextStyle(color: Colors.teal),
                              ),
                              SizedBox(
                                width: 110.0,
                              ),
                              ImageIcon(AssetImage('assets/pill.png')),
                            ],
                        ),
                          value: 'Two'

                      ),
                      DropdownMenuItem<String>(
                          child: Row(
                            children: <Widget>[
                              Text('Bottle' , style: TextStyle(color: Colors.teal),
                              ),
                              SizedBox(
                                width: 80.0,
                              ),
                              ImageIcon(
                                  AssetImage('assets/Bottle.png'),
                                size: 40,
                              ),
                            ],
                          ),
                          value: 'Three'

                      ),
                      DropdownMenuItem<String>(
                          child: Row(
                            children: <Widget>[
                              Text('Syringe', style: TextStyle(color: Colors.teal),
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
                          value: 'Four'

                      )
                      ],
                            onChanged: (String newValue) {
                            setState(() {
                            _value = newValue;
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
                                hint: Text('Number of Hours'),
                                value: _value1,
                                items: [
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text('2', style: TextStyle(color: Colors.teal),
                                          ),

                                        ],
                                      ),
                                      value: 1
                                  ),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text('4', style: TextStyle(color: Colors.teal),
                                          ),

                                        ],
                                      ),
                                    value: 2

                                  ),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text('6' , style: TextStyle(color: Colors.teal),
                                          ),

                                        ],
                                      ),
                                      value: 3
                                  ),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text('8', style: TextStyle(color: Colors.teal),
                                          ),

                                        ],
                                      ),
                                      value: 4
                                  ),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text('12', style: TextStyle(color: Colors.teal),
                                          ),

                                        ],
                                      ),
                                      value: 5
                                  ),
                                  DropdownMenuItem<int>(
                                      child: Row(
                                        children: <Widget>[
                                          Text('24', style: TextStyle(color: Colors.teal),
                                          ),

                                        ],
                                      ),
                                      value: 6
                                  )
                                ],
                                onChanged: (int newValue) {
                                  setState(() {
                                    _value1 = newValue;
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
                          onSaved: (input) => startingtime = input,
                          decoration: InputDecoration(
                            hintText: "Time (Kindly write in 24 hours method)",
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
                                      padding: EdgeInsets.only(bottom: 17, ),
                                      child: TextFormField(
                                          onSaved: (input) => startingtime = input,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            hintText: "Number",
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
                                        value: _value2,
                                        items: [
                                          DropdownMenuItem<String>(
                                              child:Text('Days', style: TextStyle(color: Colors.teal),
                                              ),
                                              value: 'One'
                                          ),
                                          DropdownMenuItem<String>(
                                            child:Text('Weeks', style: TextStyle(color: Colors.teal),
                                            ),
                                            value: 'Two'
                                          ),
                                          DropdownMenuItem<String>(
                                              child:Text('Months', style: TextStyle(color: Colors.teal),
                                              ),
                                              value: 'Three'
                                          ),
                                          DropdownMenuItem<String>(
                                              child:Text('Years', style: TextStyle(color: Colors.teal),
                                              ),
                                              value: 'Four'
                                          ),
                                        ],
                                        onChanged: (String newValue) {
                                          setState(() {
                                            _value2 = newValue;
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
                        onPressed: () {
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
          ],
        )
    );
 }

}

