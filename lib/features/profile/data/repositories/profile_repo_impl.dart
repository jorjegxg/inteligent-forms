import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:inteligent_forms/core/errors/failures.dart';
import 'package:inteligent_forms/features/authentication/data/models/user_model.dart';
import 'package:inteligent_forms/features/profile/data/datasources/firestore_user_api.dart';
import 'package:inteligent_forms/features/profile/domain/entities/profile_entity.dart';
import 'package:inteligent_forms/features/profile/domain/repositories/profile_repo.dart';

import '../../../../core/constants/string_constants.dart';
import '../../../../core/utils/logger.dart';

class ProfileRepoImpl extends ProfileRepo {
  FirestoreUserApi firestoreUserApi = FirestoreUserApi();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Future<Either<Failure, ProfileEntity>> getProfile() async {
    try {
      final currentUserId = firebaseAuth.currentUser!.uid;

      final UserModel userModel = await firestoreUserApi.getUser(
        userId: currentUserId,
      );

      return Right(
        ProfileEntity(
          name: userModel.name,
          email: userModel.emailAddress,
          accountType: userModel.accountType,
          address: userModel.address,
          fiscalCode: userModel.fiscalCode ?? '',
        ),
      );
    } on Exception catch (e) {
      Logger.error(runtimeType, e.toString());
      return Left(
        MediumFailure(
          failureMessage: AppStringFailuresMessages.unexpectedFailure,
        ),
      );
    }
  }
}
