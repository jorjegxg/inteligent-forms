import '../../../../core/utils/date_time_functions.dart';

class FormEntity {
  final String title;
  final DateTime dateAdded;
  final String id;

  FormEntity({
    required this.id,
    required this.title,
    required this.dateAdded,
  });

  String get formattedDate => DateTimeFunctions.getFormattedDate(dateAdded);

  @override
  String toString() {
    return 'FormEntity(title: $title,'
        ' dateAdded: $formattedDate)';
  }
}
