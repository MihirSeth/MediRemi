import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthreminders/Doctors/Services/DoctorDatabase.dart';
import 'package:healthreminders/Doctors/success_screen_doctors.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;


class AddDoctors extends StatefulWidget {
  @override
  _AddDoctorsState createState() => _AddDoctorsState();
}

class _AddDoctorsState extends State<AddDoctors> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _doctorname;
  String _speciality;
  String _number;
  String _emailID;
  String _address;
  final _timeDatabase = DateTime.now();



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
                Form(
        key: _formKey,
                  child: Column(
          children: <Widget>[
            Container(
                  padding: EdgeInsets.only(top: 15, left: 25, right: 25),
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
                                        validator: (input) {
                                          if (input.isEmpty) {
                                            return 'Please type the Doctors Name';
                                          } return '';
                                        },
                                        onSaved: (input) => _doctorname = input,
                                        decoration: InputDecoration(

                                          hintText: " Doctor's Name",
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
              height: 20,
            ),

            Padding(
              padding: EdgeInsets.only(right: 170),
              child: Text(
                    "Speciality of Doctor",
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
                              Icons.assignment,
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
                                return 'Please type the Speciality of the Doctor';
                              }return '';
                            },
                            onSaved: (input) => _speciality = input,
                            decoration: InputDecoration(
                              hintText: "Speciality",
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
                              validator: (input) {
                                if (input.isEmpty) {
                                  return 'Please type the Phone Number';
                                } return '';
                              },
                              onSaved: (input) => _number = input,
                              keyboardType: TextInputType.number,
                              maxLength: 11,
                              decoration: InputDecoration(
                                hintText: "Phone Number",
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
                              validator: (input) {
                                if (input.isEmpty) {
                                  return 'Please type the Email ID of the Doctor';
                                } return '';
                              },
                              onSaved: (input) => _emailID = input,
                              decoration: InputDecoration(
                                hintText: "Email ID",
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
                            validator: (input) {
                              if (input.isEmpty) {
                                return 'Please type the Address of the Doctor';
                              } return '';
                            },
                            onSaved: (input) => _address = input,
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
                      onPressed: () async{
                        final _form = _formKey.currentState;
                        if (_form.validate()) {
                          _form.save();

                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
                              SuccessScreenDoctors()));

                          String _uid = await getCurrentUser();

                          await DatabaseService().doctorData(
                               _doctorname,
                            _speciality,
                             _number,
                              _emailID,
                               _address,
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

}
Future getCurrentUser() async {
  final FirebaseUser user = await _auth.currentUser();
  final _uid = user.uid;
  print(_uid);
  return _uid.toString();
}