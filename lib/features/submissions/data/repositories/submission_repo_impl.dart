import 'package:dartz/dartz.dart';
import 'package:inteligent_forms/core/errors/exceptions.dart';
import 'package:inteligent_forms/core/errors/failures.dart';
import 'package:inteligent_forms/features/fill_form/data/models/submision_model.dart';
import 'package:inteligent_forms/features/submissions/domain/entities/Submission.dart';
import 'package:inteligent_forms/features/submissions/domain/repositories/submission_repository.dart';

import '../../../../core/constants/string_constants.dart';
import '../../../../core/utils/logger.dart';
import '../datasources/submission_api.dart';

class SubmissionRepoImpl implements SubmissionRepository {
  final SubmissionApi submissionApi;

  SubmissionRepoImpl({required this.submissionApi});

  @override
  Future<Either<Failure, void>> deleteSubmission(String id) async {
    try {
      await submissionApi.deleteSubmission(id);
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
  Future<Either<Failure, List<Submission>>> getSubmissions(
      String formId) async {
    try {
      final submissions = await submissionApi.getSubmissions(formId);
      final List<Submission> submissionsList = submissions
          .map(
            (SubmisionModel submission) => Submission(
              id: submission.id,
              content: submission.content,
              dateWhenSubmitted: submission.dateWhenSubmitted,
              dateWhenToBeDeleted: submission.dateWhenToBeDeleted,
              listOfFields: submission.listOfFields,
            ),
          )
          .toList();
      return Right(submissionsList);
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
  Future<Either<Failure, void>> submitSubmission(Submission submission) async {
    try {
      await submissionApi.submitSubmission(submission as SubmisionModel);
      return const Right(null);
    } on MediumException catch (e) {
      return Left(
        MediumFailure(
          failureMessage: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> updateSubmission(Submission submission) async {
    try {
      await submissionApi.updateSubmission(submission as SubmisionModel);
      return const Right(null);
    } on MediumException catch (e) {
      return Left(
        MediumFailure(
          failureMessage: e.message,
        ),
      );
    }
  }
}
