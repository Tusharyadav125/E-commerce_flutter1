import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseTestPage extends StatelessWidget {
  const FirebaseTestPage({super.key});

  Future<void> testFirestore() async {
    try {
      await FirebaseFirestore.instance
          .collection('test')
          .add({'message': 'Firebase is working!', 'timestamp': FieldValue.serverTimestamp()});
      print('✅ Firestore test document added!');
    } catch (e) {
      print('❌ Firestore test failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Firebase Test")),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await testFirestore();
          },
          child: const Text("Test Firestore"),
        ),
      ),
    );
  }
}
