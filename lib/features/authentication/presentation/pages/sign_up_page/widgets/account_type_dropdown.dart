import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inteligent_forms/core/constants/app_number_constants.dart';

import '../../../../../../core/utils/lists.dart';
import '../../../bloc/account_type_bloc.dart/bloc/account_type_bloc.dart';
import '../../../bloc/account_type_bloc.dart/bloc/account_type_changed.dart';
import '../../../bloc/account_type_bloc.dart/bloc/account_type_state.dart';

class AccountTypeDropdown extends StatelessWidget {
  const AccountTypeDropdown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountTypeBloc, AccountTypeState>(
      builder: (context, state) {
        return DropdownButtonFormField<String>(
          isExpanded: true,
          value: state.accountType,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                AppNumberConstants.longTileRadius,
              ),
            ),
            fillColor: Theme.of(context).colorScheme.onPrimary,
            filled: true,
          ),
          isDense: true,
          items: accountTypeList
              .map((e) => DropdownMenuItem<String>(
                    value: e,
                    child: Center(
                      child: Text(
                        e,
                      ),
                    ),
                  ))
              .toList(),
          onChanged: (value) {
            context.read<AccountTypeBloc>().add(
                  AccountTypeChanged(accountType: value!),
                );
          },
        );
      },
    );
  }
}
