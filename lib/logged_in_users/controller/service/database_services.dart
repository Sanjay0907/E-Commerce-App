import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/logged_in_users/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataBaseServices {
  static saveUserDataOnCloud() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final firestore = FirebaseFirestore.instance;
      String uid = user!.uid;
      String name = user.displayName!;
      String photoUrl = user.photoURL!;
      String email = user.email!;

      var userData = UserModel(name: name, email: email, photoUrl: photoUrl);
      firestore.collection('users').doc(uid).set(userData.toMap());
    } catch (e) {
      log(e.toString());
    }
  }

  static getUserDataFromServer() {
    final firestore = FirebaseFirestore.instance;

    final data = firestore.collection('users').snapshots();
    log(data.toString());
    return data;
  }
}
