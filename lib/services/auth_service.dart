import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  Future<bool> storeUser(String name, String email) async {
    try {
      final CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('users');

      final userDocRef = usersCollection.doc();

      await userDocRef.set({
        'name': name,
        'email': email,
      });

      log('User data stored successfully!');
      return true;
    } catch (e) {
      log('Error storing user data: $e');
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      log('Login successful: ${userCredential.user?.uid}');
      return true;
    } catch (e) {
      log('Error logging in: $e');
      return false;
    }
  }

  Future<bool> signUp(String email, String password, String name) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      log('Sign up successful: ${userCredential.user?.uid}');
      bool res = await storeUser(name, email);
      return res;
    } catch (e) {
      log('Error signing up: $e');
      return false;
    }
  }
}
