import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String name;
  final int age;

  User({this.name, this.age});

  factory User.fromMap(Map map) {
    return User(
      name: map['name'] ?? '',
      age: map['age'] ?? 0,
    );
  }

  factory User.fromFireStore(DocumentSnapshot doc) {
    Map map = doc.data;

    return User(
      name: map['name'] ?? '',
      age: map['age'] ?? 0,
    ) ;
  }
}
