import 'package:freezed_annotation/freezed_annotation.dart';

import '../interfaces/base_client_generator.dart';

part 'user_client.freezed.dart';

@freezed
class UserClient extends BaseClientGenerator with _$UserClient {
  const UserClient._() : super();

  const factory UserClient.refresh(String? refreshToken) = _Refresh;

  @override
  String get baseURL => 'https://api.danhdue.com/api/v1/user/';

  @override
  Map<String, dynamic> get header => {"Content-Type": "application/json"};

  @override
  String get method {
    return maybeWhen<String>(
      refresh: (String? refreshToken) => 'POST',
      orElse: () => 'GET',
    );
  }

  @override
  String get path {
    return when<String>(
      refresh: (String? refreshToken) => 'refresh/',
    );
  }

  @override
  Map<String, dynamic>? get queryParameters {
    return maybeWhen(
        refresh: (String? refreshToken) => {'refreshToken': refreshToken},
        orElse: () {
          return null;
        });
  }

  @override
  Map<String, dynamic>? get body {
    return maybeWhen(
      orElse: () {
        return null;
      },
    );
  }
}
