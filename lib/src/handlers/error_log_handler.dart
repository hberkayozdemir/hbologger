import 'package:dio/dio.dart';
import 'package:hbologger/src/handlers/log_handler.dart';
import 'package:hbologger/src/used_plugin.dart';

class ErrorLogHandler extends LogHandler {
  @override
  void handle(RequestOptions options, [Response? response, DioException? error]) {
    if (error != null) {
      logger.e('ERROR[${error.response?.statusCode}] => PATH: ${error.requestOptions.path}');
      logger.e('Message: ${error.message}');
      logger.e('Data: ${error.response?.data}');
    }
    nextHandler?.handle(options, response, error);
  }
}
