import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/string_constants.dart';
import '../../../../core/shared_widgets/text_field_with_chips.dart';
import '../../../../core/utils/lists.dart';
import '../bloc/create_field_bloc/create_field_bloc.dart';
import '../bloc/create_field_bloc/create_field_event.dart';
import '../bloc/create_field_bloc/create_field_state.dart';

class NewOptionsChips extends StatelessWidget {
  const NewOptionsChips({
    super.key,
    required this.optionsKeywordsController,
  });

  final TextEditingController optionsKeywordsController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateFieldBloc, CreateFieldState>(
      builder: (context, state) {
        if (state.fieldType != FieldTypeConstants.singleChoice &&
            state.fieldType != FieldTypeConstants.multipleChoice) {
          return const SizedBox();
        }
        return TextFieldWithChips(
          hintText: AppCreateFormString.newOption,
          title: AppCreateFormString.options,
          controller: optionsKeywordsController,
          onAdd: () {
            context.read<CreateFieldBloc>().add(
                  OptionsChanged(
                    options: [
                      ...state.options,
                      optionsKeywordsController.text.trim()
                    ],
                  ),
                );
            optionsKeywordsController.clear();
          },
          onMinimaze: () {
            context.read<CreateFieldBloc>().add(
                  ShowOptionsChanged(
                    showOptions: !state.showOptions,
                  ),
                );
          },
          contentInChips: state.options,
          onDeleteChip: (value) {
            context.read<CreateFieldBloc>().add(
                  OptionsChanged(
                    options: [
                      ...state.options.where((element) => element != value)
                    ],
                  ),
                );
          },
          showAllContainer: state.showOptions,
        );
      },
    );
  }
}
