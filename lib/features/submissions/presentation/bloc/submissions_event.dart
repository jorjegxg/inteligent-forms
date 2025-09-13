import 'package:equatable/equatable.dart';

import '../../domain/entities/Submission.dart';

abstract class SubmissionsEvent extends Equatable {
  const SubmissionsEvent();

  @override
  List<Object> get props => [];
}

class SubmissionsRequested extends SubmissionsEvent {
  final String formId;
  const SubmissionsRequested({required this.formId});

  @override
  List<Object> get props => [formId];
}

class SubmissionsUpdateList extends SubmissionsEvent {
  final DateTime dateSelected;
  final String text;
  final List<Submission> submissions;

  const SubmissionsUpdateList(
      {required this.submissions,
      required this.dateSelected,
      required this.text});

  @override
  List<Object> get props => [dateSelected];
}

class SubmissionDelete extends SubmissionsEvent {
  final String submissionId;
  final String formId;
  const SubmissionDelete({required this.submissionId, required this.formId});

  @override
  List<Object> get props => [submissionId, formId];
}
