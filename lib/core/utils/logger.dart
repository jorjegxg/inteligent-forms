import 'package:flutter/foundation.dart';

class Logger {
  static void info(type, message) {
    if (kDebugMode) {
      print('ℹ️ INFO - $type $message');
    }
  }

  static void error(type, message) {
    if (kDebugMode) {
      print('❌ ERROR - $type $message');
    }
  }

  static void warning(type, message) {
    if (kDebugMode) {
      print('⚠️ WARNING - $type $message');
    }
  }

  static void success(type, message) {
    if (kDebugMode) {
      print('✅ SUCCESS - $type - $message');
    }
  }
}
