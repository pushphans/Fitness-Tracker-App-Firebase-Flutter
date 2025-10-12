// ignore_for_file: use_build_context_synchronously

import 'package:fitness_tracker_app_firebase/presentation/provider/firebase_auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/loginbackground.jpg"),
            fit: BoxFit.cover,
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 48.0),

              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withAlpha(150),
                  hint: Text("Email"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16.0),

              TextField(
                obscureText: true,
                obscuringCharacter: "*",
                controller: passwordController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withAlpha(150),
                  hint: Text("Password"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),

              const SizedBox(height: 32.0),

              Consumer<FirebaseAuthProvider>(
                builder: (context, value, child) => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  onPressed: () async {
                    await value.signIn(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                    );

                    if (value.isLoginSuccess == true) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("User logged in successfully"),
                          backgroundColor: Colors.green,
                        ),
                      );

                      Navigator.pushReplacementNamed(context, '/auth_gate');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Error while Signing In!! Try again"),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: const Text('Login', style: TextStyle(fontSize: 16.0)),
                ),
              ),

              const SizedBox(height: 10),

              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/register_page');
                },
                child: Row(
                  children: [
                    Text(
                      "Don't have an account yet?",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text("Register here", style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Consumer<FirebaseAuthProvider>(
                builder: (context, value, child) => SignInButton(
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                  Buttons.google,
                  text: "Sign up with Google",
                  onPressed: () async {
                    await value.signInGoogle();

                    if (value.isGoogleSignInSuccess == true) {
                      Navigator.pushReplacementNamed(context, '/auth_gate');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
