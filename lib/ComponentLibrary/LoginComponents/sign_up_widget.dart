import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:motiv_prototype/Pages/LoginPages/sign_up_page.dart';
import 'package:motiv_prototype/colours.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({super.key});

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
              style: const TextStyle(
                  color: AppColours.buttonTextColor, fontSize: 15),
              children: [
                const TextSpan(text: 'No account? '),
                TextSpan(
                  text: 'Sign Up',
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                    color: AppColours.primaryColor,
                    fontSize: 15,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      debugPrint("User tapped on sign up");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SignUpPage()),
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
