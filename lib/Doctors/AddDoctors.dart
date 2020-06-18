import 'package:flutter/material.dart';

class AddDoctors extends StatefulWidget {
  @override
  _AddDoctorsState createState() => _AddDoctorsState();
}

class _AddDoctorsState extends State<AddDoctors> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String doctorname;
  String speciality;
  int number;
  String emailID;
  String address;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Doctors",
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
                            padding: EdgeInsets.only(right: 220),
                            child: Text(
                                'Doctors Name',
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
                                      onSaved: (input) => doctorname = input,
                                      decoration: InputDecoration(

                                        hintText: " Doctor's Name",
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
                padding: EdgeInsets.only(right: 120),
                child: Text(
                    "Phone Number of Doctor",
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
                              Icons.phone,
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
                            onSaved: (input) => number = input as int,
                            keyboardType: TextInputType.number,
                            maxLength: 11,
                            decoration: InputDecoration(
                              hintText: "Phone Number",
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
                padding: EdgeInsets.only(right: 225),
                child: Text(
                    "Mail of Doctor",
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
                              Icons.mail,
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
                            onSaved: (input) => emailID = input,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Email ID",
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

            Padding(
              padding: EdgeInsets.only(right: 110),
              child: Text(
                  "The Address of the Doctor",
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
              height: 100,
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
