// Copyright (c) 2023, one of the D3F outsourcing projects. All rights reserved.

// coverage:ignore-file

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getx_sample/app/routes/app_pages.dart';
import 'package:getx_sample/data/bean/app_configurations.dart';
import 'package:getx_sample/data/bean/refresh_token_response/refresh_token_response.dart';
import 'package:getx_sample/data/remote/clients/user_client.dart';
import 'package:getx_sample/data/remote/layers/network_executor.dart';
import 'package:getx_sample/data/remote/wrappers/network_options.dart';
import 'package:getx_sample/data/repositories/app_configs_repository.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import '../interfaces/base_client_generator.dart';

class NetworkCreator {
  static var shared = NetworkCreator();
  final Dio _client = Get.find();
  AppConfigurations? _appConfigs;
  final _appConfigsRepo = Get.find<AppConfigsRepository>();

  /// MOCK HTTP RESPONSE for the testing.
  // DioAdapter? dioAdapter;

  Future<Response> request(
      {required BaseClientGenerator route,
      NetworkOptions? options,
      bool? tokenRefreshing = false}) async {
    /// Load configurations
    _appConfigs = await _appConfigsRepo.retrieveAppConfigurations();

    /// Add interceptor to refresh token: START !!!.
    _client.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) => requestInterceptor(options: options, handler: handler),
      onError: (error, handler) =>
          refreshTokenInterceptor(error: error, handler: handler, route: route, options: options),
    ));

    /// Add interceptor to refresh token: END !!!.

    /// Test for the token refreshing: START !!!
    // if (kDebugMode) {
    //   dioAdapter = DioAdapter(dio: _client, matcher: const UrlRequestMatcher(matchMethod: true));
    //   _client.httpClientAdapter = dioAdapter as HttpClientAdapter;
    //   dioAdapter?.onPost('user', (server) {
    //     server.reply(
    //         HttpStatus.ok,
    //         {
    //           "code": "0000",
    //           "message": "Thành Công",
    //           "result": {
    //             "iduser": "ab538aca6e9be73d18999e6e2c7c9377",
    //             "role": 1,
    //             "username": "DanhDue",
    //             "fullname": "DanhDue ExOICTIF",
    //             "birthday": "01/01/1991",
    //             "phone": "0967648834",
    //             "email": "danhdue@gmail.com",
    //             "ccid": "145398631",
    //             "access_token": "ab538aca6e9be73d18999e6e2c7c9377",
    //             "expires_in": "01/01/2051",
    //             "token_type": "bear_token",
    //             "refresh_token": "ab538aca6e9be73d18999e6e2c7c9377",
    //             "scope": "Galaxy",
    //             "biometricAuth": true
    //           }
    //         },
    //         delay: const Duration(seconds: 2));
    //   });

    //   dioAdapter?.onPost('/user/refreshToken', (server) {
    //     server.reply(HttpStatus.ok, {
    //       'access_token': 'AYjcyMzY3ZDhiNmJkNTY',
    //       'refresh_token': 'RjY2NjM5NzA2OWJjuE7c',
    //       'token_type': 'bearer',
    //       'expires_in': '25/12/2022'
    //     });
    //   });
    // }

    /// Test for the token refreshing: END !!!

    return _client.fetch(RequestOptions(
        baseUrl: _appConfigs?.baseUrl ?? route.baseURL,
        method: route.method,
        path: route.path,
        queryParameters: route.queryParameters,
        data: route.body,
        sendTimeout: route.sendTimeout,
        receiveTimeout: route.sendTimeout,
        onReceiveProgress: options?.onReceiveProgress,
        validateStatus: (statusCode) =>
            (statusCode! >= HttpStatus.ok && statusCode <= HttpStatus.multipleChoices)));
  }

  dynamic requestInterceptor(
      {required RequestOptions options, required RequestInterceptorHandler handler}) async {
    if (_appConfigs?.accessToken != null) {
      options.headers.addAll({"Authorization": "Bearer ${_appConfigs?.accessToken}"});
    }
    handler.next(options);
  }

  dynamic refreshTokenInterceptor(
      {required DioError error,
      required ErrorInterceptorHandler handler,
      required BaseClientGenerator route,
      NetworkOptions? options}) async {
    if (error.response?.statusCode == HttpStatus.forbidden ||
        error.response?.statusCode == HttpStatus.unauthorized) {
      await refreshToken();
      final response = await request(route: route, options: options, tokenRefreshing: true);
      handler.resolve(response);
      return;
    }
    handler.next(error);
  }

  Future<void> refreshToken() async {
    RefreshTokenResponse? tokenResponse;
    final response = await NetworkExecutor.execute(
        route: UserClient.refreshToken(_appConfigs?.refreshToken),
        responseType: RefreshTokenResponse());
    response.when(success: (tokenResponse) {
      Fimber.d('save new tokens to the storage');
      tokenResponse = tokenResponse;
    }, failure: (networkError) {
      Fimber.e(networkError.toString());
    });
    if (tokenResponse == null) {
      Fimber.e('refresh token is fail! => Navigate to the login screen.');
      Get.toNamed(Routes.LOGIN);
    } else {
      _appConfigs = _appConfigs?.copyWith(
              refreshToken: tokenResponse.refreshToken, accessToken: tokenResponse.accessToken) ??
          AppConfigurations(
              refreshToken: tokenResponse.refreshToken, accessToken: tokenResponse.accessToken);
      await _appConfigsRepo.saveAppConfigurations(_appConfigs);
    }
  }
}
