import 'package:dio/dio.dart';
import 'package:hbologger/src/error_logger.dart';
import 'package:hbologger/src/handlers/log_handler.dart';
import 'package:hbologger/src/log_level_enum.dart';
import 'package:hbologger/src/logging.dart';

class ErrorLogHandler extends LogHandler {
  final Logging loggerChain;

  ErrorLogHandler() : loggerChain = ErrorLogger();

  @override
  void handle(RequestOptions options, [Response? response, DioException? error]) {
    if (error != null) {
      loggerChain.logMessage(
        'ERROR[${error.response?.statusCode}] => PATH: ${error.requestOptions.path}',
        LogLevel.ERROR,
      );
      loggerChain.logMessage('Message: ${error.message}', LogLevel.ERROR);
      loggerChain.logMessage('Data: ${error.response?.data}', LogLevel.ERROR);
    }
    nextHandler?.handle(options, response, error);
  }
}
