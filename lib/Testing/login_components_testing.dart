import 'package:flutter/material.dart';
import 'package:motiv_prototype/ComponentLibrary/DisplayComponents/display_image_widget.dart';

import '../ComponentLibrary/TextWidgets/custom_text_input_field.dart';

class LoginTestingScreen extends StatefulWidget {
  const LoginTestingScreen({super.key});

  @override
  LoginTestingScreenState createState() => LoginTestingScreenState();
}

class LoginTestingScreenState extends State<LoginTestingScreen> {
  String _selectedWidget = 'LogoWidget';

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscured = true;

  void _toggleObscureText() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  Widget _buildWidgetToTest() {
    switch (_selectedWidget) {
      case 'LogoWidget':
        return const DisplayImageWidget(
            fileLocation: "lib/Images/motiv.png",
            width: 250,
            height: 150,
            padding: 10,
            isNetworkImage: false);
      case 'NetworkImageWidget':
        return const DisplayImageWidget(
            fileLocation: "https://www.imdb.com/name/nm1869101/mediaindex/",
            width: 250,
            height: 150,
            padding: 10,
            isNetworkImage: true);
      case 'CustomTextFieldEmail':
        return CustomTextInputField(
          controller: _emailController,
          hintText: 'Email',
        );
      case 'CustomTextFieldPassword':
        return CustomTextInputField(
          controller: _passwordController,
          hintText: 'Password',
          obscureText: _isObscured,
          toggleObscureText: _toggleObscureText,
        );
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
              'NetworkImageWidget',
              'CustomTextFieldEmail',
              'CustomTextFieldPassword'
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
