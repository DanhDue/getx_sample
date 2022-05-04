import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fimber/fimber.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getx_sample/app/routes/links.dart';
import 'package:getx_sample/data/bean/refresh_token_response/refresh_token_response.dart';
import 'package:getx_sample/data/remote/clients/user_client.dart';
import 'package:getx_sample/data/remote/layers/network_executor.dart';
import 'package:getx_sample/data/remote/network_options.dart';
import 'package:getx_sample/data/repositories/app_configurations_repository.dart';

import '../interfaces/base_client_generator.dart';

class NetworkCreator {
  static var shared = NetworkCreator();
  final Dio _client = Dio();
  final _appConfigRepo = Get.find<AppConfigurationsRepository>();

  Future<Response> request(
      {required BaseClientGenerator route, NetworkOptions? options}) {
    /// Add interceptor to refresh token: START !!!.
    _client.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) =>
          requestInterceptor(options: options, handler: handler),
      onError: (error, handler) => refreshTokenInterceptor(
          error: error, handler: handler, route: route, options: options),
    ));

    /// Add interceptor to refresh token: END !!!.
    return _client.fetch(RequestOptions(
        baseUrl: route.baseURL,
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
    final _appConfigs = await _appConfigRepo.retrieveAppConfigurations();
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
      request(route: route, options: options);
      return;
    }
    handler.next(error);
  }

  Future<void> refreshToken() async {
    final _appConfigs = await _appConfigRepo.retrieveAppConfigurations();
    final _response = await NetworkExecutor.execute(
        route: UserClient.refresh(_appConfigs?.refreshToken),
        responseType: RefreshTokenResponse());
    _response.when(success: (tokenResponse) {
      Fimber.d('save new tokens to the storage');
      _appConfigRepo.saveAppConfigurations(_appConfigs?.copyWith(
          refreshToken: (tokenResponse as RefreshTokenResponse?)?.refreshToken,
          accessToken: tokenResponse?.accessToken));
    }, failure: (networkError) {
      Fimber.e(networkError.toString());
      Fimber.e('refresh token is fail! => Navigate to the login screen.');
      Get.toNamed(AppLinks.tokenIsExpired);
    });
  }
}
