class ProfileEntity {
  final String name;
  final String email;
  final String accountType;
  final String address;

  final String fiscalCode;

  ProfileEntity({
    required this.name,
    required this.email,
    required this.accountType,
    required this.address,
    required this.fiscalCode,
  });

  @override
  String toString() {
    return 'ProfileEntity(name: $name,'
        ' email: $email,'
        ' accountType: $accountType,'
        ' address: $address,'
        ' fiscalCode: $fiscalCode)';
  }
}
