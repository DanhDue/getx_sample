import 'package:freezed_annotation/freezed_annotation.dart';

import 'wallet_last_block.dart';

part 'wallet_delegate.freezed.dart';
part 'wallet_delegate.g.dart';

@freezed
class WalletDelegate with _$WalletDelegate {
  factory WalletDelegate({
    String? username,
    String? voteBalance,
    String? forgedFees,
    String? burnedFees,
    String? forgedRewards,
    int? producedBlocks,
    int? rank,
    int? round,
    String? version,
    @JsonKey(name: 'lastBlock') WalletLastBlock? walletLastBlock,
  }) = _WalletDelegate;

  factory WalletDelegate.fromJson(Map<String, dynamic> json) => _$WalletDelegateFromJson(json);
}
