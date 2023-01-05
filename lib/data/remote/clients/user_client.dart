// Copyright (c) 2023, one of the D3F outsourcing projects. All rights reserved.

// coverage:ignore-file

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:getx_sample/app/environment_configurations.dart';
import 'package:getx_sample/data/bean/user_object/user_object.dart';
import 'package:getx_sample/data/remote/interfaces/base_client_generator.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

part 'user_client.freezed.dart';

@freezed
class UserClient extends BaseClientGenerator with _$UserClient {
  const UserClient._() : super();

  const factory UserClient.refreshToken(String? refreshToken) = _Refresh;
  const factory UserClient.updateInfo(UserObject? user) = _UpdateInfo;
  const factory UserClient.login(String? userName, String? password) = _Login;

  @override
  String get baseURL => EnvironmentConfig.BASE_URL;

  @override
  Map<String, dynamic> get header => {"Content-Type": "application/json"};

  @override
  String get method {
    return maybeWhen<String>(
      refreshToken: (String? refreshToken) => RequestMethods.post.name,
      login: (userName, password) => RequestMethods.post.name,
      orElse: () => RequestMethods.get.name,
    );
  }

  @override
  String get path {
    return maybeWhen<String>(
      refreshToken: (String? refreshToken) => 'user/refreshToken',
      orElse: () => 'user',
    );
  }

  @override
  Map<String, dynamic>? get queryParameters {
    return maybeWhen(
        login: (userName, password) => {'userName': userName, 'password': password},
        refreshToken: (String? refreshToken) => {'refreshToken': refreshToken},
        updateInfo: (user) => user?.toJson(),
        orElse: () => null);
  }

  @override
  Map<String, dynamic>? get body {
    return maybeWhen(orElse: () => null);
  }
}
