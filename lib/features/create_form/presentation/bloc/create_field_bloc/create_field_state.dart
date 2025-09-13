import 'package:equatable/equatable.dart';

import '../../../../../core/utils/lists.dart';

class CreateFieldState extends Equatable {
  final String label;
  final String placeholderKeyWord;

  final bool isMandatory;
  final String fieldType;

  final bool showDocumentKeywords;
  final List<String> documentKeywords;

  final bool showOptions;
  final List<String> options;

  const CreateFieldState({
    required this.isMandatory,
    required this.fieldType,
    required this.documentKeywords,
    required this.showDocumentKeywords,
    required this.showOptions,
    required this.options,
    required this.label,
    required this.placeholderKeyWord,
  });

  factory CreateFieldState.initial() => const CreateFieldState(
        isMandatory: false,
        fieldType: FieldTypeConstants.text,
        documentKeywords: [],
        showDocumentKeywords: true,
        showOptions: true,
        options: [],
        label: '',
        placeholderKeyWord: '',
      );

  @override
  List<Object?> get props => [
        isMandatory,
        fieldType,
        documentKeywords,
        showDocumentKeywords,
        showOptions,
        options,
        label,
        placeholderKeyWord,
      ];

  CreateFieldState copyWith({
    bool? isEditMode,
    bool? isMandatory,
    String? fieldType,
    List<String>? documentKeywords,
    bool? showDocumentKeywords,
    bool? showTypes,
    List<String>? options,
    String? label,
    String? placeholderKeyWord,
  }) {
    return CreateFieldState(
      isMandatory: isMandatory ?? this.isMandatory,
      fieldType: fieldType ?? this.fieldType,
      documentKeywords: documentKeywords ?? this.documentKeywords,
      showDocumentKeywords: showDocumentKeywords ?? this.showDocumentKeywords,
      showOptions: showTypes ?? showOptions,
      options: options ?? this.options,
      label: label ?? this.label,
      placeholderKeyWord: placeholderKeyWord ?? this.placeholderKeyWord,
    );
  }

  @override
  String toString() {
    return '\n\nCreateFieldState :'
        '\nisMandatory: $isMandatory,'
        '\nfieldType: $fieldType,'
        '\ndocumentKeywords: $documentKeywords,'
        '\nshowDocumentKeywords: $showDocumentKeywords,'
        '\nshowTypes: $showOptions'
        '\noptions: $options'
        '\n label: $label'
        '\n placeholderKeyWord: $placeholderKeyWord';
  }
}
