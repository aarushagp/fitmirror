import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// SIGN UP
  Future<User?> signUp(String email, String password) async {
    try {

      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;

    } catch (e) {
      print(e);
      return null;
    }
  }

  /// LOGIN
  Future<User?> signIn(String email, String password) async {
    try {

      UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;

    } catch (e) {
      print(e);
      return null;
    }
  }

  /// LOGOUT
  Future<void> signOut() async {
    await _auth.signOut();
  }

}