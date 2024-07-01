import 'package:flutter/material.dart';
import 'package:motiv_v1/ComponentLibrary/display_components/logo_widget.dart';

class LoginTestingScreen extends StatefulWidget {
  const LoginTestingScreen({super.key});

  @override
  LoginTestingScreenState createState() => LoginTestingScreenState();
}

class LoginTestingScreenState extends State<LoginTestingScreen> {
  String _selectedWidget = 'LogoWidget';

  //final TextEditingController _emailController = TextEditingController();
  //final TextEditingController _passwordController = TextEditingController();
  //bool _isObscured = true;

  /*
  void _toggleObscureText() {
    setState(() {
      _isObscured = !_isObscured;
    });
  } */

  Widget _buildWidgetToTest() {
    switch (_selectedWidget) {
      case 'LogoWidget':
        return const LogoWidget();
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Widget Testing Screen'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          DropdownButton<String>(
            value: _selectedWidget,
            items: [
              'LogoWidget',
            ].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedWidget = newValue!;
              });
            },
          ),
          Expanded(
            child: Center(
              child: _buildWidgetToTest(),
            ),
          ),
        ],
      ),
    );
  }
}
