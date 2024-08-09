import 'package:dio/dio.dart';
import 'package:hbologger/src/debug_logger.dart';
import 'package:hbologger/src/handlers/log_handler.dart';
import 'package:hbologger/src/info_logger.dart';
import 'package:hbologger/src/log_level_enum.dart';
import 'package:hbologger/src/logging.dart';

class ResponseLogHandler extends LogHandler {
  final Logging loggerChain;

  ResponseLogHandler() : loggerChain = DebugLogger()..setNextLogger(InfoLogger());

  @override
  void handle(RequestOptions options, [Response? response, DioException? error]) {
    if (response != null) {
      loggerChain.logMessage(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
        LogLevel.INFO,
      );
      loggerChain.logMessage('Data: ${response.data}', LogLevel.DEBUG);
    }
    nextHandler?.handle(options, response, error);
  }
}
