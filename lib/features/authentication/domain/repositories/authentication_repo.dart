import 'package:dartz/dartz.dart';
import 'package:inteligent_forms/core/errors/failures.dart';

abstract class AuthenticationRepo {
  Future<Either<Failure, void>> signUp({
    required String name,
    required String type,
    required String emailAddress,
    required String password,
    required String? fiscalCode,
    required String address,
  });

  Future<Either<Failure, void>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> logout();
}
