import 'package:dartz/dartz.dart';
import 'package:inteligent_forms/features/create_form/domain/entities/field.dart';

import '../../../../core/errors/failures.dart';
import '../entities/section.dart';

abstract class CreateFormRepository {
  Future<Either<Failure, void>> createForm(
    String title,
    int dataRetentionPeriod,
    List<Section> sections,
    List<Field> fields,
  );
}
