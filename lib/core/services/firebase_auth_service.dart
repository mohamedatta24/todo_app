import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_app/core/errors/custom_exception.dart';

class FirebaseAuthService {
  // createUserWithEmailAndPassword--------------------------------------
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

  // sign in with email and password--------------------------------------
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

  // google sign in-------------------------------------------------
  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  // signInWithFacebook------------------------------------------------
  Future<User> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login(
        permissions: ['email', 'public_profile'],
      );

      if (loginResult.status != LoginStatus.success ||
          loginResult.accessToken == null) {
        throw CustomException('Facebook login was cancelled or failed.');
      }

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        facebookAuthCredential,
      );

      return userCredential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        throw CustomException(
          'This email is already registered using another sign-in Google',
        );
      }

      throw CustomException(
        e.message ?? 'An error occurred during Firebase authentication.',
      );
    } catch (e) {
      throw CustomException('Facebook login failed. Please try again.');
    }
  }
}
