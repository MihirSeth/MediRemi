import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthreminders/Models/User.dart';

class DatabaseService {

  final String uid;

  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference _appoinmentsCollection = Firestore.instance.collection('Appoinments');


  get doctorsName => doctorsName;
  get appoinmentDetails => appoinmentDetails;
  get doctorAddress => doctorAddress;
  get time => time;
  get timeType => timeType;
  get dayAppoinment => dayAppoinment;
  get dateAppoinment => dateAppoinment;


  Future<void> appoinmentData(String doctorsName,String appoinmentDetails, String doctorAddress, String time, String timeType, String dayAppoinment,String dateAppoinment) async {
    return await _appoinmentsCollection.document(uid).setData({

      "Doctor Name": doctorsName,
      "Appoinment Details": appoinmentDetails,
      "Address": doctorAddress,
      "Time": time,
      "Time Type": timeType,
      "Day of Appoinment": dayAppoinment,
      "Date of Appoinment": dateAppoinment,






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


