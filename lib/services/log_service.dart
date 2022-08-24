import 'dart:developer' as dev;

class LogService {
  static log(
    Object? message, {
    String? origin,
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    dev.log(message.toString(),
        name: origin ?? 'Log Service',
        time: time ?? DateTime.now(),
        error: error,
        stackTrace: stackTrace);
  }
}
