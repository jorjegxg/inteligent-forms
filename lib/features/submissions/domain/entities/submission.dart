import 'package:intl/intl.dart';

class Submission {
  final String id;
  final String content;
  final DateTime dateWhenSubmitted;
  final DateTime dateWhenToBeDeleted;
  final List<String> listOfFields;

  Submission({
    required this.id,
    required this.content,
    required this.dateWhenSubmitted,
    required this.dateWhenToBeDeleted,
    required this.listOfFields,
  });

  String get getDate => DateFormat('d/MM/yyyy').format(dateWhenSubmitted);
}
