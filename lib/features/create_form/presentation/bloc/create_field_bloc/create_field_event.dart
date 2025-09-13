import 'package:equatable/equatable.dart';
import 'package:inteligent_forms/features/create_form/domain/entities/field.dart';

abstract class CreateFieldEvent extends Equatable {
  const CreateFieldEvent();

  @override
  List<Object> get props => [];
}

class CreateFieldIsMandatoryChanged extends CreateFieldEvent {
  final bool isMandatory;

  const CreateFieldIsMandatoryChanged({required this.isMandatory});

  @override
  List<Object> get props => [isMandatory];
}

class CreateFieldTypeChanged extends CreateFieldEvent {
  final String fieldType;

  const CreateFieldTypeChanged({required this.fieldType});

  @override
  List<Object> get props => [fieldType];
}

class DocumentKeywordsChanged extends CreateFieldEvent {
  final List<String> documentKeywords;

  const DocumentKeywordsChanged({required this.documentKeywords});

  @override
  List<Object> get props => [documentKeywords];
}

class ShowDocumentKeywordsChanged extends CreateFieldEvent {
  final bool showDocumentKeywords;

  const ShowDocumentKeywordsChanged({
    required this.showDocumentKeywords,
  });

  @override
  List<Object> get props => [showDocumentKeywords];
}

class ShowOptionsChanged extends CreateFieldEvent {
  final bool showOptions;

  const ShowOptionsChanged({required this.showOptions});

  @override
  List<Object> get props => [showOptions];
}

class OptionsChanged extends CreateFieldEvent {
  final List<String> options;

  const OptionsChanged({required this.options});

  @override
  List<Object> get props => [options];
}

class ResetFields extends CreateFieldEvent {
  @override
  List<Object> get props => [];
}

class CreateFieldEdit extends CreateFieldEvent {
  final Field field;

  const CreateFieldEdit({
    required this.field,
  });

  @override
  List<Object> get props => [field];
}

class LabelChanged extends CreateFieldEvent {
  final String label;

  const LabelChanged({required this.label});

  @override
  List<Object> get props => [label];
}

class PlaceholderKeyWordChanged extends CreateFieldEvent {
  final String placeholderKeyWord;

  const PlaceholderKeyWordChanged({required this.placeholderKeyWord});

  @override
  List<Object> get props => [placeholderKeyWord];
}
