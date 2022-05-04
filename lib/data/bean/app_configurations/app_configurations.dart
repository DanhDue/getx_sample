import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:getx_sample/data/local/storage_keys.dart';
import 'package:hive/hive.dart';

part 'app_configurations.freezed.dart';
part 'app_configurations.g.dart';

@freezed
@HiveType(typeId: StorageKeys.appConfigurationHiveTypeId)
class AppConfigurations with _$AppConfigurations {
  factory AppConfigurations({
    @HiveField(0) int? latestSyncedTime,
    @HiveField(1) bool? walletNotification,
    @HiveField(2) bool? rankNotification,
    @HiveField(3) bool? blockNotification,
    @HiveField(4) String? accessToken,
    @HiveField(5) String? refreshToken,
  }) = _AppConfigurations;

  factory AppConfigurations.fromJson(Map<String, dynamic> json) =>
      _$AppConfigurationsFromJson(json);
}
