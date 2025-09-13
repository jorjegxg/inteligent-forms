import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:inteligent_forms/core/constants/firestore_constants.dart';
import 'package:inteligent_forms/core/constants/string_constants.dart';
import 'package:inteligent_forms/core/errors/exceptions.dart';
import 'package:inteligent_forms/features/profile/data/datasources/firestore_user_api.dart';

import '../../models/user_model.dart';

class AuthenticationFirestoreApi {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signUp({
    required String name,
    required String type,
    required String emailAddress,
    required String password,
    required String? fiscalCode,
    required String address,
  }) async {
    try {
      //check if name is already in use
      final docsThatHaveName = await _firestore
          .collection(
            AppFirestoreCollectionNames.users,
          )
          .where(
            AppFirestoreUsersFields.name,
            isEqualTo: name,
          )
          .limit(1)
          .get();

      if (docsThatHaveName.docs.isNotEmpty) {
        throw MediumException(
          runtimeType,
          AppStringFailuresMessages.nameAlreadyInUse,
        );
      }

      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      UserModel userModel = UserModel(
        userId: userCredential.user!.uid,
        name: name,
        accountType: type,
        emailAddress: emailAddress,
        fiscalCode: fiscalCode,
        address: address,
      );

      await FirestoreUserApi().updateUser(userModel: userModel);
    } on FirebaseAuthException catch (error) {
      String errorMessage = error.message!;

      if (error.code == 'email-already-in-use') {
        errorMessage = AppStringFailuresMessages.emailAlreadyInUse;
      }

      throw MediumException(
        runtimeType,
        errorMessage,
      );
    } on FirebaseException catch (error) {
      throw MediumException(
        runtimeType,
        error.toString(),
      );
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (error) {
      String errorMessage = error.message!;

      if (error.code == 'user-not-found') {
        errorMessage = AppStringFailuresMessages.userNotFound;
      } else if (error.code == 'wrong-password') {
        errorMessage = AppStringFailuresMessages.wrongPassword;
      }

      throw MediumException(runtimeType, errorMessage);
    }
  }

  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (error) {
      throw MediumException(
        runtimeType,
        error.toString(),
      );
    }
  }
}
