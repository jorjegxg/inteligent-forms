import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inteligent_forms/features/fill_form/data/repositories/fill_form_repository_impl.dart';

import '../../../../data/datasources/fill_form_api.dart';
import '../../../../domain/usecases/fill_form_usecase.dart';
import '../../fill_form_bloc.dart';
import 'fill_content_event.dart';
import 'fill_content_state.dart';

class FillContentBloc extends Bloc<FillContentEvent, FillContentState> {
  final FillFormBloc fillFormBloc;
  late StreamSubscription fillFormBlocSubscription;
  GetFormUsecase fillFormUsecase = GetFormUsecase(
    FillFormRepositoryImpl(
      datasource: FillFormApi(
        FirebaseFirestore.instance,
      ),
    ),
  );

  FillContentBloc({
    required this.fillFormBloc,
  }) : super(
          const FillContentState(parametersMap: {}, sectionsContent: ""),
        ) {
    fillFormBlocSubscription = fillFormBloc.stream.listen((state) {
      if (state is AddSubmissionLoadedState) {
        add(ResetFillContent());
      }
    });

    on<ChangeSectionsContent>(_onChangeSectionsContent);
    on<ChangeParametersMap>(_onChangeParametersMap);
    on<ResetFillContent>(_onResetFillContent);
    // on<AutoFillContent>(_onAutoFillContent);
    on<UploadFileEvent>(_onUploadFileEvent);
  }

  void _onChangeSectionsContent(
    ChangeSectionsContent event,
    Emitter<FillContentState> emit,
  ) {
    emit(
      state.copyWith(
        sectionsContent: event.sectionsContent,
      ),
    );
  }

  void _onChangeParametersMap(
    ChangeParametersMap event,
    Emitter<FillContentState> emit,
  ) {
    emit(
      state.copyWith(
        parametersMap: event.parametersMap,
      ),
    );
  }

  void _onResetFillContent(
    ResetFillContent event,
    Emitter<FillContentState> emit,
  ) {
    emit(
      const FillContentState(parametersMap: {}, sectionsContent: ""),
    );
  }

  // Future<void> _onAutoFillContent(
  //   AutoFillContent event,
  //   Emitter<FillContentState> emit,
  // ) async {
  //   //deschide camera foto
  //   //face scan

  //   //ia rezultatul scanului intr-o mapa

  //   //pentru fiecare cheie gasita (document keyword)
  //   //fa o functie care sa adauge in mapa de parametrii cheia si valoarea
  //   //ceva gen add(ChangeParametersMap(parametersMap: {documentKeyword: scanResult}));

  //   final a = await FillFormApi(
  //     FirebaseFirestore.instance,
  //   ).analyzeDocument();

  //   log(a.toString());
  // }

  @override
  Future<void> close() {
    fillFormBlocSubscription.cancel();
    return super.close();
  }

  Future<void> _onUploadFileEvent(
    UploadFileEvent event,
    Emitter<FillContentState> emit,
  ) async {
    emit(
      state.copyWith(isLoading: true),
    );

    (await fillFormUsecase.uploadImageToFirebaseAndFilter(
      imageSource: event.imageSource,
      section: event.section,
    ))
        .fold(
      (l) => emit(
        state.copyWith(
          errorMessage: l.failureMessage,
        ),
      ),
      (successParametersMap) {
        emit(
          state.copyWith(parametersMap: successParametersMap),
        );
      },
    );

    emit(
      state.copyWith(isLoading: false),
    );
  }
}
