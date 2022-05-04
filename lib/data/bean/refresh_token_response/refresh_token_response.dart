import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:getx_sample/data/remote/interfaces/base_response_object.dart';

part 'refresh_token_response.freezed.dart';
part 'refresh_token_response.g.dart';

@freezed
class RefreshTokenResponse extends BaseResponseObject<RefreshTokenResponse> with _$RefreshTokenResponse {
  factory RefreshTokenResponse({
    @JsonKey(name: 'access_token') String? accessToken,
    @JsonKey(name: 'refresh_token') String? refreshToken,
    @JsonKey(name: 'token_type') String? tokenType,
    int? expires,
  }) = _RefreshTokenResponse;

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResponseFromJson(json);
}
