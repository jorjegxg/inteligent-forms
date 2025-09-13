import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/form_entity.dart';

abstract class FormRepository {
  Future<Either<Failure, List<FormEntity>>> getForms();
  Future<Either<Failure, void>> deleteForm(
    FormEntity formEntity,
  );
}
