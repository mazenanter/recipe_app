import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:recipe_app/errors/firebase_error.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/models/user_model.dart';
import 'package:uuid/uuid.dart';

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
        var user = FirebaseAuth.instance.currentUser!;
        await user.updateDisplayName(name);
      } catch (e) {
        log('Error saving user info: $e');
        throw Exception('Error saving user info: $e');
      }
    } else {
      log('No user found');
      throw Exception('No user found');
    }
  }

  Future<void> addRecipe({
    required RecipeModel recipeModel,
    required File? imageFile,
  }) async {
    try {
      String? imageUrl = await uploadImage(imageFile!);
      log(FirebaseAuth.instance.currentUser!.displayName!);
      await FirebaseFirestore.instance.collection('recipes').add(
            RecipeModel(
              recipeTitle: recipeModel.recipeTitle,
              recipeSubTitle: recipeModel.recipeSubTitle,
              image: imageUrl!,
              userId: FirebaseAuth.instance.currentUser!.uid,
              userName: FirebaseAuth.instance.currentUser!.displayName!,
              ingredients: recipeModel.ingredients,
            ).toJson(),
          );
      log('Recipe added successfully!');
    } catch (e) {
      log('Error adding recipe: $e');
    }
  }

  Future<String?> uploadImage(File? imageFile) async {
    try {
      var imageId = const Uuid().v4();
      var ref = FirebaseStorage.instance
          .ref()
          .child('recipeImages')
          .child('$imageId.jpg');
      await ref.putFile(File(imageFile!.path));
      var imageUrl = await ref.getDownloadURL();
      log('image uploaded');
      return imageUrl;
    } catch (e) {
      log('error when upload image $e');
      return null;
    }
  }

  Future<Either<FirebaseFailure, List<RecipeModel>>> getRecipes() async {
    try {
      var firestore = FirebaseFirestore.instance;
      var data = await firestore.collection('recipes').get();
      List<RecipeModel> recipes =
          data.docs.map((doc) => RecipeModel.fromJson(doc.data())).toList();
      return right(recipes);
    } catch (e) {
      return left(FirebaseServerFailure(e.toString()));
    }
  }

  Future<Either<FirebaseFailure, List<RecipeModel>>> searchRecipes(
      {required String q}) async {
    try {
      var firestore = FirebaseFirestore.instance;
      var data = await firestore
          .collection('recipes')
          .where('recipeTitle', isGreaterThanOrEqualTo: q)
          .where('recipeTitle', isLessThanOrEqualTo: '$q\uf8ff')
          .get();
      List<RecipeModel> recipes =
          data.docs.map((doc) => RecipeModel.fromJson(doc.data())).toList();
      return right(recipes);
    } catch (e) {
      return left(FirebaseServerFailure(e.toString()));
    }
  }
}
