import 'package:equatable/equatable.dart';

import '../../domain/entities/section_with_field.dart';

abstract class FillFormState extends Equatable {
  const FillFormState();

  @override
  List<Object> get props => [];
}

class FillFormInitial extends FillFormState {}

class UrlExistsLoadingState extends FillFormState {
  const UrlExistsLoadingState();

  @override
  List<Object> get props => [];
}

class UrlExistsLoadedState extends FillFormState {
  final List<SectionWithField> sections;
  final String formId;

  const UrlExistsLoadedState(
    this.sections,
    this.formId,
  );

  @override
  List<Object> get props => [sections];
}

class UrlExistsErrorState extends FillFormState {
  final String message;

  const UrlExistsErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class FillFormLoadingState extends FillFormState {}

class FillFormSuccessState extends FillFormState {
  final List<SectionWithField> listOfSections;

  const FillFormSuccessState(this.listOfSections);

  @override
  List<Object> get props => [listOfSections];
}

class FillFormErrorState extends FillFormState {
  final String message;

  const FillFormErrorState(this.message);

  
}
