part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class SignUpStarted extends AuthenticationEvent {
  final String name;
  final String emailAddress;
  final String password;
  final String confirmPassword;
  final String? fiscalCode;
  final String address;

  const SignUpStarted({
    required this.name,
    required this.emailAddress,
    required this.password,
    required this.confirmPassword,
    required this.fiscalCode,
    required this.address,
  });

  @override
  List<Object> get props => [
        name,
        emailAddress,
        password,
        confirmPassword,
        address,
      ];
}

class LoginStarted extends AuthenticationEvent {
  final String emailAddress;
  final String password;

  const LoginStarted({
    required this.emailAddress,
    required this.password,
  });

  @override
  List<Object> get props => [
        emailAddress,
        password,
      ];
}

class LogoutEvent extends AuthenticationEvent {
  const LogoutEvent();
}
