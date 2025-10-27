import 'package:flutter/material.dart';

class FurtherScreen extends StatelessWidget {
  const FurtherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Further Screen'),
        backgroundColor: Colors.teal,
      ),
      body: const Center(
        child: Text('This is the Further Screen!'),
      ),
    );
  }
}