import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inteligent_forms/features/authentication/presentation/bloc/account_type_bloc.dart/bloc/account_type_bloc.dart';

import '../../../../../core/constants/string_constants.dart';
import '../../../domain/usecases/authentication_usecase.dart';
import 'authentication_state.dart';

part 'authentication_event.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationUsecase authenticationUsecase;

  late StreamSubscription accountTypeSubscription;
  AccountTypeBloc accountTypeBloc;

  String accountType;

  AuthenticationBloc({
    required this.authenticationUsecase,
    required this.accountTypeBloc,
  })  : accountType = accountTypeBloc.state.accountType,
        super(AuthenticationInitial()) {
    accountTypeSubscription = accountTypeBloc.stream.listen(
      (event) {
        accountType = event.accountType;
      },
    );

    on<SignUpStarted>(_onSignUpStarted);
    on<LoginStarted>(_onLoginStarted);
    on<LogoutEvent>(_onLogout);
  }

  Future<void> _onSignUpStarted(
      SignUpStarted event, Emitter<AuthenticationState> emit) async {
    emit(LoadingState());

    (await authenticationUsecase.signUp(
      name: event.name,
      type: accountType,
      emailAddress: event.emailAddress,
      password: event.password,
      confirmPassword: event.confirmPassword,
      fiscalCode: event.fiscalCode,
      address: event.address,
    ))
        .fold(
      (error) => emit(SignUpFailureState(
        message: error.failureMessage,
      )),
      (succes) => emit(
        const SignUpSuccessState(
          message: AppStringSuccesMessages.signUpSuccess,
        ),
      ),
    );
  }

  @override
  Future<void> close() async {
    accountTypeSubscription.cancel();
    super.close();
  }

  Future<void> _onLoginStarted(
    LoginStarted event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(LoadingState());

    (await authenticationUsecase.login(
      email: event.emailAddress,
      password: event.password,
    ))
        .fold(
      (error) => emit(
        LoginFailureState(
          message: error.failureMessage,
        ),
      ),
      (succes) => emit(
        const LoginSuccessState(
          message: AppStringSuccesMessages.loginSuccess,
        ),
      ),
    );
  }

  Future<void> _onLogout(
    LogoutEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(LoadingState());

    (await authenticationUsecase.logout()).fold(
      (error) => emit(
        LogoutFailureState(
          message: error.failureMessage,
        ),
      ),
      (succes) => emit(
        const LogoutSuccessState(
          message: AppStringSuccesMessages.logoutSuccess,
        ),
      ),
    );
  }
}
