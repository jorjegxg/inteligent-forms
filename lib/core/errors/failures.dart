abstract class Failure {
  final String failureMessage;

  Failure({
    required this.failureMessage,
  });
}

class HardFailure extends Failure {
  HardFailure({
    required super.failureMessage,
  });
}

class EasyFailure extends Failure {
  EasyFailure({
    required super.failureMessage,
  });
}

class MediumFailure extends Failure {
  MediumFailure({
    required super.failureMessage,
  });
}

class FieldFailure extends Failure {
  FieldFailure({
    required super.failureMessage,
  });
}

class EmptyFieldFailure extends Failure {
  EmptyFieldFailure({
    required super.failureMessage,
  });
}

class InvalidFieldFailure extends Failure {
  InvalidFieldFailure({
    required super.failureMessage,
  });
}
