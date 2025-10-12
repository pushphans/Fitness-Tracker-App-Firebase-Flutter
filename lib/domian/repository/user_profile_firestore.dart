import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_tracker_app_firebase/data/model/user_model.dart';

class UserProfileFirestore {
  final auth = FirebaseAuth.instance;
  final collectionRef = FirebaseFirestore.instance.collection("Users");

  Future<bool> addUser(UserModel user) async {
    try {
      final uid = auth.currentUser!.uid;

      final docRef = collectionRef.doc(uid);

      // final docId = docRef.id;
      user.id = uid;

      await docRef.set(user.toJson());
      return true;
    } catch (error) {
      log("Error adding user $error");
      return false;
    }
  }

  Future<List<UserModel>> getUsers() async {
    List<UserModel> users = [];

    try {
      final snapshot = await collectionRef.get();
      final docList = snapshot.docs;

      for (var i in docList) {
        users.add(UserModel.fromJson(i.data(), i.id));
      }

      return users;
    } catch (error) {
      log("Error in fetching user $error");
      return users;
    }
  }

  Future<UserModel?> getUser(String? userId) async {
    try {
      final snapshot = await collectionRef.doc(userId).get();
      final data = snapshot.data();
      if (data != null) {
        final user = UserModel.fromJson(data, userId!);

        return user;
      } else {
        log("User note found");
        throw Exception("User note found");
      }
    } catch (error) {
      log("Error while fetching user with id $error");
      return null;
    }
  }
}
