import 'package:equatable/equatable.dart';

import '../../domain/entities/Submission.dart';

abstract class SubmissionsState extends Equatable {
  const SubmissionsState();

  @override
  List<Object> get props => [];
}

class SubmissionsInitial extends SubmissionsState {
  const SubmissionsInitial();

  @override
  List<Object> get props => [];
}

class SubmissionsLoading extends SubmissionsState {
  const SubmissionsLoading();

  @override
  List<Object> get props => [];
}

class SubmissionsLoaded extends SubmissionsState {
  final List<Submission> submissions;
  final List<Submission> filteredSubmissions;
  const SubmissionsLoaded(
      {required this.submissions, required this.filteredSubmissions});

  @override
  List<Object> get props => [submissions, filteredSubmissions];
}

class SubmissionsError extends SubmissionsState {
  final String message;
  const SubmissionsError({required this.message});

  @override
  List<Object> get props => [message];
}
