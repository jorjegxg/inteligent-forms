import 'package:bloc/bloc.dart';

import '../../../../../../core/utils/lists.dart';
import 'account_type_changed.dart';
import 'account_type_state.dart';

class AccountTypeBloc extends Bloc<AccountTypeChanged, AccountTypeState> {
  AccountTypeBloc()
      : super(const AccountTypeState(
          accountType: AccountTypeConstants.individual,
        )) {
    on<AccountTypeChanged>(
      (event, emit) {
        emit(
          AccountTypeState(accountType: event.accountType),
        );
      },
    );
  }
}
