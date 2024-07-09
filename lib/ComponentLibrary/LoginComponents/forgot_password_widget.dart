import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:motiv_prototype/Pages/LoginPages/forget_password_page.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: SizedBox(
        height: 35,
        width: 300,
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: const TextStyle(color: Colors.white, fontSize: 15),
              children: [
                TextSpan(
                  text: 'Forgot Password?',
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.cyan,
                    fontSize: 15,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      debugPrint("User tapped on forgot password");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const ForgotPasswordPage()),
                      );
                    },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
