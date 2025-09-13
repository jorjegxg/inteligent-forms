import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inteligent_forms/features/profile/domain/entities/profile_entity.dart';
import 'package:inteligent_forms/features/profile/domain/usecases/profile_usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileUsecase profileUsecase;

  ProfileBloc({required this.profileUsecase}) : super(ProfileInitial()) {
    on<ProfileLoadEvent>(_onProfileLoadEvent);
  }

  Future<void> _onProfileLoadEvent(
    ProfileLoadEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());

    (await profileUsecase.getProfileEntity()).fold(
      (failure) => emit(ProfileError(
        failure.failureMessage,
      )),
      (profileEntity) => emit(ProfileLoaded(
        profileEntity,
      )),
    );
  }
}
