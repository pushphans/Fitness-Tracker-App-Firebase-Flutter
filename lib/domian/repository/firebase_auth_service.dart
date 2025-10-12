import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final auth = FirebaseAuth.instance;

  Future<bool> signUp(String name, String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return true;
    } catch (error) {
      log("Error in sign up $error");
      return false;
    }
  }

  Future<bool> signIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (error) {
      log("Error in sign in $error");
      return false;
    }
  }

  Future<bool> signInWithGoogle() async {
    final googleAuthProvider = GoogleAuthProvider();
    try {
      await auth.signInWithProvider(googleAuthProvider);
      return true;
    } catch (error) {
      log("Error in signing in with google $error");
      return false;
    }
  }

  Future<bool> signOut() async {
    try {
      await auth.signOut();
      return true;
    } catch (error) {
      log("Error in sign out $error");
      return false;
    }
  }
}
