// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../../../domain/entities/field.dart';
import '../../../domain/entities/section.dart';

enum CreateFormStatus { initial, loading, success, error }

class CreateFormState extends Equatable {
  final CreateFormStatus status;
  final String title;
  final int dataRetentionPeriod;
  final List<Section> sections;
  final List<Field> fields;
  final String error;
  const CreateFormState({
    this.title = '',
    this.dataRetentionPeriod = 0,
    this.sections = const [],
    this.fields = const [],
    this.status = CreateFormStatus.initial,
    this.error = '',
  });

  @override
  List<Object> get props =>
      [title, dataRetentionPeriod, sections, fields, status, error];

  CreateFormState copyWith({
    String? title,
    int? dataRetentionPeriod,
    List<Section>? sections,
    List<Field>? fields,
    CreateFormStatus? status,
    String? error,
  }) {
    return CreateFormState(
      title: title ?? this.title,
      dataRetentionPeriod: dataRetentionPeriod ?? this.dataRetentionPeriod,
      sections: sections ?? this.sections,
      fields: fields ?? this.fields,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  String toString() {
    return '''CreateFormState {
      title: $title,
      dataRetentionPeriod: $dataRetentionPeriod,
      sections: $sections,
      fields: $fields,
      status: $status,
      error: $error,
    }''';
  }
}
