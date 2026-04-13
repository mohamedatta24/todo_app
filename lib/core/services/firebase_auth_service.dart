import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/core/errors/custom_exception.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("FirebaseAuthException: ${e.code} - ${e.message}");
      if (e.code == 'weak-password') {
        throw CustomException('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException('The account already exists for that email.');
      } else if (e.code == "network-request-failed") {
        throw CustomException('Please check your internet connection');
      } else {
        throw CustomException('An error occurred while creating the user.');
      }
    } catch (e) {
      throw CustomException('An unexpected error occurred.');
    }
  }

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("FirebaseAuthException: ${e.code} - ${e.message}");
      if (e.code == 'user-not-found') {
        throw CustomException('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw CustomException('Wrong password provided for that user.');
      } else if (e.code == "network-request-failed") {
        throw CustomException('Please check your internet connection');
      } else {
        throw CustomException('An error occurred while signing in the user.');
      }
    } catch (e) {
      throw CustomException('An unexpected error occurred.');
    }
  }
}
