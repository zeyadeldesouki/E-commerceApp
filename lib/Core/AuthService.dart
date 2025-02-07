// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  Future<void> SignUp({required String email, required String password}) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> SignIn({required String email, required String password}) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> SetPassword({required String email}) async {
    FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}
