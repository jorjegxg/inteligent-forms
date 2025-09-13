import 'package:bloc/bloc.dart';

import '../../../domain/usecases/create_form.dart';
import 'create_form_event.dart';
import 'create_form_state.dart';

class CreateFormBloc extends Bloc<CreateFormEvent, CreateFormState> {
  final CreateForm createFormUseCase;

  CreateFormBloc({
    required this.createFormUseCase,
  }) : super(const CreateFormState()) {
    on<ChangeTitle>(_onChangeTitle);
    on<ChangeDataRetentionPeriod>(_onChangeDataRetentionPeriod);
    on<AddSection>(_onAddSection);
    on<RemoveSection>(_onRemoveSection);
    on<AddField>(_onAddField);
    on<RemoveFieldEvent>(_onRemoveField);
    on<DeleteSectionEvent>(_onDeleteSectionEvent);
    on<CreateFormSubmitted>(_onCreateFormSubmitted);
    on<ResetCreateForm>(_onResetForm);
  }

  void _onChangeTitle(
    ChangeTitle event,
    Emitter<CreateFormState> emit,
  ) {
    emit(
      state.copyWith(
        title: event.title,
      ),
    );
  }

  void _onChangeDataRetentionPeriod(
    ChangeDataRetentionPeriod event,
    Emitter<CreateFormState> emit,
  ) {
    emit(
      state.copyWith(
        dataRetentionPeriod: event.dataRetentionPeriod,
      ),
    );
  }

  void _onAddSection(
    AddSection event,
    Emitter<CreateFormState> emit,
  ) {
    emit(
      state.copyWith(
        sections: [...state.sections, event.section],
      ),
    );
  }

  void _onRemoveSection(
    RemoveSection event,
    Emitter<CreateFormState> emit,
  ) {
    emit(
      state.copyWith(
        sections: state.sections
            .where((section) => section.sectionNumber != event.sectionNumber)
            .toList(),
      ),
    );
  }

  void _onAddField(
    AddField event,
    Emitter<CreateFormState> emit,
  ) {
    emit(
      state.copyWith(
        fields: [...state.fields, event.field],
      ),
    );
  }

  void _onRemoveField(
    RemoveFieldEvent event,
    Emitter<CreateFormState> emit,
  ) {
    emit(
      state.copyWith(
        fields: state.fields
            .where(
                (field) => field.placeholderKeyWord != event.placeholderKeyWord)
            .toList(),
      ),
    );
  }

  void _onCreateFormSubmitted(
    CreateFormSubmitted event,
    Emitter<CreateFormState> emit,
  ) async {
    if (state.status == CreateFormStatus.loading) return;

    emit(state.copyWith(status: CreateFormStatus.loading));

    (await createFormUseCase.call(
      title: state.title,
      dataRetentionPeriod: state.dataRetentionPeriod,
      sections: state.sections,
      fields: state.fields,
    ))
        .fold(
      (failure) => emit(
        state.copyWith(
          error: failure.failureMessage,
          status: CreateFormStatus.error,
        ),
      ),
      (r) => emit(
        state.copyWith(status: CreateFormStatus.success),
      ),
    );
  }

  void _onDeleteSectionEvent(
    DeleteSectionEvent event,
    Emitter<CreateFormState> emit,
  ) {
    emit(
      state.copyWith(
        sections: state.sections
            .where((section) => section.sectionNumber != event.sectionNumber)
            .toList(),
      ),
    );
  }

  void _onResetForm(
    ResetCreateForm event,
    Emitter<CreateFormState> emit,
  ) {
    emit(const CreateFormState());
  }
}
