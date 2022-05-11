import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fimber/fimber.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getx_sample/app/routes/links.dart';
import 'package:getx_sample/data/bean/app_configurations/app_configurations.dart';
import 'package:getx_sample/data/bean/refresh_token_response/refresh_token_response.dart';
import 'package:getx_sample/data/remote/clients/user_client.dart';
import 'package:getx_sample/data/remote/layers/network_executor.dart';
import 'package:getx_sample/data/remote/network_options.dart';
import 'package:getx_sample/data/repositories/app_configurations_repository.dart';

import '../interfaces/base_client_generator.dart';

class NetworkCreator {
  static var shared = NetworkCreator();
  final Dio _client = Get.find();
  AppConfigurations? _appConfigs;
  final _appConfigRepo = Get.find<AppConfigurationsRepository>();

  /// MOCK HTTP RESPONSE for the testing.
  // DioAdapter? dioAdapter;

  Future<Response> request(
      {required BaseClientGenerator route,
      NetworkOptions? options,
      bool? tokenRefreshing = false}) async {
    /// Load configurations
    _appConfigs = await _appConfigRepo.retrieveAppConfigurations();

    /// Add interceptor to refresh token: START !!!.
    _client.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) =>
          requestInterceptor(options: options, handler: handler),
      onError: (error, handler) => refreshTokenInterceptor(
          error: error, handler: handler, route: route, options: options),
    ));

    /// Add interceptor to refresh token: END !!!.

    /// Test for the token refreshing: START !!!
    // if (kDebugMode) {
    //   dioAdapter = DioAdapter(
    //       dio: _client, matcher: const UrlRequestMatcher(matchMethod: true));
    //   _client.httpClientAdapter = dioAdapter as HttpClientAdapter;
    //   dioAdapter?.onGet('price?symbol=SXPBTC', (server) {
    //     server.reply(200, {'symbol': 'SXPBTC', 'price': '0.2456'});
    //   });
    //   dioAdapter?.onGet('price?symbol=SXPUSDT', (server) {
    //     server.reply(
    //         (tokenRefreshing == true) ? HttpStatus.ok : HttpStatus.unauthorized,
    //         {'symbol': 'SXPBTC', 'price': '1.568'});
    //   });
    //   dioAdapter?.onPost('refresh', (server) {
    //     server.reply(HttpStatus.notFound, {
    //       'access_token': 'AYjcyMzY3ZDhiNmJkNTY',
    //       'refresh_token': 'RjY2NjM5NzA2OWJjuE7c',
    //       'token_type': 'bearer',
    //       'expires': 3600
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
        validateStatus: (statusCode) => (statusCode! >= HttpStatus.ok &&
            statusCode <= HttpStatus.multipleChoices)));
  }

  dynamic requestInterceptor(
      {required RequestOptions options,
      required RequestInterceptorHandler handler}) async {
    if (_appConfigs?.accessToken != null) {
      options.headers
          .addAll({"Authorization": "Bearer ${_appConfigs?.accessToken}"});
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
      final _response =
          await request(route: route, options: options, tokenRefreshing: true);
      handler.resolve(_response);
      return;
    }
    handler.next(error);
  }

  Future<void> refreshToken() async {
    RefreshTokenResponse? _tokenResponse;
    final _response = await NetworkExecutor.execute(
        route: UserClient.refresh(_appConfigs?.refreshToken),
        responseType: RefreshTokenResponse());
    _response.when(success: (tokenResponse) {
      Fimber.d('save new tokens to the storage');
      _tokenResponse = tokenResponse;
    }, failure: (networkError) {
      Fimber.e(networkError.toString());
    });
    if (_tokenResponse == null) {
      Fimber.e('refresh token is fail! => Navigate to the login screen.');
      Get.toNamed(AppLinks.login);
    } else {
      _appConfigs = _appConfigs?.copyWith(
              refreshToken: _tokenResponse?.refreshToken,
              accessToken: _tokenResponse?.accessToken) ??
          AppConfigurations(
              refreshToken: _tokenResponse?.refreshToken,
              accessToken: _tokenResponse?.accessToken);
      await _appConfigRepo.saveAppConfigurations(_appConfigs);
    }
  }
}
