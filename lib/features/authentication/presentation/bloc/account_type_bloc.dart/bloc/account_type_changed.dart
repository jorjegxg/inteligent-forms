import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class AccountTypeChanged extends Equatable {
  const AccountTypeChanged({
    required this.accountType,
  });

  final String accountType;

  @override
  List<Object> get props => [accountType];
}
