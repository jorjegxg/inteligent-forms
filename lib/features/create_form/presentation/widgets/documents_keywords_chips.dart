import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/string_constants.dart';
import '../../../../../core/shared_widgets/text_field_with_chips.dart';
import '../bloc/create_field_bloc/create_field_bloc.dart';
import '../bloc/create_field_bloc/create_field_event.dart';
import '../bloc/create_field_bloc/create_field_state.dart';

class DocumentKeywordsChips extends StatelessWidget {
  const DocumentKeywordsChips({
    super.key,
    required this.docsKeywordsController,
  });

  final TextEditingController docsKeywordsController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateFieldBloc, CreateFieldState>(
      buildWhen: (previous, current) =>
          previous.showDocumentKeywords != current.showDocumentKeywords ||
          previous.documentKeywords != current.documentKeywords,
      builder: (context, state) {
        return TextFieldWithChips(
          hintText: AppStringConstants.newDocKeyword,
          title: AppCreateFormString.documentKeywords,
          controller: docsKeywordsController,
          onAdd: () {
            context.read<CreateFieldBloc>().add(
                  DocumentKeywordsChanged(
                    documentKeywords: [
                      ...state.documentKeywords,
                      docsKeywordsController.text.trim()
                    ],
                  ),
                );
            docsKeywordsController.clear();
          },
          contentInChips: state.documentKeywords,
          onDeleteChip: (value) {
            context.read<CreateFieldBloc>().add(
                  DocumentKeywordsChanged(
                    documentKeywords: [
                      ...state.documentKeywords
                          .where((element) => element != value)
                    ],
                  ),
                );
          },
          onMinimaze: () {
            context.read<CreateFieldBloc>().add(
                  ShowDocumentKeywordsChanged(
                    showDocumentKeywords: !state.showDocumentKeywords,
                  ),
                );
          },
          showAllContainer: state.showDocumentKeywords,
        );
      },
    );
  }
}
