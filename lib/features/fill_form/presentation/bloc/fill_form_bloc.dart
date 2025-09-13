import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/constants/string_constants.dart';
import '../../domain/usecases/fill_form_usecase.dart';
import 'fill_form_state.dart';

part 'fill_form_event.dart';

class FillFormBloc extends Bloc<FillFormEvent, FillFormState> {
  GetFormUsecase getFormUsecase;

  FillFormBloc({
    required this.getFormUsecase,
  }) : super(FillFormInitial()) {
    on<CheckIfFormExistsEvent>(_onCheckIfFormExistsEvent);
    on<AddSumbisionEvent>(_onAddSumbisionEvent);
  }

  Future<void> _onCheckIfFormExistsEvent(
    CheckIfFormExistsEvent event,
    Emitter<FillFormState> emit,
  ) async {
    emit(const UrlExistsLoadingState());

    (await getFormUsecase.getSectionsWithFields(event.url)).fold(
      (failure) => emit(
        const UrlExistsErrorState(
          AppStringConstants.somethingWentWrong,
        ),
      ),
      (sections) {
        if (sections.isEmpty) {
          emit(
            const UrlExistsErrorState(
              AppStringConstants.noSectionsFound,
            ),
          );
        } else {
          emit(
            UrlExistsLoadedState(
              sections,
              event.url,
            ),
          );
        }
      },
    );
  }

  Future<void> _onAddSumbisionEvent(
    AddSumbisionEvent event,
    Emitter<FillFormState> emit,
  ) async {
    emit(const AddSubmissionLoadingState());

    (await getFormUsecase.submitFormSubmission(
      event.formId,
      event.content,
      event.dateWhenSubmited,
      event.dateToBeDeleted,
      event.listOfFields,
    ))
        .fold(
      (failure) => emit(
        const AddSubmissionErrorState(
          AppStringConstants.somethingWentWrong,
        ),
      ),
      (success) {
        emit(
          const AddSubmissionLoadedState(
            AppStringConstants.submissionAdded,
          ),
        );
      },
    );
  }
}
