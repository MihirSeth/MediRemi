import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthreminders/Models/User.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference _medicinesCollection = Firestore.instance.collection('Medicines');


  get medicineName => medicineName;
  get dosage => dosage;
  get medicineType => medicineType;
  get pills => pills;
  get interval => interval;
  get startTime => startTime;
  get durationTime => durationTime;
  get durationType => durationType;


  Future<void> medicineData (String medicineName,String dosage,int pills,String medicineType, String interval,String startingTime, int durationTime, String durationType) async {
    return await _medicinesCollection.document(uid).setData({

      "Name": medicineName,
      "Dosage": dosage,
      "Pills": pills,
      "Type": medicineType,
      "Interval": interval,
      "Start": startingTime,
      "Duration Time": durationTime,
      "Duration Type": durationType,


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


