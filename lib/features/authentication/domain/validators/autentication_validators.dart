import 'package:dartz/dartz.dart';
import 'package:inteligent_forms/core/errors/failures.dart';

import '../../../../core/constants/string_constants.dart';

class AuthenticationValidator {
  Either<Failure, void> areSignUpInformationValid({
    required String emailAddress,
    required String password,
    required String confirmPassword,
    required String? fiscalCode,
  }) {
    if (!_isEmailValid(
          email: emailAddress,
        ) ||
        !_isPasswordValid(
          password: password,
          confirmPassword: confirmPassword,
        )) {
      return Left(
        FieldFailure(
          failureMessage: AppStringFailuresMessages.invalidCredentials,
        ),
      );
    }

    return const Right(null);
  }

  Either<Failure, void> areLoginInformationValid({
    required String emailAddress,
    required String password,
  }) {
    if (!_isEmailValid(
          email: emailAddress,
        ) ||
        !_isPasswordValid(
          password: password,
        )) {
      return Left(
        FieldFailure(
          failureMessage: AppStringFailuresMessages.invalidCredentials,
        ),
      );
    }

    return const Right(null);
  }

  bool _isEmailValid({required String email}) {
    final bool emailValid;
    if (email.isEmpty) {
      emailValid = false;
    } else {
      emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      ).hasMatch(email);
    }
    return emailValid;
  }

  bool _isPasswordValid({
    required String password,
    String? confirmPassword,
  }) {
    if (confirmPassword != null) {
      if (password != confirmPassword) {
        return false;
      }
    }

    if (password.isEmpty || password.length < 6) {
      return false;
    }
    return true;
  }
}
