import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inteligent_forms/core/errors/failures.dart';
import 'package:inteligent_forms/features/fill_form/domain/entities/section_with_field.dart';

import '../../../../core/utils/date_time_functions.dart';
import '../../../../core/utils/lists.dart';
import '../repositories/fill_form_repository.dart';

class GetFormUsecase {
  final FillFormRepository repository;

  GetFormUsecase(this.repository);

  Future<Either<Failure, List<SectionWithField>>> getSectionsWithFields(
      String formId) async {
    return await repository.getSectionWithField(formId);
  }

  Future<Either<Failure, void>> submitFormSubmission(
    String formId,
    String content,
    DateTime dateWhenSubmited,
    DateTime dateToBeDeleted,
    List<String> listOfFields,
  ) async {
    return await repository.submitFormSubmission(
      formId,
      content,
      dateWhenSubmited,
      dateToBeDeleted,
      listOfFields,
    );
  }

  Future<Either<Failure, Map<String, dynamic>>> uploadImageToFirebaseAndFilter({
    required ImageSource imageSource,
    required SectionWithField section,
  }) async {
    try {
      final Map<String, dynamic> filteredResult = {};

      final file = await ImagePicker().pickImage(
        source: imageSource,
      );

      if (file != null) {
        File imageFile = File(file.path);

        (await repository.uploadImageToFirebase(
          file: imageFile,
        ))
            .fold((l) => l, (r) {
          if (r.containsKey('analyzeResult')) {
            if (r['analyzeResult'].containsKey('keyValuePairs')) {
              for (final field in section.fields) {
                for (final documentKeword in field.docKeys) {
                  //
                  //
                  //
                  for (final pair in r['analyzeResult']['keyValuePairs']) {
                    if (pair.containsKey('key') && pair.containsKey('value')) {
                      if (pair['key'].containsKey('content') &&
                          pair['value'].containsKey('content')) {
                        //
                        //
                        //de aici verifici daca documentKeword e bun , verifici field type-ul ,
                        //si daca e bun, adaugi in filteredResult

                        //aici cu DateTimeFunctions().makeListFromString fac un
                        //split pe / si verific daca documentKeword e in lista
                        for (final apiDocKey in DateTimeFunctions()
                            .makeListFromString(pair['key']['content'], '/')) {
                          if (apiDocKey == documentKeword) {
                            log('$apiDocKey == $documentKeword');

                            //aici verifici daca field.type e bun
                            if (field.fieldType == FieldTypeConstants.date) {
                              //aici faci ceva cu data
                              filteredResult[field.placeholderKeyWord] =
                                  DateTimeFunctions().parseDateFromApiString(
                                pair['value']['content'],
                              );
                            } else if (field.fieldType !=
                                    FieldTypeConstants.singleChoice &&
                                field.fieldType !=
                                    FieldTypeConstants.multipleChoice) {
                              //aici faci ceva cu text
                              filteredResult[field.placeholderKeyWord] =
                                  pair['value']['content'];
                            }
                            break;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        });
//978X0J9PWEYHUkvxRWSl

        log('filteredResult: $filteredResult');
        return Right(filteredResult);
      }

      return Right(filteredResult);
    } on Exception catch (e) {
      return Left(
        MediumFailure(
          failureMessage: e.toString(),
        ),
      );
    }
  }
}
