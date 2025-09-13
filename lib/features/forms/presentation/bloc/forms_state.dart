part of 'forms_bloc.dart';

abstract class FormsState extends Equatable {
  const FormsState();

  @override
  List<Object> get props => [];
}

class FormsInitial extends FormsState {
  @override
  List<Object> get props => [];
}

class FormsLoadingState extends FormsState {
  @override
  List<Object> get props => [];
}

class FormsLoaded extends FormsState {
  final List<FormEntity> formEntities;

  const FormsLoaded({required this.formEntities});

  @override
  List<Object> get props => [formEntities];
}

class FormsError extends FormsState {
  final String message;

  const FormsError({required this.message});

  @override
  List<Object> get props => [message];
}
