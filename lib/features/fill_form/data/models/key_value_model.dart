class KeyValueModel {
  final String key;
  final String value;

  KeyValueModel({
    required this.key,
    required this.value,
  });

  factory KeyValueModel.fromMap(Map<String, dynamic> map) {
    return KeyValueModel(
      key: map['key']['content'],
      value: map['value']['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'value': value,
    };
  }
}
