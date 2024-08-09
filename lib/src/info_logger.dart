import 'package:hbologger/src/log_level_enum.dart';
import 'package:hbologger/src/logger.dart';
import 'package:hbologger/src/used_plugin.dart';

class InfoLogger extends Logger {
  @override
  void logMessage(String message, LogLevel level) {
    if (level == LogLevel.INFO) {
      logger.i("Info Logger: $message");
    } else {
      handleNext(message, level);
    }
  }
}
