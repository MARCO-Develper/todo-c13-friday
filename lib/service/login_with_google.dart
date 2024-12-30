import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_c13_friday/screens/home/home.dart';

Future<void> signInWithGoogle(BuildContext context) async {
  try {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser != null) {
      final String displayName = googleUser.displayName ?? "No Name";
      final String email = googleUser.email;

      debugPrint('User Name: $displayName');
      debugPrint('User Email: $email');

      if (context.mounted) {
        Navigator.pushNamed(context, HomeScreen.routeName);
      }
    } else {
      debugPrint('Login canceled by user.');
    }
  } catch (e) {
    debugPrint('Error during Google Sign-In: $e');
  }
}
