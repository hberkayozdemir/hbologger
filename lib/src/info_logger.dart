import 'package:hbologger/src/log_level_enum.dart';
import 'package:hbologger/src/logging.dart';
import 'package:hbologger/src/used_plugin.dart';

class InfoLogger extends Logging {
  @override
  void logMessage(String message, LogLevel level) {
    if (level == LogLevel.INFO) {
      logger.i("Info Logger: $message");
    } else {
      handleNext(message, level);
    }
  }
}
