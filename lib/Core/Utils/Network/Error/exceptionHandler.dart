import 'dart:async';

import 'package:dio/dio.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Error/exception.dart';

class DioErrorHandler {
  static Exception handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return TimeoutException('Connection timeout');

        case DioExceptionType.badResponse:
          return handleResponse(error.response!);

        case DioExceptionType.connectionError:
          return NoInternetException(message: 'Connection error');

        default:
          return UnExpectedException(
              message: error.message ?? 'Unexpected error occurred');
      }
    }
    return UnExpectedException(message: 'Unexpected error occurred');
  }

  static Exception handleResponse(Response response) {
    final message = _getErrorMessage(response.data);

    switch (response.statusCode) {
      case 400:
        return BadRequestException(message: message);
      case 401:
        return UnauthorizedException(message: message);
      case 403:
        return ForbiddenException(message: message);
      case 404:
        return NotFoundException(message: message);
      case 500:
        return ServerException(message: message);
      default:
        return UnExpectedException(
          message: 'Unexpected error: ${response.statusCode}',
        );
    }
  }

  static String _getErrorMessage(dynamic data) {
    if (data == null) return 'Unknown error';
    if (data is String) return data;
    if (data is Map) return data['message'] ?? data['error'] ?? 'Unknown error';
    return 'Unknown error';
  }
}
