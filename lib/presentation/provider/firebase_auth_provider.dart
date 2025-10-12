// ignore_for_file: prefer_final_fields

import 'dart:developer';

import 'package:fitness_tracker_app_firebase/domian/repository/firebase_auth_service.dart';
import 'package:flutter/material.dart';

class FirebaseAuthProvider extends ChangeNotifier {
  final authService = FirebaseAuthService();

  bool _isLoginSuccess = false;
  bool get isLoginSuccess => _isLoginSuccess;

  bool _isSignUpSuccess = false;
  bool get isSignUpSuccess => _isSignUpSuccess;

  bool _isGoogleSignInSuccess = false;
  bool get isGoogleSignInSuccess => _isGoogleSignInSuccess;

  bool _isSignOutSuccess = false;
  bool get isSignOutSuccess => _isSignOutSuccess;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> signIn(String email, String password) async {
    _isLoading = true;
    notifyListeners();
    try {
      _isLoginSuccess = await authService.signIn(email, password);
      notifyListeners();
    } catch (error) {
      log(error.toString());
      _isLoginSuccess = false;
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signUp(String name, String email, String password) async {
    _isLoading = true;
    try {
      _isSignUpSuccess = await authService.signUp(name, email, password);
      notifyListeners();
    } catch (error) {
      log(error.toString());
      _isSignUpSuccess = false;
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signInGoogle() async {
    _isLoading = true;
    notifyListeners();
    try {
      _isGoogleSignInSuccess = await authService.signInWithGoogle();
      notifyListeners();
    } catch (error) {
      log(error.toString());
      _isGoogleSignInSuccess = false;
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    _isLoading = false;
    notifyListeners();
    try {
      _isSignOutSuccess = await authService.signOut();
      notifyListeners();
    } catch (error) {
      log(error.toString());
      _isSignOutSuccess = false;
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
