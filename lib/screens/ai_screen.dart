import 'package:flutter/material.dart';

class AIScreen extends StatelessWidget {
  const AIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI in DermaDx'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView( // ✅ Makes content scrollable
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // ✅ Left-align text
          children: const [
            SizedBox(height: 30),
            Text(
              'How AI Works in DermaDx',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '🧠 AI Model and Tuning in DermaDx\n\n'
              'At the heart of DermaDx lies a custom-built Convolutional Neural Network (CNN) — the intelligent engine responsible for accurately identifying and classifying a wide range of skin conditions. Designed specifically for dermatological image analysis, this CNN learns to see the world like a computer dermatologist, recognizing even subtle visual cues in skin texture, color, and pattern.\n\n'
              
              'The model follows a sequential architecture composed of four convolutional blocks. Each block consists of:\n\n'
              '• Conv2D layers with ReLU activation for detecting important image features.\n'
              '• BatchNormalization layers that stabilize and accelerate training.\n'
              '• MaxPooling2D layers that reduce feature map size and improve efficiency.\n\n'
              
              'The number of filters starts at 32 and goes up to 256, helping the network learn from simple features (like edges or gradients) to complex ones (like lesion shapes and skin patterns).\n\n'
              
              'The CNN is trained on RGB images of size (IMG_SIZE, IMG_SIZE, 3) — ideal for real-world smartphone photos. Instead of flattening, it uses GlobalAveragePooling2D, reducing overfitting and preserving spatial context.\n\n'
              
              'Next, a Dense layer with 256 neurons and ReLU activation captures deeper feature relationships. A 50% dropout layer prevents overfitting, ensuring robust generalization to new images.\n\n'
              
              'BatchNormalization is applied throughout to stabilize learning. The Adam optimizer adjusts learning rates dynamically, achieving faster and more reliable convergence.\n\n'
              
              'For evaluation, the model uses Categorical Crossentropy Loss and tracks both Accuracy and AUC (Area Under the Curve) metrics. The multi-label AUC setup is especially valuable for medical AI — it measures how well the model distinguishes between different conditions and severity levels.\n\n'
              
              'By combining these design and tuning techniques, DermaDx’s CNN delivers a powerful balance of accuracy, speed, and interpretability. It identifies conditions like acne, eczema, and psoriasis — and provides confidence scores that support severity detection and personalized recommendations. DermaDx is built to be not just smart, but trustworthy — an intelligent, ethical, and user-friendly digital health companion.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                height: 1.5,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
