import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class LoadingState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class SignUpSuccessState extends AuthenticationState {
  final String message;

  const SignUpSuccessState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class SignUpFailureState extends AuthenticationState {
  final String message;

  const SignUpFailureState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class LoginSuccessState extends AuthenticationState {
  final String message;

  const LoginSuccessState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class LoginFailureState extends AuthenticationState {
  final String message;

  const LoginFailureState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class LogoutSuccessState extends AuthenticationState {
  final String message;

  const LogoutSuccessState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}


class LogoutFailureState extends AuthenticationState {
  final String message;

  const LogoutFailureState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}