import 'package:hbologger/src/log_level_enum.dart';

abstract class Logging {
  Logging? _nextLogger;

  void setNextLogger(Logging logger) {
    _nextLogger = logger;
  }

  void logMessage(String message, LogLevel level) {
    if (_nextLogger != null) {
      _nextLogger!.logMessage(message, level);
    }
  }

  void handleNext(String message, LogLevel level) {
    if (_nextLogger != null) {
      _nextLogger!.logMessage(message, level);
    }
  }
}
