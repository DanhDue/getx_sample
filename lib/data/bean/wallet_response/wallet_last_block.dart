import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_last_block.freezed.dart';
part 'wallet_last_block.g.dart';

@freezed
class WalletLastBlock with _$WalletLastBlock {
  factory WalletLastBlock({
    int? version,
    int? timestamp,
    int? height,
    String? previousBlockHex,
    String? previousBlock,
    int? numberOfTransactions,
    String? totalAmount,
    String? totalFee,
    String? reward,
    int? payloadLength,
    String? payloadHash,
    String? generatorPublicKey,
    String? blockSignature,
    String? idHex,
    String? id,
    String? burnedFee,
  }) = _WalletLastBlock;

  factory WalletLastBlock.fromJson(Map<String, dynamic> json) =>
      _$WalletLastBlockFromJson(json);
}
