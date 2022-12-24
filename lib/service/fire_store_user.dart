import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/model/user_model.dart';

class FireStoreUser {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> addUser(UserModel user) async {
    return await _userCollection.doc(user.userId).set(user.toJson());
  }

  Future<DocumentSnapshot> getUser(String userId) async {
    return await _userCollection.doc(userId).get();
  }
}