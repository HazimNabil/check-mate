import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> login(String? email, String? password) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
    } on FirebaseAuthException catch (e) {
      throw handleAuthException(e);
    } catch (e) {
      throw FormatException(e.toString());
    }
  }

  Future<void> register(String? email, String? password) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
    } on FirebaseAuthException catch (e) {
      throw handleAuthException(e);
    } catch (e) {
      throw FormatException(e.toString());
    }
  }

  Future<void> logout() async {
    await auth.signOut();
  }

  String getCurrentUserId() {
    return auth.currentUser!.uid;
  }

  Stream<User?> getUserState() {
    return auth.authStateChanges();
  }

  FormatException handleAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return const FormatException('The password provided is too weak.');
      case 'email-already-in-use':
        return const FormatException(
          'An account already exists for that email.',
        );
      case 'user-not-found':
        return const FormatException('No user found for that email.');
      case 'wrong-password':
        return const FormatException('Wrong password provided.');
      case 'invalid-credential':
        return const FormatException(
          'Invalid credentials. Please double-check your email and password, and try again',
        );
      default:
        return FormatException(e.message ?? 'An unknown error occurred.');
    }
  }
}
