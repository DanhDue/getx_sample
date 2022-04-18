import 'package:freezed_annotation/freezed_annotation.dart';

import 'block.dart';
import 'burned.dart';

part 'block_chain.freezed.dart';
part 'block_chain.g.dart';

@freezed
class BlockChain with _$BlockChain {
  factory BlockChain({
    Block? block,
    Burned? burned,
    String? supply,
  }) = _BlockChain;

  factory BlockChain.fromJson(Map<String, dynamic> json) =>
      _$BlockChainFromJson(json);
}
