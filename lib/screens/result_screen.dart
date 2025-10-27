// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'upload_result.dart';

// class ResultScreen extends StatelessWidget {
//   final String disease;
//   final double confidence;
//   final File imageFile;

//   const ResultScreen({
//     super.key,
//     required this.disease,
//     required this.confidence,
//     required this.imageFile,
//   });

//   @override
//   Widget build(BuildContext context) {
//     // Convert confidence to percentage (0–100)
//     final double confidencePercent = (confidence * 100).clamp(0.0, 100.0);

//     // Determine severity level
//     String severity;
//     Widget recommendation;

//     if (confidencePercent < 60) {
//       severity = "Low Severity";
//       recommendation = Column(
//         children: const [
//           Text(
//             "🩹 Mild symptoms detected.",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             textAlign: TextAlign.center,
//           ),
//           SizedBox(height: 10),
//           Text(
//             "Tips:\n• Keep the area clean and moisturized.\n• Avoid harsh products.\n• Monitor symptoms for any changes.",
//             style: TextStyle(fontSize: 16, color: Colors.black54),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       );
//     } else if (confidencePercent < 80) {
//       severity = "Medium Severity";
//       recommendation = Column(
//         children: const [
//           Text(
//             "⚕️ Moderate symptoms detected.",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             textAlign: TextAlign.center,
//           ),
//           SizedBox(height: 10),
//           Text(
//             "Recommendation:\nConsider consulting a dermatologist for proper diagnosis and medication.",
//             style: TextStyle(fontSize: 16, color: Colors.black54),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       );
//     } else {
//       severity = "High Severity";
//       recommendation = Column(
//         children: [
//           const Text(
//             "🚨 Severe condition suspected.",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 10),
//           const Text(
//             "Immediate Action:\nBook an appointment with a certified dermatologist f`or a detailed examination.",
//             style: TextStyle(fontSize: 16, color: Colors.black54),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 20),
//           ElevatedButton.icon(
//             onPressed: () {
//               // TODO: Add navigation to your appointment scheduling page
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(
//                   content: Text("Appointment scheduling coming soon!"),
//                 ),
//               );
//             },
//             icon: const Icon(Icons.calendar_month, color: Colors.white),
//             label: const Text("Book Appointment"),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.teal,
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(14),
//               ),
//             ),
//           ),
//         ],
//       );
//     }

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text("Prediction Result"),
//         centerTitle: true,
//         backgroundColor: Colors.teal,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             UploadResult(
//               disease: disease,
//               confidence: confidencePercent,
//               imageFile: imageFile,
//             ),
//             const SizedBox(height: 20),
//             Text(
//               "Confidence: ${confidencePercent.toStringAsFixed(1)}%",
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.black87,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Container(
//               padding: const EdgeInsets.all(14),
//               decoration: BoxDecoration(
//                 color: Colors.teal.shade50,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Column(
//                 children: [
//                   Text(
//                     severity,
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.teal.shade800,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   recommendation,
//                 ],
//               ),
//             ),
//             const SizedBox(height: 30),
//             ElevatedButton(
//               onPressed: () => Navigator.pop(context),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.teal,
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(14),
//                 ),
//               ),
//               child: const Text(
//                 "Back",
//                 style: TextStyle(color: Colors.white, fontSize: 16),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'upload_result.dart';

class ResultScreen extends StatelessWidget {
  final String disease;
  final double confidence;
  final File imageFile;

  const ResultScreen({
    super.key,
    required this.disease,
    required this.confidence,
    required this.imageFile,
  });

  @override
  Widget build(BuildContext context) {
    // Convert confidence to percentage (0–100)
    final double confidencePercent = (confidence * 100).clamp(0.0, 100.0);

    // Determine severity level
    String severity;
    Widget recommendation;

    if (confidencePercent < 60) {
      severity = "Low Severity";
      recommendation = Column(
        children: const [
          Text(
            "🩹 Mild symptoms detected.",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            "Tips:\n• Keep the area clean and moisturized.\n• Avoid harsh products.\n• Monitor symptoms for any changes.",
            style: TextStyle(fontSize: 16, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
        ],
      );
    } else if (confidencePercent < 80) {
      severity = "Medium Severity";
      recommendation = Column(
        children: const [
          Text(
            "⚕️ Moderate symptoms detected.",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            "Recommendation:\nConsider consulting a dermatologist for proper diagnosis and medication.",
            style: TextStyle(fontSize: 16, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
        ],
      );
    } else {
      severity = "High Severity";
      recommendation = Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "🚨 Severe condition suspected.",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          const Text(
            "Immediate Action:\nBook an appointment with a certified dermatologist for a detailed examination.",
            style: TextStyle(fontSize: 16, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          _MockAppointmentSection(), // 🩺 Added mock booking section
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Prediction Result"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            UploadResult(
              disease: disease,
              confidence: confidencePercent,
              imageFile: imageFile,
            ),
            const SizedBox(height: 20),
            Text(
              "Confidence: ${confidencePercent.toStringAsFixed(1)}%",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text(
                    severity,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade800,
                    ),
                  ),
                  const SizedBox(height: 10),
                  recommendation,
                ],
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                "Back",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 🩺 Mock Appointment Section for Pune Dermatologists
class _MockAppointmentSection extends StatelessWidget {
  const _MockAppointmentSection();

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> doctors = [
      {
        "name": "Dr. Neha Kulkarni",
        "clinic": "SkinGlow Clinic, Kothrud, Pune",
        "rating": "⭐ 4.8",
        "availability": "Tomorrow, 10:00 AM – 1:00 PM"
      },
      {
        "name": "Dr. Rajesh Patil",
        "clinic": "DermaCare Centre, Baner, Pune",
        "rating": "⭐ 4.6",
        "availability": "Tomorrow, 2:00 PM – 5:00 PM"
      },
      {
        "name": "Dr. Meenal Deshmukh",
        "clinic": "Radiant Skin Clinic, Aundh, Pune",
        "rating": "⭐ 4.9",
        "availability": "Tomorrow, 11:30 AM – 3:00 PM"
      },
      {
        "name": "Dr. Amit Joshi",
        "clinic": "DermaWell Clinic, Viman Nagar, Pune",
        "rating": "⭐ 4.7",
        "availability": "Tomorrow, 5:00 PM – 8:00 PM"
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Available Dermatologists (Pune)",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
        const SizedBox(height: 10),
        ...doctors.map((doc) {
          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.teal,
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: Text(doc["name"]!),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(doc["clinic"]!),
                  Text(doc["availability"]!,
                      style: const TextStyle(color: Colors.black54)),
                  Text(doc["rating"]!,
                      style: const TextStyle(color: Colors.orange)),
                ],
              ),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
                onPressed: () {
                  _showBookingDialog(context, doc["name"]!);
                },
                child: const Text("Book"),
              ),
            ),
          );
        }),
      ],
    );
  }

  /// Simple confirmation dialog for mock booking
  static void _showBookingDialog(BuildContext context, String doctorName) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Appointment Confirmed"),
        content: Text("Your appointment with $doctorName (Pune) is booked!"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK", style: TextStyle(color: Colors.teal)),
          ),
        ],
      ),
    );
  }
}
