import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/consent_screen.dart';
import 'screens/upload_screen.dart'; // Placeholder for next phase

void main() {
  runApp(DermaDxApp());
}

class DermaDxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DermaDx',
      theme: ThemeData(
        primarySwatch: Colors.teal, // Mint-ish theme
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash', // Start with splash screen
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/consent': (context) => ConsentScreen(),
        '/upload': (context) => UploadScreen(), // placeholder screen
      },
    );
  }
}
