import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:motiv_prototype/colours.dart';

class BackToLoginText extends StatelessWidget {
  final VoidCallback onClickedSignIn;

  const BackToLoginText({super.key, required this.onClickedSignIn});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: 50,
        width: 300,
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: const TextStyle(
                  color: AppColours.buttonTextColor, fontSize: 15),
              children: [
                const TextSpan(text: 'Already have an account? '),
                TextSpan(
                  text: 'Log In',
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                    color: AppColours.primaryColor,
                    fontSize: 15,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = onClickedSignIn,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
