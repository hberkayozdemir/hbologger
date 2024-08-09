import 'package:hbologger/src/log_level_enum.dart';

abstract class Logger {
  late Logger? nextLogger;

  void setNextLogger(Logger nextLogger) {
    this.nextLogger = nextLogger;
  }

  void logMessage(String message, LogLevel level);

  void handleNext(String message, LogLevel level) {
    nextLogger?.logMessage(message, level);
  }
}
