import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to ConsentScreen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/consent');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo placeholder
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.teal.shade100,
              ),
              child: const Icon(
                Icons.medical_services_outlined,
                size: 60,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 20),
            
            // App name
            Text(
              "DermaDx",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade700,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 8),
            
            // Tagline
            Text(
              "AI-powered Skin Diagnosis and Derma Connect Platform",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.teal.shade400,
              ),
            ),

            const SizedBox(height: 40),

            // Loading indicator
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
            ),
          ],
        ),
      ),
    );
  }
}
