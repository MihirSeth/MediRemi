import 'package:flutter/material.dart';

class AddLabTests extends StatefulWidget {
  @override
  _AddLabTestsState createState() => _AddLabTestsState();
}

class _AddLabTestsState extends State<AddLabTests> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String labtestname;
  String speciality;
  String day;
  String date;
  String address;
  String time;
  String reason;
  String _value;




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
          Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(top: 15, left: 25, right: 25),
                  child:
                  Form(
                    key: _formKey,
                    child: Column(
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
                                    onSaved: (input) => labtestname = input,
                                    decoration: InputDecoration(

                                      hintText: "Name",
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
                  )

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
                            onSaved: (input) => address = input,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Address",
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
                                        onSaved: (input) => time = input,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          hintText: "Time (Hours:Minutes)",
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
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 0, left: 0),
                                    child: DropdownButton<String>(
                                      underline: Container(
                                        height: 2,
                                        color: Colors.teal,
                                      ),
                                      hint: Text('AM/PM?'),
                                      value: _value,
                                      items: [
                                        DropdownMenuItem<String>(
                                            child:Text('PM', style: TextStyle(color: Colors.teal),
                                            ),
                                            value: 'One'
                                        ),
                                        DropdownMenuItem<String>(
                                            child:Text('AM', style: TextStyle(color: Colors.teal),
                                            ),
                                            value: 'Two'
                                        ),
                                      ],
                                      onChanged: (String newValue) {
                                        setState(() {
                                          _value = newValue;
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
                            onSaved: (input) => reason = input,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Reason",
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
                padding: EdgeInsets.only(top:0, left: 25, right: 25),

                child: Row(
                  children: <Widget>[
                    Container(
                      child:
                      Expanded(

                        child: TextFormField(
                            onSaved: (input) => day = input,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Day",
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
                            onSaved: (input) => date = input,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Date",
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

            ],

          ),
        ],
      ),

    );
  }
}
