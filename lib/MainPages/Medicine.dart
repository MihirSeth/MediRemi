import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthreminders/MedicineReminders/AddMedicine.dart';
import 'package:healthreminders/MedicineReminders/Models/BuildListItemMedicines.dart';
import 'package:healthreminders/Models/User.dart';
import 'package:healthreminders/StartupPages/WelcomePage.dart';
import 'package:healthreminders/Models/buildListItem(NameEmail).dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthreminders/StartupPages/SignUp.dart';



final FirebaseAuth _auth = FirebaseAuth.instance;
var user = _auth.currentUser();


class Medicine extends StatefulWidget {
  @override
  _MedicineState createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {

  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e); //
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Medicines",
              style: TextStyle(
                  fontFamily: 'Monster'
              ),
            ),
          ),
          backgroundColor: Colors.teal,
           actions: <Widget>[
             Padding(
               padding:  EdgeInsets.only(right: 15.0),
               child: IconButton(
                 onPressed: () {
                   Navigator.push(
                       context, MaterialPageRoute(
                       builder: (context) => AddMedicine()));
                 },
                 icon: Icon(Icons.add),
               ),
             ),
//             Padding(
//               padding:  EdgeInsets.only(right: 10.0),
//               child: IconButton(
//                 onPressed: () {
//                   Navigator.push(
//                       context, MaterialPageRoute(
//                       builder: (context) => Medicine()));
//                 },
//                 icon: Icon(Icons.refresh),
//               ),
//             ),

           ],
        ),
        body: ListView(
          children: [
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 15, right: 185, top: 20),
                  child: Text(
                    "Your Medicines:",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    children: <Widget>[
                      StreamBuilder<QuerySnapshot>(
                          stream: Firestore.instance.collection("Medicines")
                              .where('uid',  isEqualTo: user)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData)
                              return Text('Fetching your Medicines...');
                           else ErrorMedicine();
                              return Expanded(
                                child: SizedBox(
                                  height: 700,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: snapshot.data.documents.length,
                                    itemBuilder: (context, index) =>
                                        buildListItemMedicine(
                                            context,
                                            snapshot.data.documents[index]),

                                  ),
                                ),
                              );
                          }
                          ),

                    ],
                  ),
                ),

              ],
            ),
          ],
        ),

        drawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: Firestore.instance.collection("Names")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData)
                          return Text('Loading...');
                        return ListView.builder(
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index) =>
                              buildListItem(
                                  context, snapshot.data.documents[index]),

                        );
                      }
                  ),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                        children: <Widget>[
                          ListTile(
                              leading: Icon(Icons.settings),
                              title: Text('Settings')
                          ),
                          ListTile(
                              leading: ImageIcon(
                                  AssetImage('assets/Whatsapp.png'),
                                  color: Colors.green
                              ),
                              title: Text('Whatsapp')
                          ),
                          ListTile(
                              leading: Icon(Icons.email),
                              title: Text('Email')
                          ),
                          ListTile(
                            leading: Icon(Icons.exit_to_app),
                            title: Text('Logout'),
                            onTap: () {
                              _signOut().whenComplete(() {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return LoginPage();
                                    },
                                  ),
                                );
                              });
                            },
                          ),
                        ]
                    ),
                  ),
                ),
              ],
            )
        )

    );
  }


}

void ErrorMedicine() {

  AlertDialog(
  title: Center(child: Text('Alert')),
  titleTextStyle: TextStyle(
  color: Colors.teal,
  fontFamily: 'Monster',
  fontSize: 20.0,
  letterSpacing: 1.5,
  fontWeight: FontWeight.bold,
  decoration: TextDecoration.underline,

  ),
  content: Text('Add Medicines'),
  contentTextStyle: TextStyle(
  fontFamily: 'Monster',
  color: Colors.black,
  ),
  actions: <Widget> [
  FlatButton(
  onPressed: () {
//  Navigator.push(
//  context, MaterialPageRoute(
//  builder: (context) => AddMedicine()));
  },
  child: Text('ADD MEDICINES'),
  )
  ],
  );
  }


 getCurrentUser() async {
  final FirebaseUser user = await _auth.currentUser();
  final _uid = user.uid;
  print(_uid);
  return _uid.toString();
}