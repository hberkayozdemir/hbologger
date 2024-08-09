import 'package:hbologger/src/log_level_enum.dart';
import 'package:hbologger/src/logger.dart';
import 'package:hbologger/src/used_plugin.dart';

class DebugLogger extends Logger {
  @override
  void logMessage(String message, LogLevel level) {
    if (level == LogLevel.DEBUG) {
      logger.d("Debug Logger: $message");
    } else {
      handleNext(message, level);
    }
  }
}
