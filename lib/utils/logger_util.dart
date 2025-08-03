import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

var logger = MyLogger();

class MyLogger {
  /// Log a message at level verbose.
  static void v(dynamic message) {
    _print(" VERBOSE: $message");
  }

  /// Log a message at level debug.
  static void d(dynamic message) {
    _print(" DEBUG: $message");
  }

  /// Log a message at level info.
  static void i(dynamic message) {
    _print(" INFO: $message");
  }

  /// Log a message at level warning.
  static void w(dynamic message) {
    _print(" WARNING: $message");
  }

  /// Log a message at level error.
  static void e(dynamic message) {
    _print(" ERROR: $message");
  }

  static void _print(dynamic message) {
    if (kDebugMode) {
      print("$message");
    }
  }

  static void _log(dynamic message) {
    if (kDebugMode) {
      developer.log("$message");
    }
  }

  static void log(dynamic message, {bool printFullText = false}) {
    if (printFullText) {
      _log(message);
    } else {
      _print(message);
    }
    // if (stackTrace != null) {
    //   _print(stackTrace);
    // }
  }

  static void write(String text, {bool isError = false}) {
    Future.microtask(
      () => debugPrint('** isError: [$isError] **====>>> $text'),
    );
  }
}
