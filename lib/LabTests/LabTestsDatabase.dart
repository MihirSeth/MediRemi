import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthreminders/Models/User.dart';

class DatabaseService {

  final String uid;

  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference _appoinmentsCollection = Firestore.instance.collection('Lab Tests');


  get labtestName => labtestName;
  get labtestAddress => labtestAddress;
  get time => time;
  get timeType => timeType;
  get reasonLabTest => reasonLabTest;

  get dayLabTest => dayLabTest;
  get dateLabTest => dateLabTest;


  Future<void> labtestData(String labtestName,String labtestAddress, String time, String timeType, String reasonLabTest, String dayLabTest,String dateLabTest) async {
    return await _appoinmentsCollection.document(uid).setData({

      "Lab Tests Name": labtestName,
      "Address of Lab Test": labtestAddress,
      "Time": time,
      "Time Type": timeType,
      "Reason for Lab Test": reasonLabTest,
      "Day of Lab Test": dayLabTest,
      "Date of Lab Test": dateLabTest,






    });
  }
//  List<Names> _brewListFromSnapshot(QuerySnapshot snapshot) {
//    return snapshot.documents.map((doc){
//      //print(doc.data);
//      return Names(
//        name: doc.data['Name'] ?? '',
//        email: doc.data['Email'] ?? '',
//      );
//    }).toList();
//  }
//
//  // user data from snapshots
//  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
//    return UserData(
//      uid: uid,
//      name: snapshot.data['name'],
//      email: snapshot.data['Email'],
//    );
//  }

}

//class Names {
//  final String name;
//  final String email;
//
//
//  Names({ this.name, this.email });
//
//}


