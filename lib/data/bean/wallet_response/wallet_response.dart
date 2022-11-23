import 'package:freezed_annotation/freezed_annotation.dart';

import 'wallet_object.dart';

part 'wallet_response.freezed.dart';
part 'wallet_response.g.dart';

@freezed
class WalletResponse with _$WalletResponse {
  factory WalletResponse({
    @JsonKey(name: 'data') WalletObject? walletObject,
  }) = _WalletResponse;

  factory WalletResponse.fromJson(Map<String, dynamic> json) => _$WalletResponseFromJson(json);
}
