import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthreminders/MedicineReminders/AddMedicine.dart';
import 'package:healthreminders/MedicineReminders/Models/BuildListItemMedicines.dart';
import 'package:healthreminders/StartupPages/WelcomePage.dart';
import 'package:healthreminders/Models/buildListItem(NameEmail).dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthreminders/StartupPages/SignUp.dart';



final FirebaseAuth _auth = FirebaseAuth.instance;


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
               padding:  EdgeInsets.only(right: 10.0),
               child: IconButton(
                 onPressed: () {
                   Navigator.push(
                       context, MaterialPageRoute(
                       builder: (context) => AddMedicine()));
                 },
                 icon: Icon(Icons.add),
               ),
             ),
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
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData)
                                return Text('Fetching your Medicines...');
                              else ErrorMedicines();
                              return Expanded(
                                child: SizedBox(
                                  height: 2000,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: snapshot.data.documents.length,
                                    itemBuilder: (context, index) =>
                                        buildListItemMedicine(
                                            context, snapshot.data.documents[index]),



                                  ),
                                ),
                              );
                            }
                        ),
                      ],
                  ),
                ),

//                Column(
//                  mainAxisAlignment: MainAxisAlignment.end,
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  children: <Widget>[
//                    Padding(
//                      padding: EdgeInsets.only(top: 600),
//                      child: Center(
//                        child: Container(
//                          alignment: Alignment.bottomCenter,
//                          height: 60,
//                          width: 250,
//                          child: Material(
//                            borderRadius: BorderRadius.circular(1000),
//                            shadowColor: Colors.tealAccent,
//                            color: Colors.teal,
//                            elevation: 7.0,
//                            child: FlatButton(
//                                onPressed: () {
//                                  Navigator.push(
//                                      context, MaterialPageRoute(
//                                      builder: (context) => AddMedicine()));
//                                },
//                                child: Center(
//                                  child: Text(
//                                    "Add a Med",
//                                    style: TextStyle(
//                                      color: Colors.white,
//                                      fontWeight: FontWeight.bold,
//                                      fontFamily: "Monster",
//                                      fontSize: 20.0,
//
//                                    ),
//                                  ),
//                                )
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
//                  ],
//                ),

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
//                child: Center(
//                  child: Text(
//                      '$Names',
//                    style: TextStyle(
//                      color: Colors.white,
//                      fontWeight: FontWeight.bold,
//                    ),
//                  ),
//                ),
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


  void ErrorMedicines() {
    Center(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 15, right: 185, top: 20),
            child: Text(
              "ADD MEDICINES",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
    Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 600),
          child: Center(
            child: Container(
              alignment: Alignment.bottomCenter,
              height: 60,
              width: 250,
              child: Material(
                borderRadius: BorderRadius.circular(1000),
                shadowColor: Colors.tealAccent,
                color: Colors.teal,
                elevation: 7.0,
                child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context) => AddMedicine()));
                    },
                    child: Center(
                      child: Text(
                        "Add a Med",
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
          ),
        ),
      ],

    );
  }


// Widget _myListView(BuildContext context) {
//
//   Column(
//     children: <Widget>[
//       Container(
//         padding: EdgeInsets.only(left: 15, right:185, top: 20),
//         child: Text(
//           "Your Medicines:",
//           style: TextStyle(
//             fontSize: 25,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       StreamBuilder<QuerySnapshot>(
//           stream: Firestore.instance.collection("Medicines")
//           .snapshots(),
//       builder: (context, snapshot) {
//       if (!snapshot.hasData)
//       return Text('Loading...');
//       else ErrorMedicines();
//       return ListView.builder(
//       itemCount: snapshot.data.documents.length,
//       itemBuilder: (context, index) =>
//       buildListItemMedicine(
//       context, snapshot.data.documents[index]),
//
//       );
//           }
//       ),
//       Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           Padding(
//             padding:  EdgeInsets.only(top:300),
//             child: Container(
//               alignment: Alignment.bottomCenter,
//               height: 60,
//               width: 250,
//               child: Material(
//                 borderRadius: BorderRadius.circular(1000),
//                 shadowColor: Colors.tealAccent,
//                 color: Colors.teal,
//                 elevation: 7.0,
//                 child: FlatButton(
//                     onPressed: () {
//                       Navigator.push(
//                           context, MaterialPageRoute(builder: (context) => AddMedicine()));
//                     },
//                     child: Center(
//                       child: Text(
//                         "Add a Med",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: "Monster",
//                           fontSize: 20.0,
//
//                         ),
//                       ),
//                     )
//                 ),
//               ),
//             ),
//           ),
//
//
//         ],
//       ),
//
//     ],
//   );
//}
//
//
}