import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_tracker_app_firebase/core/widgets/bottom_nav.dart';
import 'package:fitness_tracker_app_firebase/presentation/pages/login_page.dart';

import 'package:flutter/material.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.data == null) {
          return LoginPage();
        } else if (snapshot.data != null) {
          return MyBottomNavBar();
        } else {
          return Center(child: Text("Error"));
        }
      },
    );
  }
}
