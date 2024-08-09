import 'package:dio/dio.dart';
import 'package:hbologger/hbologger.dart';

class HboLoggerInterceptor extends Interceptor {
  late final LogHandler _handlerChain;

  HboLoggerInterceptor() {
    // Set up the chain of responsibility
    final requestHandler = RequestLogHandler();
    final responseHandler = ResponseLogHandler();
    final errorHandler = ErrorLogHandler();

    // Build the chain: request -> response -> error
    requestHandler.setNextHandler(responseHandler);
    responseHandler.setNextHandler(errorHandler);

    _handlerChain = requestHandler; // Start with the request handler
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _handlerChain.handle(options);
    handler.next(options); // Proceed to the next interceptor
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _handlerChain.handle(response.requestOptions, response);
    handler.next(response); // Proceed to the next interceptor
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _handlerChain.handle(err.requestOptions, null, err);
    handler.next(err); // Proceed to the next interceptor
  } 
}
