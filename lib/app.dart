import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'screens/home_page.dart';
import 'screens/login_page.dart';

class FitMirrorApp extends StatelessWidget {
  const FitMirrorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitMirror',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const AuthGate(),
    );
  }
}

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(), // listen to login state
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasData) {
          // ✅ User is logged in → go to HomePage
          return const HomePage();
        } else {
          // ❌ User not logged in → show LoginPage
          return const LoginPage();
        }
      },
    );
  }
}
