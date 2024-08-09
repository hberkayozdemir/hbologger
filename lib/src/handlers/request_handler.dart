import 'package:dio/dio.dart';
import 'package:hbologger/src/handlers/log_handler.dart';
import 'package:hbologger/src/used_plugin.dart';

class RequestLogHandler extends LogHandler {
  @override
  void handle(RequestOptions options, [Response? response, DioException? error]) {
    if (response == null && error == null) {
      logger.i('REQUEST[${options.method}] => PATH: ${options.path}');
      logger.d('Headers: ${options.headers}');
      logger.d('Data: ${options.data}');
    }
    nextHandler?.handle(options, response, error);
  }
}
