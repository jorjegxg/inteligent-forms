class AccountTypeConstants {
  static const String individual = 'Individual';
  static const String company = 'Company';
  static const String publicInstitution = 'Public Institution';
}

List<String> accountTypeList = [
  AccountTypeConstants.individual,
  AccountTypeConstants.company,
  AccountTypeConstants.publicInstitution,
];

class FieldTypeConstants {
  static const String text = 'Text';
  static const String number = 'Number';
  static const String decimal = 'Decimal';
  static const String date = 'Date';
  static const String singleChoice = 'SingleChoice';
  static const String multipleChoice = 'MultipleChoice';
}
/**Eu <nume> am cnp-ul <cnp> un nr decimal e <decimal> ,valabilitatea <valabilitate> si am ales optiunea single <optini> si cele multiple <optiunim> */
List<String> fieldTypeList = [
  FieldTypeConstants.text,
  FieldTypeConstants.number,
  FieldTypeConstants.decimal,
  FieldTypeConstants.date,
  FieldTypeConstants.singleChoice,
  FieldTypeConstants.multipleChoice,
];

class ScanDocumentTypeConstants {
  static const String none = 'None';
  static const String identityCard = 'Identity Card';
  static const String birthCertificate = 'Birth Certificate';
  static const String passport = 'Passport';
  static const String vehicleIdentityCard = 'Vehicle Identity Card';
  static const String anyDocument = 'Any Document';
}

List<String> scanDocumentTypeList = [
  ScanDocumentTypeConstants.none,
  ScanDocumentTypeConstants.identityCard,
  ScanDocumentTypeConstants.birthCertificate,
  ScanDocumentTypeConstants.passport,
  ScanDocumentTypeConstants.vehicleIdentityCard,
  ScanDocumentTypeConstants.anyDocument,
];
