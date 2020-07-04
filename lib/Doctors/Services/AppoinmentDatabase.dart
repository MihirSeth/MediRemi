import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class DatabaseService {

  final String uid;

  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference _appoinmentsCollection = Firestore.instance.collection('Appoinments');


  get doctorsName => doctorsName;
  get appoinmentReason => appoinmentReason;
  get doctorAddress => doctorAddress;
  get time => time;
  get timeType => timeType;
  get dayAppoinment => dayAppoinment;
  get dateAppoinment => dateAppoinment;


  Future<void> appoinmentData(String doctorsName,String appoinmentReason, String doctorAddress, String time, String timeType, String dayAppoinment,String dateAppoinment, String monthAppoinment,String yearAppoinment, timeDatabase, String uid) async {
    return await _appoinmentsCollection.document().setData({

      "Doctor Name": doctorsName,
      "Appoinment Details": appoinmentReason,
      "Address": doctorAddress,
      "Time": time,
      "Time Type": timeType,
      "Day of Appoinment": dayAppoinment,
      "Date of Appoinment": dateAppoinment,
      "Month of Appoinment": monthAppoinment,
      "Year of Appoinment": yearAppoinment,
      "Create Time Database": timeDatabase,
      "uid": uid,






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


