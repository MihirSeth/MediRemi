import 'package:cloud_firestore/cloud_firestore.dart';

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


  Future<void> medicineData (String medicineName,String dosage,String pills,String medicineType, int interval,int startingTimeHours,int startingTimeMinutes, String startingTimeType,String durationTime, String durationType, String uid, timeDatabase) async {
    return await _medicinesCollection.document().setData({

      "Name": medicineName,
      "Dosage": dosage,
      "Pills": pills,
      "Type": medicineType,
      "Interval": interval,
      "Starting Time Hours": startingTimeHours,
      "Starting Time Minutes": startingTimeMinutes,
      "Starting Time Type": startingTimeType,
      "Duration Time": durationTime,
      "Duration Type": durationType,
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


