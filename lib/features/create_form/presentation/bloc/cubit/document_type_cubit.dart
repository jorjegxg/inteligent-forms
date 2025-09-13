import 'package:bloc/bloc.dart';

import 'document_type_state.dart';

class DocumentTypeCubit extends Cubit<DocumentTypeState> {
  DocumentTypeCubit()
      : super(
          DocumentTypeState.initial(),
        );

  void changeDropdownValue(String value) {
    emit(
      DocumentTypeState(
        dropdownValue: value,
      ),
    );
  }
}
