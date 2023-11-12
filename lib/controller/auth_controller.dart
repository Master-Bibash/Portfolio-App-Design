import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projject/common/reusablealert.dart';
import 'package:projject/screens/HomeScreen/homescreen.dart';
import '../screens/HomeScreen/loginscreen.dart';

class AuthController {
  static final FirebaseAuth auth = FirebaseAuth.instance;

  static Future<void> loginUser(
      String email, String password, BuildContext context) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      reusableSnackbar.showSnackBar(context, "Login success");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  homeScreen()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        showAboutDialog(context: context);
      } else {
        reusableSnackbar.showSnackBar(context, e.message!);
      }
    }
  }

static void createUser(String email, String password, BuildContext context) async {
  try {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
    reusableSnackbar.showSnackBar(context, "Account created");
    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  } on FirebaseAuthException catch (e) {
    print("Firebase Auth Error: ${e.code}, ${e.message}");
    if (e.code == 'weak-password') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("Password is too weak. It should be at least 6 characters."),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message.toString()),
      ));
    }
  } catch (e) {
    print("An error occurred: $e");
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("An error occurred: $e"),
    ));
  }
}


  static void sendResetLink(String email, BuildContext context) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Reset link sent successfully. Check your email."),
      ));
    } on FirebaseAuthException catch (e) {
      print("Firebase Auth Error: ${e.code}, ${e.message}");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message.toString()),
      ));
    } catch (e) {
      print("An error occurred: $e");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Failed to send reset link email: $e"),
      ));
    }
  }
}
