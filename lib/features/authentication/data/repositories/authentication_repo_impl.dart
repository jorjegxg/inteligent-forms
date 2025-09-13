import 'package:dartz/dartz.dart';
import 'package:inteligent_forms/core/errors/exceptions.dart';
import 'package:inteligent_forms/core/errors/failures.dart';
import 'package:inteligent_forms/core/utils/logger.dart';

import '../../../../core/constants/string_constants.dart';
import '../../domain/repositories/authentication_repo.dart';
import '../datasources/remote/authentication_firestore_api.dart';

class AuthenticationRepoImpl extends AuthenticationRepo {
  final AuthenticationFirestoreApi authFirestoreApi;

  AuthenticationRepoImpl({required this.authFirestoreApi});

  @override
  Future<Either<Failure, void>> login({
    required String email,
    required String password,
  }) async {
    try {
      await authFirestoreApi.login(
        email: email,
        password: password,
      );

      return const Right(null);
    } on AppException catch (e) {
      return Left(
        HardFailure(
          failureMessage: e.message,
        ),
      );
    } on Exception catch (e) {
      Logger.error(runtimeType, e.toString());

      return Left(
        HardFailure(
          failureMessage: AppStringFailuresMessages.unexpectedFailure,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> signUp({
    required String name,
    required String type,
    required String emailAddress,
    required String password,
    required String? fiscalCode,
    required String address,
  }) async {
    try {
      await authFirestoreApi.signUp(
        name: name,
        type: type,
        emailAddress: emailAddress,
        password: password,
        fiscalCode: fiscalCode,
        address: address,
      );

      return const Right(null);
    } on AppException catch (e) {
      return Left(
        HardFailure(
          failureMessage: e.message,
        ),
      );
    } on Exception catch (e) {
      Logger.error(runtimeType, e.toString());

      return Left(
        HardFailure(
          failureMessage: AppStringFailuresMessages.unexpectedFailure,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      authFirestoreApi.logout();

      return const Right(null);
    } on AppException catch (e) {
      return Left(
        HardFailure(
          failureMessage: e.message,
        ),
      );
    } on Exception catch (e) {
      Logger.error(runtimeType, e.toString());

      return Left(
        HardFailure(
          failureMessage: AppStringFailuresMessages.unexpectedFailure,
        ),
      );
    }
  }
}
