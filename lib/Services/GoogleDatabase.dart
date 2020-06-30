
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServiceGoogle {

  final String uid;

  DatabaseServiceGoogle({ this.uid });

  // collection reference
  final CollectionReference nameCollection = Firestore.instance.collection('UsersGoogle');

  Future<void> googleDatabase(String name,String emailID, String uid) async {
    return await nameCollection.document(uid).setData({

      'Name': name,
      'Email': emailID,

      'uid': uid,


    });
  }
}