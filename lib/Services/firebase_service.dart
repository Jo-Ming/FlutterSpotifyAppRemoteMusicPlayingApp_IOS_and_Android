import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class FirebaseService {
  // function used for motiv login authentication.
  Future<Map<String, dynamic>> firebaseAuth(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return {
        'success': true,
        'userCredential': userCredential,
      };
    } on FirebaseAuthException catch (e) {
      debugPrint('FirebaseAuthException: ${e.code}, ${e.message}');
      return {
        'success': false,
        'error': e.message,
      };
    } catch (e) {
      return {
        'success': false,
        'error': 'An unexpected error occurred',
      };
    }
  }

  // funciton used for firebase account creation.
  Future<Map<String, dynamic>> signUp(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return {
        'success': true,
        'userCredential': userCredential,
      };
    } on FirebaseAuthException catch (e) {
      debugPrint('FirebaseAuthException: ${e.code}, ${e.message}');
      return {
        'success': false,
        'error': e.message,
      };
    } catch (e) {
      return {
        'success': false,
        'error': 'An unexpected error occurred',
      };
    }
  }
}
