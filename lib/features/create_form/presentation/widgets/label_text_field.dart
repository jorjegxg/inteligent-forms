import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/string_constants.dart';
import '../../../../core/shared_widgets/my_text_field.dart';
import '../bloc/create_field_bloc/create_field_bloc.dart';
import '../bloc/create_field_bloc/create_field_event.dart';

class LabelTextField extends StatelessWidget {
  const LabelTextField({
    super.key,
    required this.labelController,
  });

  final TextEditingController labelController;

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      controller: labelController,
      hintText: AppCreateFormString.label,
      textAlign: TextAlign.start,
      onChanged: (String value) {
        context.read<CreateFieldBloc>().add(
              LabelChanged(label: value),
            );
      },
    );
  }
}
