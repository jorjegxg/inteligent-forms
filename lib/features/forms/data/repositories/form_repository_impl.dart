import 'package:dartz/dartz.dart';
import 'package:inteligent_forms/core/constants/string_constants.dart';
import 'package:inteligent_forms/core/errors/failures.dart';
import 'package:inteligent_forms/features/forms/domain/entities/form_entity.dart';

import '../../../../core/utils/logger.dart';
import '../../domain/repositories/form_repository.dart';
import '../datasource/form_api.dart';

class FormRepositoryImpl implements FormRepository {
  final FormApi formApi;

  FormRepositoryImpl({required this.formApi});

  @override
  Future<Either<Failure, void>> deleteForm(FormEntity formEntity) async {
    try {
      await formApi.deleteForm(formEntity.id);
      return const Right(null);
    } on Exception catch (e) {
      Logger.error(runtimeType, e.toString());
      return Left(
        MediumFailure(
          failureMessage: AppStringFailuresMessages.unexpectedFailure,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<FormEntity>>> getForms() async {
    try {
      final result = await formApi.getForms();
      return Right(result);
    } on Exception catch (e) {
      Logger.error(runtimeType, e.toString());
      return Left(MediumFailure(
          failureMessage: AppStringFailuresMessages.unexpectedFailure));
    }
  }
}
