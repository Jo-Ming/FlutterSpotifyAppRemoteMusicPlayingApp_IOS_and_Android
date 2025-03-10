import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:motiv_prototype/ComponentLibrary/DisplayComponents/display_image_widget.dart';
import 'package:motiv_prototype/ComponentLibrary/LoginComponents/forgot_password_widget.dart';
import 'package:motiv_prototype/colours.dart';

import '../../ComponentLibrary/LoginComponents/login_button.dart';
import '../../ComponentLibrary/LoginComponents/sign_up_widget.dart';
import '../../ComponentLibrary/TextWidgets/custom_text_input_field.dart';
import '../../ComponentLibrary/Utility/snack_bar_widget.dart';

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
      case 'NetworkImageWidget':
        return const DisplayImageWidget(
            fileLocation:
                "https://imgs.search.brave.com/VRKRYzaSHSuPz7sA6IBEnCRBWJ9Su8_k6zp4ILV40-U/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9tLm1l/ZGlhLWFtYXpvbi5j/b20vaW1hZ2VzL00v/TVY1Qk1qVmtNVFpt/WVRJdE4yUXlNaTAw/TmpObExXRTROVFV0/WVdFeU5ETXhaVEk0/TkRaalhrRXlYa0Zx/Y0dkZVFYVnlPVFF4/TnpNMk1qWUAuanBn",
            width: 300,
            height: 300,
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
      case 'LoginButton':
        _emailController.text = 'jomingrogers@gmail.com';
        _passwordController.text = 'password';
        return LoginButton(
          emailController: _emailController,
          passwordController: _passwordController,
        );
      case 'ForgotPasswordWidget':
        return const ForgotPasswordWidget();
      case 'SignUpWidget':
        return const SignUpWidget();
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
              'CustomTextFieldPassword',
              'Snackbar',
              'LoginButton',
              'ForgotPasswordWidget',
              'SignUpWidget'
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
