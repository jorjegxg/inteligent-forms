part of 'fill_form_bloc.dart';

abstract class FillFormEvent extends Equatable {
  const FillFormEvent();

  @override
  List<Object> get props => [];
}

class DownloadFormEvent extends FillFormEvent {
  final String url;

  const DownloadFormEvent(this.url);

  @override
  List<Object> get props => [url];
}

class CheckIfFormExistsEvent extends FillFormEvent {
  final String url;

  const CheckIfFormExistsEvent(this.url);

  @override
  List<Object> get props => [url];
}

class AddSumbisionEvent extends FillFormEvent {
  final String formId;
  final String content;
  final DateTime dateWhenSubmited;
  final DateTime dateToBeDeleted;
  final List<String> listOfFields;

  const AddSumbisionEvent({
    required this.formId,
    required this.content,
    required this.dateWhenSubmited,
    required this.dateToBeDeleted,
    required this.listOfFields,
  });

  @override
  List<Object> get props => [
        formId,
        content,
        dateWhenSubmited,
        dateToBeDeleted,
        listOfFields,
      ];
}

class AddSubmissionLoadingState extends FillFormState {
  const AddSubmissionLoadingState();

  @override
  List<Object> get props => [];
}

class AddSubmissionErrorState extends FillFormState {
  final String message;

  const AddSubmissionErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class AddSubmissionLoadedState extends FillFormState {
  final String message;

  const AddSubmissionLoadedState(this.message);

  @override
  List<Object> get props => [message];
}
