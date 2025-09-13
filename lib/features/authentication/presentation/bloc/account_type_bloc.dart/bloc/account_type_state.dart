import 'package:equatable/equatable.dart';

import '../../../../../../core/utils/lists.dart';

class AccountTypeState extends Equatable {
  final String accountType;

  const AccountTypeState({
    required this.accountType,
  });

  @override
  List<Object> get props => [accountType, ...accountTypeList];
}
