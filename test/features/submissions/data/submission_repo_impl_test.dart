import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inteligent_forms/core/constants/string_constants.dart';
import 'package:inteligent_forms/core/errors/failures.dart';
import 'package:inteligent_forms/features/submissions/data/datasources/submission_api.dart';
import 'package:inteligent_forms/features/submissions/data/repositories/submission_repo_impl.dart';
import 'package:mocktail/mocktail.dart';

class MockSubmissionApi extends Mock implements SubmissionApi {}

void main() {
  late MockSubmissionApi mockSubmissionApi;
  late SubmissionRepoImpl submissionRepoImpl;

  setUp(() {
    mockSubmissionApi = MockSubmissionApi();
    submissionRepoImpl = SubmissionRepoImpl(submissionApi: mockSubmissionApi);
  });
  MediumFailure mediumFailure = MediumFailure(
      failureMessage: AppStringFailuresMessages.unexpectedFailure);

  group("delete", () {
    test("Should call the delete function from SubmissionApi and return null",
        () async {
      // arrange
      when(() => mockSubmissionApi.deleteSubmission(any())).thenAnswer(
        (_) async => Void,
      );
      // act
      final result = await submissionRepoImpl.deleteSubmission("id");

      //assert
      expect(result, const Right(null));
      verify(() => mockSubmissionApi.deleteSubmission("id")).called(1);
      verifyNoMoreInteractions(mockSubmissionApi);
    });

    //test(
    //   "Should call the delete function from SubmissionApi and throw exception",
    //   () async {
    // // arrange
    // when(() => mockSubmissionApi.deleteSubmission(any()))
    //     .thenAnswer((invocation) async => throwsA(Exception));

    // // act
    // final result = await submissionRepoImpl.deleteSubmission("id");

    // //assert
    // expect(mockSubmissionApi.deleteSubmission("id"), throwsA(Exception));
    // expect(result, Left(mediumFailure));
    // verify(() => mockSubmissionApi.deleteSubmission("id")).called(1);
    // verifyNoMoreInteractions(mockSubmissionApi);
    //});
  });
}
