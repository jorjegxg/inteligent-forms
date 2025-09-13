// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:inteligent_forms/features/authentication/domain/validators/autentication_validators.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/authentication_repo.dart';

class AuthenticationUsecase {
  AuthenticationValidator authenticationValidator;
  AuthenticationRepo authenticationRepo;

  AuthenticationUsecase({
    required this.authenticationValidator,
    required this.authenticationRepo,
  });

  Future<Either<Failure, void>> signUp({
    required String name,
    required String type,
    required String emailAddress,
    required String password,
    required String confirmPassword,
    required String? fiscalCode,
    required String address,
  }) async {
    final Either<Failure, void> areSignUpInformationValid =
        authenticationValidator.areSignUpInformationValid(
      emailAddress: emailAddress,
      password: password,
      confirmPassword: confirmPassword,
      fiscalCode: fiscalCode,
    );

    if (areSignUpInformationValid.isLeft()) {
      return areSignUpInformationValid;
    }

    return authenticationRepo.signUp(
      name: name,
      type: type,
      emailAddress: emailAddress,
      password: password,
      fiscalCode: fiscalCode,
      address: address,
    );
  }

  Future<Either<Failure, void>> login({
    required String email,
    required String password,
  }) async {
    final Either<Failure, void> areLoginInformationValid =
        authenticationValidator.areLoginInformationValid(
      emailAddress: email,
      password: password,
    );

    if (areLoginInformationValid.isLeft()) {
      return areLoginInformationValid;
    }

    return authenticationRepo.login(
      email: email,
      password: password,
    );
  }

  Future<Either<Failure, void>> logout() async {
    return authenticationRepo.logout();
  }
}
