import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/string_constants.dart';
import '../../../../core/shared_widgets/my_text_field.dart';
import '../bloc/create_field_bloc/create_field_bloc.dart';
import '../bloc/create_field_bloc/create_field_event.dart';

class KeyWordTextField extends StatelessWidget {
  const KeyWordTextField({
    super.key,
    required this.keywordController,
  });

  final TextEditingController keywordController;

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      controller: keywordController,
      hintText: AppCreateFormString.placeholderKeyWord,
      textAlign: TextAlign.start,
      onChanged: (String value) {
        context.read<CreateFieldBloc>().add(
              PlaceholderKeyWordChanged(placeholderKeyWord: value),
            );
      },
    );
  }
}
