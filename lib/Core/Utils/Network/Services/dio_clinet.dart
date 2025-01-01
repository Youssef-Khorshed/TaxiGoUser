import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Error/exceptionHandler.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/dio_headers.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/dio_logger.dart';

class DioClient {
  final Dio _dio;
  final DioLogger _logger;

  DioClient({
    Dio? dio,
    DioLogger? logger,
  })  : _dio = dio ?? Dio(),
        _logger = logger ?? DioLogger() {
    _configureDio();
  }

  void _configureDio() {
    _dio.options
      ..connectTimeout = const Duration(seconds: 30)
      ..receiveTimeout = const Duration(seconds: 30)
      ..validateStatus = (status) => status! < 500;

    _dio.interceptors.addAll([
      AuthInterceptor(),
      _logger,
    ]);
  }

  Future<T> get<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    required BuildContext context,
  }) async {
    try {
      final response = await _dio.get(url, queryParameters: queryParameters);
      return _handleResponse<T>(response);
    } catch (e) {
      throw DioErrorHandler.handle(e);
    }
  }

  Future<T> post<T>(
    String url, {
    dynamic data,
    required BuildContext context,
  }) async {
    try {
      final response = await _dio.post(url, data: data);
      return _handleResponse<T>(response);
    } catch (e) {
      throw DioErrorHandler.handle(e);
    }
  }

  Future<T> put<T>(
    String url, {
    dynamic data,
    required BuildContext context,
  }) async {
    try {
      final response = await _dio.put(url, data: data);
      return _handleResponse<T>(response);
    } catch (e) {
      throw DioErrorHandler.handle(e);
    }
  }

  Future<T> delete<T>(
    String url, {
    required BuildContext context,
  }) async {
    try {
      final response = await _dio.delete(url);
      return _handleResponse<T>(response);
    } catch (e) {
      throw DioErrorHandler.handle(e);
    }
  }

  T _handleResponse<T>(Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      if (response.data is Map && response.data['data'] != null) {
        return response.data['data'] as T;
      }
      return response.data as T;
    }
    throw DioErrorHandler.handleResponse(response);
  }
}
