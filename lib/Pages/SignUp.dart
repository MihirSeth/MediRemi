import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthreminders/home.dart';



class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}


class _SignupPageState extends State<SignupPage> {


  String _emailID;
  String _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(30, 110, 0, 0),
                  child: Text(
                    "Sign",
                    style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 180, 0, 0),
                  child: Text(
                    "Up",
                    style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(130, 170, 0, 0),
                  child: Text(
                    ".",
                    style: TextStyle(
                      fontSize: 90,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),

              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 35, left: 20, right: 20),
            child: Column(
              children: <Widget>[
                TextField(
                    decoration: InputDecoration(
                      hintText: "Nickname",
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

                Form(
                  key: _formKey,
                  child: Column(

                    children: <Widget>[
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
                          if (input.length < 6) {
                            return 'Please type a valid password';
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
                ),
                SizedBox(
                  height: 5,
                ),

                Container(
                  padding: EdgeInsets.only(top: 15, left: 210),
                  child: InkWell(
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Monster',
                        decoration: TextDecoration.underline,

                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),

                Container(
                  height: 40,
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    shadowColor: Colors.greenAccent,
                    color: Colors.green,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () => signIn(context),
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
                Container(
                    height: 40,
                    color: Colors.transparent,
                    child: Material(

                      borderRadius: BorderRadius.circular(20),
                      elevation: 2.0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/');
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
                      ),

                    )

                ),
              ],

            ),

          ),


        ],
      ),
    );
  }

  Future<void> signIn(context) async {
    final _form = _formKey.currentState;
    if (_form.validate()) {
      _form.save();
      try {
        AuthResult user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
            email: _emailID, password: _password);
        print("Successful Registered!");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      } catch (e) {
        print(e.message);
      }
    }
  }

}