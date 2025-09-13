import 'package:dartz/dartz.dart';
import 'package:inteligent_forms/core/constants/string_constants.dart';
import 'package:inteligent_forms/core/errors/failures.dart';
import 'package:inteligent_forms/core/utils/logger.dart';

import '../../../../core/utils/lists.dart';

class CreateFieldValidators {
  static Either<Failure, String> addChipValidate(
      String value, List<String> chips) {
    if (value.isEmpty) {
      Logger.info(
        'TextFieldWithChipsValidator',
        'TextFieldWithChipsValidator.validate: value is empty',
      );
      return Left(
        EmptyFieldFailure(
          failureMessage: AppStringFailuresMessages.emptyField,
        ),
      );
    } else if (chips.contains(value)) {
      Logger.info(
        'TextFieldWithChipsValidator',
        'TextFieldWithChipsValidator.validate: value already exists',
      );
      return Left(
        InvalidFieldFailure(
          failureMessage: AppStringFailuresMessages.fieldAlreadyExists,
        ),
      );
    } else {
      Logger.info(
        'TextFieldWithChipsValidator',
        'Has passed validation',
      );

      return const Right(AppStringConstants.valueAdded);
    }
  }

  static Either<Failure, String> createFieldValidate({
    required String label,
    required String placeholderkeyWord,
    required List<String> allPlaceholderkeyWords,
    required String fieldType,
    required List<String> options,
    required List<String> documentKeywords,
  }) {
    if (label.isEmpty) {
      return Left(
        EmptyFieldFailure(
          failureMessage: AppStringFailuresMessages.labelEmptyField,
        ),
      );
    } else if (placeholderkeyWord.isEmpty) {
      return Left(
        EmptyFieldFailure(
          failureMessage:
              AppStringFailuresMessages.placeholderKeywordEmptyField,
        ),
      );
    } else if (fieldType == FieldTypeConstants.singleChoice ||
        fieldType == FieldTypeConstants.multipleChoice) {
      if (options.isEmpty) {
        return Left(
          EmptyFieldFailure(
            failureMessage: AppStringFailuresMessages.optionsEmptyField,
          ),
        );
      } else if (documentKeywords.isEmpty) {
        return Left(
          EmptyFieldFailure(
            failureMessage:
                AppStringFailuresMessages.documentKeywordsEmptyField,
          ),
        );
      }
    } else if (documentKeywords.isEmpty) {
      return Left(
        EmptyFieldFailure(
          failureMessage: AppStringFailuresMessages.documentKeywordsEmptyField,
        ),
      );
    } else if (allPlaceholderkeyWords.contains(placeholderkeyWord)) {
      return Left(
        InvalidFieldFailure(
          failureMessage: AppStringFailuresMessages.chooseAnotherKeyword,
        ),
      );
    }
    return const Right(AppStringConstants.fieldCreated);
  }

  static Either<Failure, String> createVormValidate({
    required String formName,
    required int dataRetentionPeriod,
    required int numberOfFields,
    required int numberOfSections,
  }) {
    if (formName.isEmpty) {
      return Left(
        EmptyFieldFailure(
          failureMessage: AppStringFailuresMessages.formNameEmptyField,
        ),
      );
    } else if (dataRetentionPeriod < 1 || dataRetentionPeriod > 60) {
      return Left(
        EmptyFieldFailure(
          failureMessage:
              AppStringFailuresMessages.choseADataRetentionPeriodBetween1_60,
        ),
      );
    } else if (numberOfFields == 0) {
      return Left(
        EmptyFieldFailure(
          failureMessage: AppStringFailuresMessages.numberOfFieldsEmpty,
        ),
      );
    } else if (numberOfSections == 0) {
      return Left(
        EmptyFieldFailure(
          failureMessage: AppStringFailuresMessages.numberOfSectionsEmpty,
        ),
      );
    }
    return const Right(AppStringConstants.fieldAdded);
  }
}
