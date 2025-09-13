import 'dart:developer';

import '../../domain/entities/field.dart';

class FieldModel extends Field {
  FieldModel({
    required super.placeholderKeyWord,
    required super.mandatory,
    required super.fieldType,
    required super.docKeys,
    required this.formId,
    this.id,
    required super.label,
    super.options,
  });
  String? id;
  String formId;

  factory FieldModel.fromMap(Map<String, dynamic> map) {
    log(map['docKeys'].toString());
    return FieldModel(
      placeholderKeyWord: map['placeholderKeyWord'],
      mandatory: map['mandatory'],
      fieldType: map['fieldType'],
      docKeys: List<String>.from(map['docKeys']),
      formId: map['formId'],
      id: map['id'],
      label: map['label'],
      options: List<String>.from(map['options'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'placeholderKeyWord': placeholderKeyWord,
      'mandatory': mandatory,
      'fieldType': fieldType,
      'docKeys': docKeys,
      'formId': formId,
      'id': id,
      'label': label,
      'options': options,
    };
  }
}
