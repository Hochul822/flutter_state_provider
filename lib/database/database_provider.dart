import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_state_provider/model/user.dart';

class DatabaseProvider {
  final Firestore _db = Firestore.instance;

  Future<User> getUser(String id) async {
    var snap = await _db.collection('user').document(id).get();

    return User.fromMap(snap.data);
  }

  Stream<List<User>> getUsers() {
    return _db.collection('user').snapshots().map((list) =>
        list.documents.map((doc) => User.fromFireStore(doc)).toList());
  }
}
