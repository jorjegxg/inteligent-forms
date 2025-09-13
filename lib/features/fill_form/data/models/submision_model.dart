import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inteligent_forms/core/constants/firestore_constants.dart';
import 'package:inteligent_forms/features/submissions/domain/entities/submission.dart';

class SubmisionModel extends Submission {
  final String formId;

  SubmisionModel({
    required super.id,
    required this.formId,
    required super.dateWhenSubmitted,
    required super.dateWhenToBeDeleted,
    required super.content,
    required super.listOfFields,
  });

  Map<String, dynamic> toJson() {
    return {
      AppFirestoreSubmittedFormsFields.id: id,
      AppFirestoreSubmittedFormsFields.formId: formId,
      AppFirestoreSubmittedFormsFields.content: content,
      AppFirestoreSubmittedFormsFields.dateWhenSubmited: dateWhenSubmitted,
      AppFirestoreSubmittedFormsFields.dateToBeDeleted: dateWhenToBeDeleted,
      AppFirestoreSubmittedFormsFields.firstFields: listOfFields,
    };
  }

  factory SubmisionModel.fromJson(Map<String, dynamic> map) {
    return SubmisionModel(
      formId: map[AppFirestoreSubmittedFormsFields.formId],
      content: map[AppFirestoreSubmittedFormsFields.content],
      dateWhenSubmitted:
          (map[AppFirestoreSubmittedFormsFields.dateWhenSubmited] as Timestamp)
              .toDate(),
      dateWhenToBeDeleted:
          (map[AppFirestoreSubmittedFormsFields.dateToBeDeleted] as Timestamp)
              .toDate(),
      listOfFields:
          List<String>.from(map[AppFirestoreSubmittedFormsFields.firstFields]),
      id: map[AppFirestoreSubmittedFormsFields.id],
    );
  }
}
