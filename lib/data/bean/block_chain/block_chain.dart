import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:getx_sample/data/local/storage_keys.dart';
import 'package:hive/hive.dart';

import 'block.dart';
import 'burned.dart';

part 'block_chain.freezed.dart';

part 'block_chain.g.dart';

@freezed
@HiveType(typeId: StorageKeys.blockChainHiveTypeId)
class BlockChain with _$BlockChain {
  factory BlockChain({
    @HiveField(0) Block? block,
    @HiveField(1) Burned? burned,
    @HiveField(2) String? supply,
  }) = _BlockChain;

  factory BlockChain.fromJson(Map<String, dynamic> json) =>
      _$BlockChainFromJson(json);

  factory BlockChain.fromJsonObject(Object? json) =>
      _$BlockChainFromJson(json as Map<String, dynamic>);
}
