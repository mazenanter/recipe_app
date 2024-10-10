import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:recipe_app/errors/firebase_error.dart';
import 'package:recipe_app/models/user_model.dart';

class FirebaseServices {
  final authInstance = FirebaseAuth.instance;

  Future<Either<FirebaseFailure, UserCredential>> createUser(
      {required String email,
      required String password,
      required String userName}) async {
    try {
      var user = await authInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await saveUserInfo(email, userName);
      return right(user);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseServerFailure.fromFirebaseErr(e));
      } else {
        return left(FirebaseServerFailure(e.toString()));
      }
    }
  }

  Future<Either<FirebaseFailure, UserCredential>> loginUser(
      {required String email, required String password}) async {
    try {
      var user = await authInstance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(user);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseServerFailure.fromFirebaseErr(e));
      } else {
        return left(FirebaseServerFailure(e.toString()));
      }
    }
  }

  Future<void> saveUserInfo(String email, String name) async {
    final User? user = authInstance.currentUser;
    if (user != null) {
      final String uId = user.uid;
      try {
        await FirebaseFirestore.instance.collection('users').doc(uId).set(
              UserModel(
                userName: name,
                email: email,
                uId: uId,
              ).toJson(),
            );
      } catch (e) {
        log('Error saving user info: $e');
        throw Exception('Error saving user info: $e');
      }
    } else {
      log('No user found');
      throw Exception('No user found');
    }
  }
}
