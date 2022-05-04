import 'dart:io';

import 'package:dio/dio.dart';
import 'package:getx_sample/data/remote/network_options.dart';

import '../interfaces/base_client_generator.dart';

class NetworkCreator {
  static var shared = NetworkCreator();
  final Dio _client = Dio();

  Future<Response> request(
      {required BaseClientGenerator route, NetworkOptions? options}) {
    /// Add interceptor to refresh token.
    _client.interceptors.add(InterceptorsWrapper(
        onRequest: (options, _) => requestInterceptor(options),
        onError: (error, handler) async {
          if (error.response?.statusCode == 403 ||
              error.response?.statusCode == 401) {
            await refreshToken();
            request(route: route, options: options);
            return;
          }
          handler.next(error);
        }));

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

  Future<void> refreshToken() async {}

  dynamic requestInterceptor(RequestOptions options) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // var token = prefs.get("token");

    // options.headers.addAll({"Token": "$token${DateTime.now()}"});

    return options;
  }
}
