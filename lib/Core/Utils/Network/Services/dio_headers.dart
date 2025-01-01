import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/secure_token.dart';
import '../../localization/cubit/local_cubit.dart';
import '../../enums/localization.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await SecureToken.getToken();
    final context = options.extra['context'] as BuildContext?;

    final language = context != null &&
            LocalCubit.get(context).localizationThemeState ==
                LocalizationThemeState.ar
        ? "ar"
        : "en";

    options.headers.addAll({
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
      'X-Locale': language,
    });

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      SecureToken.deleteToken();
    }
    handler.next(err);
  }
}
