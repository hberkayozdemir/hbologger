import 'package:dio/dio.dart';

abstract class LogHandler {
  LogHandler? nextHandler;

  void setNextHandler(LogHandler handler) {
    nextHandler = handler;
  }

  void handle(RequestOptions options, [Response? response, DioException? error]);
}
