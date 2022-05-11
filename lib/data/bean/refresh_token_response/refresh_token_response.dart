import 'package:freezed_annotation/freezed_annotation.dart';

part 'refresh_token_response.freezed.dart';

part 'refresh_token_response.g.dart';

@freezed
class RefreshTokenResponse with _$RefreshTokenResponse {
  factory RefreshTokenResponse({
    @JsonKey(name: 'access_token') String? accessToken,
    @JsonKey(name: 'refresh_token') String? refreshToken,
    @JsonKey(name: 'token_type') String? tokenType,
    int? expires,
  }) = _RefreshTokenResponse;

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResponseFromJson(json);

  factory RefreshTokenResponse.fromJsonObject(Object? json) =>
      _$RefreshTokenResponseFromJson(json as Map<String, dynamic>);
}
