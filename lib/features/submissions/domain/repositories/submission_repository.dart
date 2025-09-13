import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/Submission.dart';

abstract class SubmissionRepository {
  Future<Either<Failure, void>> submitSubmission(Submission submission);
  
  Future<Either<Failure, List<Submission>>> getSubmissions(String formId);

  Future<Either<Failure, void>> updateSubmission(Submission submission);

  Future<Either<Failure, void>> deleteSubmission(String id);

}
