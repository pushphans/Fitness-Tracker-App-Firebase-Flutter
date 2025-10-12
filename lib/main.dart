import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_tracker_app_firebase/core/pages/splash_screen.dart';
import 'package:fitness_tracker_app_firebase/core/widgets/auth_gate.dart';
import 'package:fitness_tracker_app_firebase/core/widgets/bottom_nav.dart';
import 'package:fitness_tracker_app_firebase/presentation/pages/home_page.dart';
import 'package:fitness_tracker_app_firebase/presentation/pages/login_page.dart';
import 'package:fitness_tracker_app_firebase/presentation/pages/register_page.dart';

import 'package:fitness_tracker_app_firebase/firebase_options.dart';
import 'package:fitness_tracker_app_firebase/presentation/provider/firebase_auth_provider.dart';
import 'package:fitness_tracker_app_firebase/presentation/provider/user_profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FirebaseAuthProvider()),
        ChangeNotifierProvider(create: (context) => UserProfileProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splashscreen',
      routes: {
        '/splashscreen': (context) => SplashScreen(),
        '/home_page': (context) => HomePage(),
        '/auth_gate': (context) => AuthGate(),
        '/login_page': (context) => LoginPage(),
        '/register_page': (context) => RegisterPage(),
        '/bottom_nav': (context) => MyBottomNavBar(),
      },
    );
  }
}
