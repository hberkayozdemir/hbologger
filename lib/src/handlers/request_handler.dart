import 'package:dio/dio.dart';
import 'package:hbologger/src/debug_logger.dart';
import 'package:hbologger/src/handlers/log_handler.dart';
import 'package:hbologger/src/info_logger.dart';
import 'package:hbologger/src/log_level_enum.dart';
import 'package:hbologger/src/logging.dart';

class RequestLogHandler extends LogHandler {
  final Logging loggerChain;

  RequestLogHandler() : loggerChain = DebugLogger()..setNextLogger(InfoLogger());

  @override
  void handle(RequestOptions options, [Response? response, DioException? error]) {
    if (response == null && error == null) {
      loggerChain.logMessage(
        'REQUEST[${options.method}] => PATH: ${options.path}',
        LogLevel.DEBUG,
      );
      loggerChain.logMessage('Headers: ${options.headers}', LogLevel.INFO);
      loggerChain.logMessage('Data: ${options.data}', LogLevel.INFO);
    }
    nextHandler?.handle(options, response, error);
  }
}
