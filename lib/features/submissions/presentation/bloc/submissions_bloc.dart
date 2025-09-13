import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:inteligent_forms/features/submissions/domain/usecases/submission_usecase.dart';
import 'package:inteligent_forms/features/submissions/presentation/bloc/submissions_event.dart';
import 'package:inteligent_forms/features/submissions/presentation/bloc/submissions_state.dart';

import '../../domain/entities/Submission.dart';

class SubmissionsBloc extends Bloc<SubmissionsEvent, SubmissionsState> {
  final SubmissionUsecase submissionUsecase;

  SubmissionsBloc({required this.submissionUsecase})
      : super(
          const SubmissionsInitial(),
        ) {
    on<SubmissionsRequested>(_onSubmissionsRequested);

    on<SubmissionsUpdateList>(_onSubmissionsChangedDate);
    on<SubmissionDelete>(_onSubmissionDelete);
  }

  Future<void> _onSubmissionsRequested(
    SubmissionsRequested event,
    Emitter<SubmissionsState> emit,
  ) async {
    emit(const SubmissionsLoading());

    (await submissionUsecase.getSubmissions(event.formId)).fold(
      (failure) => emit(SubmissionsError(
        message: failure.failureMessage,
      )),
      (submissions) => emit(
        SubmissionsLoaded(
          submissions: submissions,
          filteredSubmissions: submissions,
        ),
      ),
    );
  }

  Future<void> _onSubmissionsChangedDate(
    SubmissionsUpdateList event,
    Emitter<SubmissionsState> emit,
  ) async {
    emit(const SubmissionsLoading());
    final filteredSub = filterList(
      event.submissions,
      event.dateSelected,
      event.text,
    );
    log(event.text);
    emit(SubmissionsLoaded(
      submissions: event.submissions,
      filteredSubmissions: filteredSub,
    ));
  }

  List<Submission> filterList(
      List<Submission> list, DateTime? dateSelected, String? text) {
    List<Submission> filteredList = [];
    if (dateSelected == null || text == null) {
      return list;
    }
    for (final element in list) {
      if (element.dateWhenSubmitted.day == dateSelected.day &&
          element.dateWhenSubmitted.month == dateSelected.month &&
          element.dateWhenSubmitted.year == dateSelected.year) {
        if (element.listOfFields.any(
            (element) => element.toLowerCase().contains(text.toLowerCase()))) {
          filteredList.add(element);
          log(element.toString());
        }
      }
    }

    return filteredList;
  }

  Future<void> _onSubmissionDelete(
    SubmissionDelete event,
    Emitter<SubmissionsState> emit,
  ) async {
    emit(const SubmissionsLoading());
    (await submissionUsecase.deleteSubmission(
      event.submissionId,
    ))
        .fold(
      (failure) => emit(SubmissionsError(
        message: failure.failureMessage,
      )),
      (submissions) => add(
        SubmissionsRequested(formId: event.formId),
      ),
    );
  }
}
