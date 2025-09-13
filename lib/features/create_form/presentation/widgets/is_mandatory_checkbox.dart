import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/string_constants.dart';
import '../bloc/create_field_bloc/create_field_bloc.dart';
import '../bloc/create_field_bloc/create_field_event.dart';
import '../bloc/create_field_bloc/create_field_state.dart';

class IsMandatoryCheckbox extends StatelessWidget {
  const IsMandatoryCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppCreateFormString.mandatory,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        BlocBuilder<CreateFieldBloc, CreateFieldState>(
          buildWhen: (previous, current) =>
              previous.isMandatory != current.isMandatory,
          builder: (context, state) {
            return Checkbox(
              value: state.isMandatory,
              onChanged: (newValue) {
                context
                    .read<CreateFieldBloc>()
                    .add(CreateFieldIsMandatoryChanged(isMandatory: newValue!));
              },
            );
          },
        ),
      ],
    );
  }
}
