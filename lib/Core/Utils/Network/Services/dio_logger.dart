import 'dart:developer' as developer;
import 'package:dio/dio.dart';

class DioLogger extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    developer.log(
      '''
REQUEST: ${options.method} ${options.uri}
Headers: ${options.headers}
Data: ${options.data}
''',
      name: 'DIO',
    );
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    developer.log(
      '''
RESPONSE: ${response.statusCode} ${response.statusMessage}
Headers: ${response.headers}
Data: ${response.data}
''',
      name: 'DIO',
    );
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    developer.log(
      '''
ERROR: ${err.type}
Message: ${err.message}
Response: ${err.response}
''',
      name: 'DIO',
      error: err,
    );
    handler.next(err);
  }
}
