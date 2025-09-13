class Section {
  String content;
  String scanType;
  int sectionNumber;

  Section({
    required this.content,
    required this.scanType,
    required this.sectionNumber,
  });

  @override
  String toString() {
    return 'Section('
        'content: $content, '
        'scanType: $scanType,'
        'sectionNumber: $sectionNumber)';
  }

  factory Section.fromMap(Map<String, dynamic> map) {
    return Section(
      content: map['content'],
      scanType: map['scanType'],
      sectionNumber: map['sectionNumber'],
    );
  }
}
