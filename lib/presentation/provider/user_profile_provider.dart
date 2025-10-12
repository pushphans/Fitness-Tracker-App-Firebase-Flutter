import 'dart:developer';

import 'package:fitness_tracker_app_firebase/data/model/user_model.dart';
import 'package:fitness_tracker_app_firebase/domian/repository/user_profile_firestore.dart';
import 'package:flutter/material.dart';

class UserProfileProvider extends ChangeNotifier {
  final userFirestore = UserProfileFirestore();
  List<UserModel> users = [];
  UserModel? user;

  Future<void> addUser(UserModel user) async {
    try {
      await userFirestore.addUser(user);
    } catch (error) {
      log(error.toString());
    }
  }

  Future<void> getUsers() async {
    try {
      users = await userFirestore.getUsers();
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> getUser(String userId) async {
    try {
      user = (await userFirestore.getUser(userId))!;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }
}
