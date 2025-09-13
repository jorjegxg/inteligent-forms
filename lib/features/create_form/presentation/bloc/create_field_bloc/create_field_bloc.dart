import 'package:bloc/bloc.dart';
import 'package:inteligent_forms/features/create_form/presentation/bloc/create_field_bloc/create_field_event.dart';

import 'create_field_state.dart';

class CreateFieldBloc extends Bloc<CreateFieldEvent, CreateFieldState> {
  CreateFieldBloc() : super(CreateFieldState.initial()) {
    on<CreateFieldIsMandatoryChanged>(_onCreateFieldIsMandatoryChanged);
    on<CreateFieldTypeChanged>(_onCreateFieldFieldTypeChanged);
    on<ShowDocumentKeywordsChanged>(
      _onCreateFieldShowDocumentKeywordsChanged,
    );
    on<DocumentKeywordsChanged>(
      _onCreateFieldDocumentKeywordsChanged,
    );
    on<ShowOptionsChanged>(
      _onCreateFieldShowTypesChanged,
    );

    on<OptionsChanged>(
      _onCreateFieldOptionsChanged,
    );
    on<ResetFields>(_onResetFields);

    on<CreateFieldEdit>(_onCreateFieldEdit);

    on<LabelChanged>(_onLabelChanged);
    on<PlaceholderKeyWordChanged>(_onPlaceholderKeyWordChanged);
  }

  void _onCreateFieldIsMandatoryChanged(
    CreateFieldIsMandatoryChanged event,
    Emitter<CreateFieldState> emit,
  ) {
    emit(state.copyWith(isMandatory: event.isMandatory));
  }

  void _onCreateFieldFieldTypeChanged(
    CreateFieldTypeChanged event,
    Emitter<CreateFieldState> emit,
  ) {
    emit(state.copyWith(fieldType: event.fieldType));
  }

  void _onCreateFieldShowDocumentKeywordsChanged(
    ShowDocumentKeywordsChanged event,
    Emitter<CreateFieldState> emit,
  ) {
    emit(state.copyWith(
      showDocumentKeywords: event.showDocumentKeywords,
    ));
  }

  void _onCreateFieldDocumentKeywordsChanged(
    DocumentKeywordsChanged event,
    Emitter<CreateFieldState> emit,
  ) {
    emit(state.copyWith(
      documentKeywords: event.documentKeywords,
    ));
  }

  void _onCreateFieldShowTypesChanged(
    ShowOptionsChanged event,
    Emitter<CreateFieldState> emit,
  ) {
    emit(state.copyWith(
      showTypes: event.showOptions,
    ));
  }

  void _onCreateFieldOptionsChanged(
    OptionsChanged event,
    Emitter<CreateFieldState> emit,
  ) {
    emit(state.copyWith(
      options: event.options,
    ));
  }

  void _onResetFields(
    ResetFields event,
    Emitter<CreateFieldState> emit,
  ) {
    emit(
      CreateFieldState.initial(),
    );
  }

  void _onCreateFieldEdit(
    CreateFieldEdit event,
    Emitter<CreateFieldState> emit,
  ) {
    emit(
      state.copyWith(
        isEditMode: true,
        isMandatory: event.field.mandatory,
        fieldType: event.field.fieldType,
        documentKeywords: event.field.docKeys,
        options: event.field.options,
        showDocumentKeywords: true,
        showTypes: true,
        label: event.field.label,
        placeholderKeyWord: event.field.placeholderKeyWord,
      ),
    );
  }

  void _onLabelChanged(
    LabelChanged event,
    Emitter<CreateFieldState> emit,
  ) {
    emit(state.copyWith(
      label: event.label,
    ));
  }

  void _onPlaceholderKeyWordChanged(
    PlaceholderKeyWordChanged event,
    Emitter<CreateFieldState> emit,
  ) {
    emit(state.copyWith(
      placeholderKeyWord: event.placeholderKeyWord,
    ));
  }
}
