import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/constants/firestore_constants.dart';
import '../../../forms/domain/entities/form_entity.dart';

class FormModel extends FormEntity {
  int dataRetentionPeriod;
  String userId;

  FormModel({
    required super.id,
    required super.title,
    required this.dataRetentionPeriod,
    required this.userId,
    required super.dateAdded,
  });

  factory FormModel.fromMap(Map<String, dynamic> map) {
    return FormModel(
      id: map[AppFirestoreFormsFields.id],
      title: map[AppFirestoreFormsFields.title],
      dataRetentionPeriod: map[AppFirestoreFormsFields.dataRetentionPeriod],
      userId: map[AppFirestoreFormsFields.userId],
      dateAdded: (map[AppFirestoreFormsFields.dateAdded] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      AppFirestoreFormsFields.id: id,
      AppFirestoreFormsFields.title: title,
      AppFirestoreFormsFields.dataRetentionPeriod: dataRetentionPeriod,
      AppFirestoreFormsFields.dateAdded: DateTime.now(),
      AppFirestoreFormsFields.userId: userId,
    };
  }
}
