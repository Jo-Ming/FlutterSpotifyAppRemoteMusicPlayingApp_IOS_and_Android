import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  // function used for motiv login authentication.
  Future<UserCredential> firebaseAuth(String email, String password) async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential;
  }
}
