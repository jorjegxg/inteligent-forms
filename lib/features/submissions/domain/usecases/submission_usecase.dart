import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/Submission.dart';
import '../repositories/submission_repository.dart';

class SubmissionUsecase {
  final SubmissionRepository _submissionRepository;

  SubmissionUsecase(this._submissionRepository);

  Future<Either<Failure, List<Submission>>> getSubmissions(
    String formId,
  ) async {
    return await _submissionRepository.getSubmissions(formId);
  }

  Future<Either<Failure, void>> submitSubmission(Submission submission) async {
    return await _submissionRepository.submitSubmission(submission);
  }

  Future<Either<Failure, void>> updateSubmission(Submission submission) async {
    return await _submissionRepository.updateSubmission(submission);
  }

  Future<Either<Failure, void>> deleteSubmission(String id) async {
    return await _submissionRepository.deleteSubmission(id);
  }
}
