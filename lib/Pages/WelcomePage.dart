import 'package:healthreminders/Pages/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthreminders/Pages/SignUpGoogle.dart';
import 'package:healthreminders/Pages/PasswordReset.dart';
import 'package:healthreminders/Pages/loading.dart';


import '../home.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;


class LoginPage extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "/signup" : (BuildContext context) => new SignupPage(),
        "/passwordreset" : (BuildContext context) => new PasswordReset()
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

  bool loading = false;
  @override
  Widget build(BuildContext context) {

    return loading ? Loading() : Scaffold(

      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(35, 110, 0, 0),
                  child: Text(
                    "Hello",
                    style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(35, 190, 0, 0),
                  child: Text(
                    "There",
                    style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(265, 180, 0, 0),
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
                  Form(
                    key: _formKey,
                    child: Column(

                      children: <Widget>[
                        TextFormField(
                            validator: (input) {
                              if (input.isEmpty){
                                return 'Please type a email';
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
                                borderSide: BorderSide(color: Colors.teal),),
                            )
                        ),

                        SizedBox(
                          height: 20.0,
                        ),

                        TextFormField(
                          // ignore: missing_return
                          validator: (input) {
                            if (input.length < 6) {
                              return 'Please type a password';
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
                              borderSide: BorderSide(color: Colors.teal),),

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
                      onTap: () {
                        Navigator.of(context).pushNamed("/passwordreset");
                      },
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
                          color: Colors.teal,
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

                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.teal)),
                    color: Colors.teal,

                    onPressed: () {
                      signIn(context);

                    },
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Monster",
                        ),
                      ),
                    ),
                  ),
                ]
            ),
          ),

          SizedBox(
            height: 10,
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
                    color: Colors.teal,
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

    );
  }


  Future<void> signIn(context) async {
    final _form = _formKey.currentState;
    if (_form.validate()) {
      _form.save();
      try {
        AuthResult user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _emailID, password: _password);
        final FirebaseUser currentUser = await _auth.currentUser();
        setState(() => loading = true);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      } catch (e) {
        setState(() {
          loading = false;
          showDialog(
              context: context,
              builder: (BuildContext context) {
                // return object of type Dialog
                return AlertDialog(
                  title: Center(child: Text('Alert')),
                  titleTextStyle: TextStyle(
                    color: Colors.teal,
                    fontFamily: 'Monster',
                    fontSize: 20.0,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,

                  ),
                  content: Text('Login Failed - Check Email ID and Password'),
                  contentTextStyle: TextStyle(
                    fontFamily: 'Monster',
                    color: Colors.black,
                  ),
                  actions: <Widget> [
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/');
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

    Future<FirebaseUser> getUser() async {
      return await _auth.currentUser();
    }
    @override
    void initState() {
      super.initState();
      getUser().then((user) {
        if (user != null) {
          // send the user to the home page
          // homePage();
        }
      });
    }

  }
}
