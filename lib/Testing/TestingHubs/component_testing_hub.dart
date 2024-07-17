import 'package:flutter/material.dart';
import 'package:motiv_prototype/Testing/ComponentTestPages/loading_spinner_testing.dart';
import 'package:motiv_prototype/Testing/ComponentTestPages/login_components_testing.dart';

class ComponentTestingHubPage extends StatefulWidget {
  const ComponentTestingHubPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ComponentTestingHubPageState createState() =>
      _ComponentTestingHubPageState();
}

class _ComponentTestingHubPageState extends State<ComponentTestingHubPage> {
  String _selectedPage = 'SpinnerTestingPage';

  void _navigateToSelectedPage() {
    Widget selectedPage;

    switch (_selectedPage) {
      case 'SpinnerTestingPage':
        selectedPage = const SpinnerTestingScreen();
        break;
      case 'LoginPageWidgets':
        selectedPage = const LoginTestingScreen();
        break;
      default:
        selectedPage = const LoginTestingScreen();
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
        title: const Text('Main Testing Page'),
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
                  value: 'SpinnerTestingPage',
                  child: Text('SpinnerTestingPage'),
                ),
                DropdownMenuItem(
                  value: 'LoginPageWidgets',
                  child: Text('LoginPageWidgets'),
                ),
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
