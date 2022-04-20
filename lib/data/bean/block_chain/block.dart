import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:getx_sample/data/local/storage_keys.dart';
import 'package:hive/hive.dart';

part 'block.freezed.dart';

part 'block.g.dart';

@freezed
@HiveType(typeId: StorageKeys.blockHiveTypeId)
class Block with _$Block {
  factory Block({
    @HiveField(0) int? height,
    @HiveField(1) String? id,
  }) = _Block;

  factory Block.fromJson(Map<String, dynamic> json) => _$BlockFromJson(json);
}
