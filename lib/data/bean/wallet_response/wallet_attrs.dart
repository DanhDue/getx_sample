import 'package:freezed_annotation/freezed_annotation.dart';

import 'wallet_delegate.dart';

part 'wallet_attrs.freezed.dart';
part 'wallet_attrs.g.dart';

@freezed
class WalletAttrs with _$WalletAttrs {
  factory WalletAttrs({
    @JsonKey(name: 'delegate') WalletDelegate? walletDelegate,
    String? vote,
  }) = _WalletAttrs;

  factory WalletAttrs.fromJson(Map<String, dynamic> json) =>
      _$WalletAttrsFromJson(json);
}
