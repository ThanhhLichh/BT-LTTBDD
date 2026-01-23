import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<void> saveUser({
    required User user,
  }) async {
    await _db.collection('users').doc(user.uid).set({
      'uid': user.uid,
      'name': user.displayName,
      'email': user.email,
      'photoUrl': user.photoURL,
      'createdAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }
}
