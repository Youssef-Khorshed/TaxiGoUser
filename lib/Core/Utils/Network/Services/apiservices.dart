import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/secure_token.dart';
import '../../enums/localization.dart';
import '../../localization/cubit/local_cubit.dart';
import '../Error/exception.dart';
import 'internetconnection.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Error/failure.dart';

class ApiService {
  InternetConnectivity internetConnectivity;
  ApiService({required this.internetConnectivity});
  static Dio? _dio;
  // Singleton Dio instance
  Future<Dio> getDio(context) async {
    // String? token = await SecureToken.getToken();
    String token = '130|pTBzqKJZfluwlnwPXVjOhyL4lQZVpdpg9a0R7lk5317c66ec';
    log("EEEEEEEEEWWWWWWW${token}");
    Duration timeOut = const Duration(seconds: 30);

    if (_dio == null) {
      _dio = Dio();

      _dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;

      _addDioInterceptor();
    }

    String language = LocalCubit.get(context).localizationThemeState ==
            LocalizationThemeState.ar
        ? "ar"
        : "en";

    print("EEEEEE${token}");

    _addDioHeaders(language: language, token: token);

    return _dio!;
  }

  // Function to set default headers
  static void _addDioHeaders({String? token, String language = 'ar'}) {
    _dio?.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer $token', //'Bearer your_token_here', // You can add a token dynamically if needed
      'X-Locale': language
    };
  }

  // Function to add PrettyDioLogger interceptor for logging
  static void _addDioInterceptor() {
    _dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true,
      ),
    );
  }

  // Function to make GET requests
  Future<T> getRequest<T>(String url,
      {Map<String, dynamic>? queryParameters,
      required BuildContext context}) async {
    try {
      if (await internetConnectivity.isConnected) {
        getDio(context);
        final response = await _dio!.get(
          url,
          data: queryParameters,
        );
        if (response.statusCode != null) {
          if (response.statusCode == 200 || response.statusCode == 201) {
            return response.data;
          } else {
            throw ServerException(
              message: response.toString(),
            );
          }
        }
      } else {
        throw NoInternetException(message: 'No internet Connection');
      }
      throw UnExpectedException(message: 'Un Expected error occurs');
    } on DioException catch (dioE) {
      throw ServerException(message: ServerFailure.fromDioError(dioE));
    }
  }

  // Function to make POST requests
  Future<T> postRequest<T>(String url,
      {dynamic body, required BuildContext context}) async {
    try {
      if (await internetConnectivity.isConnected) {
        await getDio(context);

        final response = await _dio!.post(url, data: body);
        if (response.statusCode != null) {
          if (response.statusCode == 200 || response.statusCode == 201) {
            return response.data;
          }
          if (response.statusCode == 302) {
            var redirectedUrl = response.headers['location'];
            print('Redirected to: $redirectedUrl');
          } else {
            throw ServerException(
              message: response.toString(),
            );
          }
        }
      } else {
        throw NoInternetException(message: 'No internet Connection');
      }
      throw UnExpectedException(message: 'Un Expected error occurs');
    } on DioException catch (dioE) {
      throw ServerException(message: ServerFailure.fromDioError(dioE));
    }
  }

  // Function to make PUT requests
  Future<T> putRequest<T>(String url,
      {dynamic body, required BuildContext context}) async {
    if (await internetConnectivity.isConnected) {
      await getDio(context);

      final response = await _dio!.put(
        url,
        data: json.encode(body), // Send the body as JSON
      );

      if (response.statusCode != null) {
        if (response.statusCode == 200) {
          return response.data;
        } else {
          throw ServerException(
            message: response.toString(),
          );
        }
      }
    } else {
      throw NoInternetException(message: 'No internet Connection');
    }
    throw UnExpectedException(message: 'Un Expected error occurs');
  }

  // Function to make DELETE requests
  Future<T> deleteRequest<T>(String url,
      {required BuildContext context}) async {
    if (await internetConnectivity.isConnected) {
      await getDio(context);
      final response = await _dio!.delete(url);
      if (response.statusCode != null) {
        if (response.statusCode == 200) {
          return response.data;
        } else {
          throw ServerException(
            message: response.toString(),
          );
        }
      }
    } else {
      throw NoInternetException(message: 'No internet Connection');
    }
    throw UnExpectedException(message: 'Un Expected error occurs');
  }
}
