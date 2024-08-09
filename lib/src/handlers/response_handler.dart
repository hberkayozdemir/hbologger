import 'package:dio/dio.dart';
import 'package:hbologger/src/handlers/log_handler.dart';
import 'package:hbologger/src/used_plugin.dart';

class ResponseLogHandler extends LogHandler {
  @override
  void handle(RequestOptions options, [Response? response, DioException? error]) {
    if (response != null) {
      logger.i('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
      logger.d('Data: ${response.data}');
    }
    nextHandler?.handle(options, response, error);
  }
}
