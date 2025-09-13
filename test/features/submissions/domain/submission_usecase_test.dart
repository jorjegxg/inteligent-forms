import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inteligent_forms/core/errors/failures.dart';
import 'package:inteligent_forms/features/submissions/domain/entities/Submission.dart';
import 'package:inteligent_forms/features/submissions/domain/repositories/submission_repository.dart';
import 'package:inteligent_forms/features/submissions/domain/usecases/submission_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockSubmissionRepository extends Mock implements SubmissionRepository {}

void main() {
  late SubmissionUsecase usecase;
  late MockSubmissionRepository mockSubmissionRepository;

  setUp(() {
    mockSubmissionRepository = MockSubmissionRepository();
    usecase = SubmissionUsecase(mockSubmissionRepository);
  });
  final failure = MediumFailure(failureMessage: 'test');
  const tFormId = 'test';
  const tSubmissionId = 'test';
  const content = 'test content';
  DateTime dateWhenSubmitted = DateTime(2021, 1, 1);
  DateTime dateWhenToBeDeleted = DateTime(2021, 1, 2);
  Submission submission = Submission(
    content: content,
    dateWhenSubmitted: dateWhenSubmitted,
    dateWhenToBeDeleted: dateWhenToBeDeleted,
    listOfFields: [],
    id: tSubmissionId,
  );
  List<Submission> submissions = [submission];
  group("delete", () {
    test("test delete functionality", () async {
      when(() => mockSubmissionRepository.deleteSubmission(tSubmissionId))
          .thenAnswer((_) async => const Right(null));

      final result = await usecase.deleteSubmission(tSubmissionId);

      expect(result, const Right(null));

      verify(() => mockSubmissionRepository.deleteSubmission(tSubmissionId));
    });

    test("test delete functionality exception", () async {
      when(() => mockSubmissionRepository.deleteSubmission(tSubmissionId))
          .thenAnswer((_) async => Left(failure));

      final result = await usecase.deleteSubmission(tSubmissionId);

      expect(result, Left(failure));

      verify(() => mockSubmissionRepository.deleteSubmission(tSubmissionId));
    });
  });

  group("submit", () {
    test("test submit functionality", () async {
      when(() => mockSubmissionRepository.submitSubmission(submission))
          .thenAnswer((_) async => const Right(null));

      final result = await usecase.submitSubmission(submission);

      expect(result, const Right(null));

      verify(() => mockSubmissionRepository.submitSubmission(submission));
      verifyNoMoreInteractions(mockSubmissionRepository);
    });

    test("test submit functionality exception", () async {
      when(() => mockSubmissionRepository.submitSubmission(submission))
          .thenAnswer((_) async => Left(failure));

      final result = await usecase.submitSubmission(submission);

      expect(result, Left(failure));

      verify(() => mockSubmissionRepository.submitSubmission(submission));
      verifyNoMoreInteractions(mockSubmissionRepository);
    });
  });
  group("update", () {
    test("test update functionality", () async {
      when(() => mockSubmissionRepository.updateSubmission(submission))
          .thenAnswer((_) async => const Right(null));

      final result = await usecase.updateSubmission(submission);

      expect(result, const Right(null));

      verify(() => mockSubmissionRepository.updateSubmission(submission));
      verifyNoMoreInteractions(mockSubmissionRepository);
    });

    test("test update functionality exception", () async {
      when(() => mockSubmissionRepository.updateSubmission(submission))
          .thenAnswer((_) async => Left(failure));

      final result = await usecase.updateSubmission(submission);

      expect(result, Left(failure));

      verify(() => mockSubmissionRepository.updateSubmission(submission));
      verifyNoMoreInteractions(mockSubmissionRepository);
    });
  });

  group("getSubmissions ", () {
    test("test getSubmissions functionality", () async {
      when(() => mockSubmissionRepository.getSubmissions(tFormId))
          .thenAnswer((_) async => Right(submissions));

      final result = await usecase.getSubmissions(tFormId);

      expect(result, Right(submissions));

      verify(() => mockSubmissionRepository.getSubmissions(tFormId));
      verifyNoMoreInteractions(mockSubmissionRepository);
    });

    test("test getSubmissions functionality exception", () async {
      when(() => mockSubmissionRepository.getSubmissions(tFormId))
          .thenAnswer((_) async => Left(failure));

      final result = await usecase.getSubmissions(tFormId);

      expect(result, Left(failure));

      verify(() => mockSubmissionRepository.getSubmissions(tFormId));
      verifyNoMoreInteractions(mockSubmissionRepository);
    });
  });
}
