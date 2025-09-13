import 'package:equatable/equatable.dart';

import '../../../../../core/utils/lists.dart';

class DocumentTypeState extends Equatable {
  final String dropdownValue;

  const DocumentTypeState({
    required this.dropdownValue,
  });

  factory DocumentTypeState.initial() => const DocumentTypeState(
        dropdownValue: ScanDocumentTypeConstants.none,
      );

  @override
  List<Object?> get props => [dropdownValue];
}
