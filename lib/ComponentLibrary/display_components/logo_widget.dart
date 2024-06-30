import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Center(
        child: SizedBox(
          width: 200,
          height: 150,
          child: Image.asset('lib/Images/motiv.png'),
        ),
      ),
    );
  }
}
