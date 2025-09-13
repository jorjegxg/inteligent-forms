import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:inteligent_forms/core/errors/failures.dart';
import 'package:inteligent_forms/features/fill_form/domain/entities/section_with_field.dart';

abstract class FillFormRepository {
  Future<Either<Failure, List<SectionWithField>>> getSectionWithField(
    String formId,
  );

  Future<Either<Failure, void>> submitFormSubmission(
    String formId,
    String content,
    DateTime dateWhenSubmited,
    DateTime dateToBeDeleted,
    List<String> listOfFields,
  );

  Future<Either<Failure, Map<String, dynamic>>> uploadImageToFirebase({
    required File file,
  });
}
