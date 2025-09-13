import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:inteligent_forms/features/create_form/data/models/field_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/entities/field.dart';
import '../../domain/entities/section.dart';
import '../models/form_model.dart';
import '../models/section_model.dart';

abstract class CreateFormApi {
  Future<void> createForm(
    String title,
    int dataRetentionPeriod,
    List<Section> sections,
    List<Field> fields,
  );
}

class CreateFormApiImpl implements CreateFormApi {
  final FirebaseFirestore firebase;
  final FirebaseAuth auth = FirebaseAuth.instance;

  CreateFormApiImpl(this.firebase);

  @override
  Future<void> createForm(
    String title,
    int dataRetentionPeriod,
    List<Section> sections,
    List<Field> fields,
  ) async {
    try {
      final CollectionReference forms = firebase.collection('forms');
      final String userId = auth.currentUser!.uid;

      final id = forms.doc().id;
      await forms.doc(id).set(
            FormModel(
              title: title,
              dataRetentionPeriod: dataRetentionPeriod,
              id: id,
              userId: userId,
              dateAdded: DateTime.now(),
            ).toMap(),
          );

      for (final section in sections) {
        await addSection(section, id);
      }
      for (final field in fields) {
        await addField(field, id);
      }
      return await null;
    } on FirebaseException catch (error) {
      throw MediumException(
        runtimeType,
        error.toString(),
      );
    }
  }

  Future<void> addSection(
    Section section,
    String formId,
  ) async {
    final CollectionReference sections = firebase.collection('sections');
    final String id = sections.doc().id;
    final SectionModel sectionModel = SectionModel(
      formId: formId,
      id: id,
      content: section.content,
      scanType: section.scanType,
      sectionNumber: section.sectionNumber,
    );
    await sections.doc(id).set(sectionModel.toMap());

    return await null;
  }

  Future<void> addField(
    Field field,
    String formId,
  ) async {
    final CollectionReference fields = firebase.collection('fields');
    final String id = fields.doc().id;
    final FieldModel fieldModel = FieldModel(
      id: id,
      formId: formId,
      docKeys: field.docKeys,
      fieldType: field.fieldType,
      label: field.label,
      placeholderKeyWord: field.placeholderKeyWord,
      mandatory: field.mandatory,
      options: field.options,
    );
    await fields.doc(id).set(fieldModel.toMap());

    return await null;
  }
}
