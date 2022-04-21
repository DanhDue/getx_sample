import 'package:freezed_annotation/freezed_annotation.dart';

import 'wallet_attrs.dart';

part 'wallet_object.freezed.dart';
part 'wallet_object.g.dart';

@freezed
class WalletObject with _$WalletObject {
  factory WalletObject({
    String? address,
    String? publicKey,
    String? balance,
    String? nonce,
    @JsonKey(name: 'attributes') WalletAttrs? walletAttrs,
  }) = _WalletObject;

  factory WalletObject.fromJson(Map<String, dynamic> json) =>
      _$WalletObjectFromJson(json);
}
