import 'package:flutter/material.dart';
import '../../Pages/HomePages/home_page.dart';
import '../../Services/firebase_service.dart';
import '../../colours.dart';
import '../LoadingSpinners/loading_spinner_wave.dart';

class LoginButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginButton({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  Future<void> _login(BuildContext context) async {
    debugPrint("User tapped on login button");
    FirebaseService firebaseService = FirebaseService();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: WaveSpinner(
          size: 50.0,
          color: Colors.blue,
          duration: Duration(milliseconds: 1200),
        ),
      ),
    );
    try {
      Map<String, dynamic> result = await firebaseService.firebaseAuth(
        emailController.text,
        passwordController.text,
      );

      // Close the loading spinner dialog
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      }

      // Navigate to the HomePage if the user signs in successfully.
      if (result['success'] &&
          result['userCredential'].user != null &&
          result['userCredential'].user!.emailVerified) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (_) => HomePage(user: result['userCredential'].user!)),
          (route) => false,
        );
      } else {
        // Handle scenarios where the user is null or not verified.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result['error']),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      // Close the loading spinner dialog in case of an error
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      }

      // Handle unexpected errors.
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An unexpected error occurred'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: 50,
        width: 300,
        child: ElevatedButton(
          onPressed: () => _login(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColours.buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock, color: AppColours.buttonTextColor),
              SizedBox(width: 10),
              Text(
                'Login',
                style: TextStyle(
                  color: AppColours.buttonTextColor,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
