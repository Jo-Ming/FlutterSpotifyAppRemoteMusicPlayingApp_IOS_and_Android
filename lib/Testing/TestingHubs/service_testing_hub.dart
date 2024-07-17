import 'package:flutter/material.dart';
import '../ServiceTestingPages/firebase_service_test_page.dart';

class ServiceTestingHubPage extends StatefulWidget {
  const ServiceTestingHubPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ServiceTestingHubPageState createState() => _ServiceTestingHubPageState();
}

class _ServiceTestingHubPageState extends State<ServiceTestingHubPage> {
  String _selectedPage = 'FirebaseServiceTestingPage';

  void _navigateToSelectedPage() {
    Widget selectedPage;

    switch (_selectedPage) {
      case 'FirebaseServiceTestingPage':
        selectedPage = const FirebaseServiceTestPage();
        break;
      default:
        selectedPage = const FirebaseServiceTestPage();
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => selectedPage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Testing Hub Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: _selectedPage,
              items: const [
                DropdownMenuItem(
                  value: 'FirebaseServiceTestingPage',
                  child: Text('FirebaseServiceTestingPage'),
                ),
                // Add other service testing pages here as DropdownMenuItem
              ],
              onChanged: (String? newValue) {
                setState(() {
                  _selectedPage = newValue!;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _navigateToSelectedPage,
              child: const Text('Navigate to Selected Page'),
            ),
          ],
        ),
      ),
    );
  }
}
