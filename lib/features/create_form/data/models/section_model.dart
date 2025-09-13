import '../../domain/entities/section.dart';

class SectionModel extends Section {
  SectionModel({
    required super.content,
    required super.scanType,
    required super.sectionNumber,
    this.id,
    required this.formId,
  });
  String? id;
  String formId;

  factory SectionModel.fromMap(Map<String, dynamic> map) {
    return SectionModel(
      content: map['content'],
      scanType: map['scanType'],
      sectionNumber: map['sectionNumber'],
      id: map['id'],
      formId: map['formId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'scanType': scanType,
      'sectionNumber': sectionNumber,
      'id': id,
      'formId': formId,
    };
  }
}
