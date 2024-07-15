import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: 50,
        width: 300,
        child: ElevatedButton(
          onPressed: () async {
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
              UserCredential userCredential = await firebaseService
                  .firebaseAuth(emailController.text, passwordController.text);

              // Navigate to the HomePage if the user signs in successfully.
              if (userCredential.user != null &&
                  userCredential.user!.emailVerified) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (_) => HomePage(user: userCredential.user!)),
                  (route) => false,
                );
              } else {
                // Handle scenarios where the user is null or not verified.
                // For example, show an error message or navigate to a different page.
                /*
                SnackbarPopUp.showSnackBar(
                  'User is null or not verified',
                  context,
                  Colors.red,
                );
                */
              }
            } on FirebaseAuthException catch (e) {
              print(e);
              /*
              SnackbarPopUp.showSnackBar(
                e.message,
                context,
                Colors.red,
              );
              if (e.code == 'user-not-found') {
                print('No user found for that email.');
              } else if (e.code == 'wrong-password') {
                print('Wrong password provided for that user.');
              }
              */
            }
            //navigatorKey.currentState!.popUntil((route) => route.isFirst);
          },
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
