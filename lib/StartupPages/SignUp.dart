import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthreminders/Models/User.dart';
import 'package:healthreminders/Services/Database.dart';
import 'package:healthreminders/MainPages/home.dart';
import 'package:healthreminders/Services/SignUpGoogle.dart';
import 'package:healthreminders/Services/GoogleDatabase.dart';
import 'package:provider/provider.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}


class _SignupPageState extends State<SignupPage> {


  String _emailID;
  String _password;
  String _name;
  String _phoneNumber;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool loading = false;



  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: ListView(
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(35, 110, 0, 0),
                          child: Text(
                            "Sign",
                            style: TextStyle(
                              fontSize: 80,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(35, 190, 0, 0),
                          child: Text(
                            "Up",
                            style: TextStyle(
                              fontSize: 80,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(145, 180, 0, 0),
                          child: Text(
                            ".",
                            style: TextStyle(
                              fontSize: 90,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 35, left: 35, right: 35),
                      child: Column(
                          children: <Widget>[
                            TextFormField(
                                validator: (input) {
                                  if (input.isEmpty) {
                                    return 'Please type a Name';
                                  }
                                },
                                onSaved: (input) => _name = input,
                                decoration: InputDecoration(
                                  hintText: "Full Name",
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
                          height: 20.0,
                          ),

                          Column(

                                children: <Widget>[
                                  TextFormField(
                                      validator: (input) {
                                        if (input.isEmpty) {
                                          return 'Please type a Phone Number';
                                        }
                                      },
                                      onSaved: (input) => _phoneNumber = input,
                                      decoration: InputDecoration(
                                        hintText: "Phone Number (Kindly add 91)",
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
                                    height: 20.0,
                                  ),

                                  TextFormField(
                                      validator: (input) {
                                        if (input.isEmpty) {
                                          return 'Please type a valid email';
                                        }
                                      },
                                      onSaved: (input) => _emailID = input,
                                      decoration: InputDecoration(
                                        hintText: "Email ID",
                                        hintStyle: TextStyle(
                                          fontFamily: "Monster",
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.green),),
                                      )
                                  ),

                                  SizedBox(
                                    height: 20.0,
                                  ),

                                  TextFormField(
                                    validator: (input) {
                                      if (input.length < 6){
                                        return 'Please type a longer password';
                                      }
                                    },
                                    onSaved: (input) => _password = input,
                                    decoration: InputDecoration(
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                        fontFamily: "Monster",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.green),),
                                    ),
                                    obscureText: true,
                                  ),
                                ],

                              ),


                            SizedBox(
                              height: 40,
                            ),

                            Container(
                              height: 40,
                              child: Material(
                                borderRadius: BorderRadius.circular(20),
                                shadowColor: Colors.tealAccent,
                                color: Colors.teal,
                                elevation: 7.0,
                                child: InkWell(
                                  onTap: () {
                                    final _form = _formKey.currentState;
                                    if (_form.validate()) {
                                      _form.save();
                                      signUp(context);
                                    }

                                  },
                                    child: Center(
                                    child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Monster",
                                    ),
                                    ),
                                    ),
                                  ),
                              ),
                            ),

                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Container(
                                height: 40,
                                width: 340,
                                color: Colors.transparent,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                    ),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Center(
                                        child: ImageIcon(AssetImage('assets/google.png')),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                          onTap: () async {
                                            await showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return AlertDialog(
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(30),
                                                    ),
                                                    elevation: 5,
                                                    title: Center(child: Text('Notification')),
                                                    titleTextStyle: TextStyle(
                                                      color: Colors.teal,
                                                      fontFamily: 'Monster',
                                                      fontSize: 20.0,
                                                      letterSpacing: 1.5,
                                                      fontWeight: FontWeight.bold,
                                                      decoration: TextDecoration.underline,
                                                    ),
                                                    content: Text('If you use Google to Signup then Google must always be used to Login, but if you Sign Up in the normal way then you can Login through any method. Kindly also put in your name and phone number before doing either.'),
                                                    contentTextStyle: TextStyle(
                                                      fontFamily: 'Monster',
                                                      color: Colors.black,
                                                    ),
                                                    actions: [
                                                      FlatButton(
                                                        onPressed: () {
                                                          Navigator.of(context).pushNamed('/signup');
                                                        },
                                                        child: Text('Try Again'),
                                                      ),
                                                      FlatButton(
                                                        onPressed: () async {
                                                          String _uid = await getCurrentUser();
                                                          await DatabaseServiceGoogle(uid: user.uid).googleDatabase(_name,_emailID,_uid);
                                                          signInWithGoogle().whenComplete(() {
                                                            Navigator.of(context).push(
                                                              MaterialPageRoute(
                                                                builder: (context) {
                                                                  return Home();
                                                                },
                                                              ),
                                                            );
                                                          }
                                                          );},
                                                        child: Text('Move On'),
                                                      )
                                                    ],
                                                  );
                                                }
                                            );

                                            String _uid = await getCurrentUser();
                                        await DatabaseServiceGoogle(uid: user.uid).googleDatabase(_name,_emailID,_uid);

                                          signInWithGoogle().whenComplete(() {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return Home();
                                                  },
                                                ),
                                              );
                                            }
                                            );
                                          },
                                          child: Text(
                                            "Sign Up with Google",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Monster",

                                            ),

                                          )
                                      )
                                    ],

                                  ),

                                ),
                              ),
                            ),

                            SizedBox(
                              height: 20,
                            ),
                            FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.black)),
                              color: Colors.white,
                              onPressed: () {
                                Navigator.of(context).popAndPushNamed('/');
                              },
                              child: Center(
                                child: Text(
                                  "Go back",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Monster",
                                  ),
                                ),
                              ),
                            )
                          ]
                      )
                  )
                ]
          ),
            )
          ],

        )
    );

  }

  Future<void> signUp(context) async {
      try {
        AuthResult result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailID, password: _password);
        FirebaseUser user = result.user;

        String _uid = await getCurrentUser();


        await DatabaseService(uid: user.uid).updateUserData(_name,_emailID,_uid, _phoneNumber);

        setState(() => loading = true);
        print("Successfully Registered!");
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      } catch (e) {
        setState(() {
          loading = false;
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                  title: Center(child: Text('SignUp Failed')),
                  titleTextStyle: TextStyle(
                    color: Colors.teal,
                    fontFamily: 'Monster',
                    fontSize: 20.0,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                  content: Text(
                      'Check your Email ID and make sure password is over 6 letters'),
                  contentTextStyle: TextStyle(
                    fontFamily: 'Monster',
                    color: Colors.black,
                  ),
                  actions: [
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/signup');
                      },
                      child: Text('Try Again'),
                    )
                  ],
                );
              }
          );
        }
        );
      }
    }

  }

Future getCurrentUser() async {
  final FirebaseUser user = await _auth.currentUser();
  final _uid = user.uid;
  print(_uid);
  return _uid.toString();
}
