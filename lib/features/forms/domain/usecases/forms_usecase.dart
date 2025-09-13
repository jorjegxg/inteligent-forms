import 'package:dartz/dartz.dart';
import 'package:inteligent_forms/core/errors/failures.dart';
import 'package:inteligent_forms/features/forms/domain/entities/form_entity.dart';

import '../repositories/form_repository.dart';

class FormsUseCase {
  final FormRepository formRepository;
  FormsUseCase({
    required this.formRepository,
  });
  Future<Either<Failure, List<FormEntity>>> getForms() async {
    return await formRepository.getForms();
  }

  Future<Either<Failure, void>> deleteForm(
    FormEntity formEntity,
  ) async {
    return await formRepository.deleteForm(formEntity);
  }
}
