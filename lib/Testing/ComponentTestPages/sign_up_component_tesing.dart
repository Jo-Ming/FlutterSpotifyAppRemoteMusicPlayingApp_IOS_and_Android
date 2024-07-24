import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:motiv_prototype/ComponentLibrary/DisplayComponents/display_image_widget.dart';
import 'package:motiv_prototype/ComponentLibrary/SignUpComponents/password_input_fields.dart';
import 'package:motiv_prototype/ComponentLibrary/SignUpComponents/sign_up_text_field.dart';
import 'package:motiv_prototype/colours.dart';

import '../../ComponentLibrary/SignUpComponents/sign_up_button.dart';
import '../../ComponentLibrary/Utility/snack_bar_widget.dart';

class SignUpTestingScreen extends StatefulWidget {
  const SignUpTestingScreen({super.key});

  @override
  SignUpTestingScreenState createState() => SignUpTestingScreenState();
}

class SignUpTestingScreenState extends State<SignUpTestingScreen> {
  String _selectedWidget = 'LogoWidget';

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscured = true;

  void _toggleObscureText() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  void _showSnackBar() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      SnackbarPopUp.showSnackBar(
          "This is a test pop up!", AppColours.errorColor);
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
      case 'SignUpEmailTextWidget':
        return SignUpTextField(
          controller: _emailController,
          hintText: 'Enter Email',
        );
      case 'PasswordInputsWidget':
        return PasswordInputField(
          controller: _passwordController,
          obscureText: _isObscured,
          toggleObscureText: _toggleObscureText,
          hintText: 'Password',
        );
      case 'SignUpButton':
        _emailController.text = 'jomingrogers@gmail.com';
        _passwordController.text = 'password';
        return SignUpButton(
          emailController: _emailController,
          passwordController: _passwordController,
        );
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up Widget Testing Screen'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          DropdownButton<String>(
            value: _selectedWidget,
            items: [
              'LogoWidget',
              'SignUpEmailTextWidget',
              'PasswordInputsWidget',
              'SignUpButton'
            ].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedWidget = newValue!;
                if (_selectedWidget == 'Snackbar') {
                  _showSnackBar();
                }
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
