import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServiceGoogle{

  final String uid;

  DatabaseServiceGoogle({ this.uid });

  // collection reference
  final CollectionReference _googleUserCollection = Firestore.instance.collection('UsersGoogle');

  Future<void> googleUserData(String name,String emailID, String uid) async {
    return await _googleUserCollection.document(uid).setData({

      'Name': name,
      'Email': emailID,
      'uid': uid,
    }
    );
  }
}