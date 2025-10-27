import 'package:flutter/material.dart';

class SeverityScores extends StatelessWidget {
  const SeverityScores({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Severity Scores'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView( // ✅ Added scrollable container
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // ✅ Left-align text
          children: const [
            SizedBox(height: 30),
            Text(
              'Your Severity Scores',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '🎯 Understanding Severity Scores in DermaDx\n\n'
              'Every skin condition is unique. That’s why DermaDx not only detects possible skin issues but also helps you understand how severe they are using an AI-based Severity Scoring System.\n\n'
              '🟢 Mild (0% – 40%)\nThe condition appears light and manageable. DermaDx suggests self-care steps — gentle cleansing, skincare tips, and pharmacy options — to treat it safely at home.\n\n'
              '🟡 Moderate (40% – 70%)\nThe AI detects signs that may need attention. It recommends consulting a certified dermatologist and offers advice to help you prepare for your visit.\n\n'
              '🔴 Severe (70% – 100%)\nThe system finds strong indicators of a serious condition. DermaDx advises immediate care and shows nearby dermatologists with contact and location details.\n\n'
              'These scores make it simple to understand your skin’s health and take the right step at the right time — while always reminding users that DermaDx is a helpful guide, not a medical substitute.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                height: 1.5,
              ),
              textAlign: TextAlign.left, // ✅ Left aligned
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
