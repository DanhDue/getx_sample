// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_configurations.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppConfigurationsAdapter extends TypeAdapter<AppConfigurations> {
  @override
  final int typeId = 0;

  @override
  AppConfigurations read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppConfigurations(
      latestSyncedTime: fields[0] as int?,
      accessToken: fields[4] as String?,
      refreshToken: fields[5] as String?,
      baseUrl: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AppConfigurations obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.latestSyncedTime)
      ..writeByte(4)
      ..write(obj.accessToken)
      ..writeByte(5)
      ..write(obj.refreshToken)
      ..writeByte(6)
      ..write(obj.baseUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppConfigurationsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppConfigurations _$$_AppConfigurationsFromJson(Map<String, dynamic> json) =>
    _$_AppConfigurations(
      latestSyncedTime: json['latestSyncedTime'] as int?,
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      baseUrl: json['baseUrl'] as String?,
    );

Map<String, dynamic> _$$_AppConfigurationsToJson(_$_AppConfigurations instance) =>
    <String, dynamic>{
      'latestSyncedTime': instance.latestSyncedTime,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'baseUrl': instance.baseUrl,
    };
