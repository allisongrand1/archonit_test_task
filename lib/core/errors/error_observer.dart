import 'package:flutter/foundation.dart';

class ErrorObserver {
  void handleError(Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      print('Caught an error: $error');
      print('Stack trace: $stackTrace');
    }
  }
}
