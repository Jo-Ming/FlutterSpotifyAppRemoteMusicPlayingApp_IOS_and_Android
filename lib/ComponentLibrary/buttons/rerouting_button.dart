import 'package:flutter/material.dart';
import 'package:motiv_v1/colours.dart';

// This button widget is used for navigating to another page.
class ReroutingButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const ReroutingButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            AppColours.buttonColor, // Customize the button color if needed
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        textStyle: const TextStyle(fontSize: 16),
      ),
      child: Text(buttonText),
    );
  }
}
