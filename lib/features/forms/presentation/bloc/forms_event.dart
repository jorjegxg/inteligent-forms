part of 'forms_bloc.dart';

abstract class FormsEvent extends Equatable {
  const FormsEvent();

  @override
  List<Object> get props => [];
}

class FormsLoadStartedEvent extends FormsEvent {
  @override
  List<Object> get props => [];
}

class FormsDeleteEvent extends FormsEvent {
  final FormEntity formEntity;

  const FormsDeleteEvent({
    required this.formEntity,
  });

  @override
  List<Object> get props => [formEntity];
}
