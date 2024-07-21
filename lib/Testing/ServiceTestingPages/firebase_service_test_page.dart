import 'package:flutter/material.dart';

import '../../Services/firebase_service.dart';

class FirebaseServiceTestPage extends StatefulWidget {
  const FirebaseServiceTestPage({super.key});

  @override
  FirebaseServiceTestPageState createState() => FirebaseServiceTestPageState();
}

class FirebaseServiceTestPageState extends State<FirebaseServiceTestPage> {
  String _selectedService = 'FirebaseAuth';
  String _output = '';
  final FirebaseService service = FirebaseService();

  void _callService() async {
    if (_selectedService == 'FirebaseAuth') {
      Map<String, dynamic> authentication =
          await service.firebaseAuth('jomingrogers@gmail.com', 'password');
      setState(() {
        _output = authentication.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Service Test Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              value: _selectedService,
              items: ['FirebaseAuth'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedService = newValue!;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _callService,
              child: const Text('Call Service'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Output:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(_output),
            ),
          ],
        ),
      ),
    );
  }
}
