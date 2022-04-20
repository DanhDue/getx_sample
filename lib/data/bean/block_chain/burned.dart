import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:getx_sample/data/local/storage_keys.dart';
import 'package:hive/hive.dart';

part 'burned.freezed.dart';

part 'burned.g.dart';

@freezed
@HiveType(typeId: StorageKeys.blockBurnedHiveTypeId)
class Burned with _$Burned {
  factory Burned({
    @HiveField(0) String? fees,
    @HiveField(1) String? transactions,
    @HiveField(2) String? total,
  }) = _Burned;

  factory Burned.fromJson(Map<String, dynamic> json) => _$BurnedFromJson(json);
}
