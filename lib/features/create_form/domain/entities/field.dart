class Field {
  String label;
  String placeholderKeyWord;
  bool mandatory;
  String fieldType;
  List<String>? options;
  List<String> docKeys;

  Field({
    required this.placeholderKeyWord,
    required this.mandatory,
    required this.fieldType,
    this.options,
    required this.docKeys,
    required this.label,
  });

  @override
  String toString() {
    return 'Field('
        'label: $label, '
        'placeholderKeyWord: $placeholderKeyWord, '
        'mandatory: $mandatory, '
        'fieldType: $fieldType, '
        'options: $options, '
        'docKeys: $docKeys)';
  }
}
