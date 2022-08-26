import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';

class LogService {
  static log(
    Object? message, {
    String? origin,
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (kIsWeb) {
      dev.log(message.toString(),
          name: origin ?? 'Log Service',
          time: time ?? DateTime.now(),
          error: error,
          stackTrace: stackTrace);
      dev.log(
        '${{'error': error, 'stackTrace': stackTrace}}',
        name: origin ?? 'Log Service',
        time: time ?? DateTime.now(),
      );
    } else {
      dev.log(message.toString(),
          name: origin ?? 'Log Service',
          time: time ?? DateTime.now(),
          error: error,
          stackTrace: stackTrace);
    }
  }
}
