import 'package:flutter/material.dart';

class ConsentScreen extends StatefulWidget {
  @override
  _ConsentScreenState createState() => _ConsentScreenState();
}

class _ConsentScreenState extends State<ConsentScreen> {
  bool consentGiven = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('User Consent'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Friendly info box
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.teal.shade200),
              ),
              child: Column(
                children: const [
                  Text(
                    'Welcome to DermaDx!',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'By using DermaDx, you agree that the AI will analyze your skin images to provide reports and severity scores. '
                    'These AI-generated results are meant to guide you, but always consult your doctor for professional medical advice. '
                    'Your data is private and only used for diagnostic purposes.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Consent checkbox
            CheckboxListTile(
              value: consentGiven,
              onChanged: (value) {
                setState(() {
                  consentGiven = value!;
                });
              },
              title: const Text(
                'I understand and agree to the terms above.',
                style: TextStyle(fontSize: 16),
              ),
              controlAffinity: ListTileControlAffinity.leading,
            ),

            const SizedBox(height: 20),

            // Proceed button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: consentGiven ? Colors.teal : Colors.teal.shade200,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: consentGiven
                    ? () {
                        Navigator.pushReplacementNamed(context, '/upload');
                      }
                    : null,
                child: const Text(
                  'Proceed',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
