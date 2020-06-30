import 'package:cloud_firestore/cloud_firestore.dart';




class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference nameCollection = Firestore.instance.collection('Users');

  Future<void> updateUserData (String name,String email, String uid, String phoneNumber) async {
    return await nameCollection.document(uid).setData({

      'Name': name,
      'Email': email,
      'Phone Number': phoneNumber,
      'uid': uid,


    });
  }
//  List<Names> _brewListFromSnapshot(QuerySnapshot snapshot) {
//    return snapshot.documents.map((doc){
//      //print(doc.data);
//      return Names(
//          name: doc.data['Name'] ?? '',
//        email: doc.data['Email'] ?? '',
//      );
//    }).toList();
//  }
//
//  // user data from snapshots
//  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
//    return UserData(
//        uid: uid,
//        name: snapshot.data['name'],
//        email: snapshot.data['Email'],
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