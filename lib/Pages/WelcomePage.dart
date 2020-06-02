import 'package:healthreminders/Pages/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthreminders/Pages/SignUpGoogle.dart';

import '../home.dart';

class LoginPage extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "/signup" : (BuildContext context) => new SignupPage()
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
                      "Hello",
                      style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(30, 180, 0, 0),
                    child: Text(
                      "There",
                      style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(255, 170, 0, 0),
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
                  Form(
                    key: _formKey,
                    child: Column(

                      children: <Widget>[
                        TextFormField(
                            validator: (input){
                              if(input.isEmpty){
                                return 'Please type a valid email';
                              }
                            },
                            onSaved: (input)  => _emailID = input,
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
                          validator: (input){
                            if(input.length < 6){
                              return 'Please type a valid password';
                            }
                          },
                          onSaved: (input)  => _password = input,
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
                        onTap:  () => signIn(context),
                        child: Center(
                          child: Text(
                            "Log In",
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
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(20),
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
                            onTap: () {
                              signInWithGoogle().whenComplete(() {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return Home();
                                    },
                                  ),
                                );
                              });
                            },
                            child: Text(
                              "Login with Google",
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
                  SizedBox(
                    height: 15,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Text(
                        "New here?",
                        style: TextStyle(
                          fontFamily: "Monster",
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed("/signup");
                        },
                        child: Text(
                          "Register now.",
                          style: TextStyle(
                            color: Colors.green,
                            fontFamily: "Monster",
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  ),


                ],
              ),
            ),
          ],
        )
    );
  }

  Future<void> signIn(context) async {
    final _form = _formKey.currentState;
    if (_form.validate()) {
      _form.save();
      try {
        AuthResult user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailID, password: _password);
        print("Successful Wooho!");
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      } catch (e) {
        print(e.message);
      }
    }
  }


}
