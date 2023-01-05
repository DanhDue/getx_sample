// Copyright (c) 2023, one of the D3F outsourcing projects. All rights reserved.

// coverage:ignore-file

// ignore_for_file: depend_on_referenced_packages

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
    @HiveField(4) String? accessToken,
    @HiveField(5) String? refreshToken,
    @HiveField(6) String? baseUrl,
  }) = _AppConfigurations;

  factory AppConfigurations.fromJson(Map<String, dynamic> json) =>
      _$AppConfigurationsFromJson(json);
}
