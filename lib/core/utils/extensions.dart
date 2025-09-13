import 'package:flutter/foundation.dart';

extension EmailPassIfDebug on String {
  get ifDebug => kDebugMode ? this : null;
}

extension DateToString on DateTime {
  String toDateString() {
    return "$year-$month-$day";
  }
}
