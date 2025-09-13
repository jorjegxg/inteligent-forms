import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/lists.dart';
import '../bloc/create_field_bloc/create_field_bloc.dart';
import '../bloc/create_field_bloc/create_field_event.dart';
import '../bloc/create_field_bloc/create_field_state.dart';

class FieldTypeDropdown extends StatelessWidget {
  const FieldTypeDropdown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 3.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3.w),
        ),
      ),
      child: BlocBuilder<CreateFieldBloc, CreateFieldState>(
        buildWhen: (previous, current) =>
            previous.fieldType != current.fieldType,
        builder: (context, state) {
          return DropdownButtonHideUnderline(
            child: DropdownButton<String>(
                isExpanded: true,
                menuMaxHeight: 30.h,
                value: state.fieldType,
                icon: const Icon(Icons.arrow_drop_down),
                onChanged: (String? value) {
                  context.read<CreateFieldBloc>().add(
                        CreateFieldTypeChanged(
                          fieldType: value!,
                        ),
                      );
                },
                items: fieldTypeList
                    .map((e) => DropdownMenuItem<String>(
                          value: e,
                          child: Text(
                            e,
                          ),
                        ))
                    .toList()),
          );
        },
      ),
    );
  }
}
