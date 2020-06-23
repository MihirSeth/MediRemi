import 'package:firebase_auth/firebase_auth.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;


class User {

  final String uid;

  User({ this.uid });

}

class UserData {

  final String uid;
  final String name;
  final String email;
  UserData({ this.uid, this.name, this.email});

}




Future getCurrentUser() async {
  final FirebaseUser user = await _auth.currentUser();
  final uid = user.uid;
  print(uid);
  return uid.toString();
}