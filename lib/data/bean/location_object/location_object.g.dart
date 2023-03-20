// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocationObjectAdapter extends TypeAdapter<LocationObject> {
  @override
  final int typeId = 221;

  @override
  LocationObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocationObject(
      latitude: fields[0] as double?,
      longitude: fields[1] as double?,
      accuracy: fields[2] as double?,
      verticalAccuracy: fields[3] as double?,
      altitude: fields[4] as double?,
      speed: fields[5] as double?,
      speedAccuracy: fields[6] as double?,
      heading: fields[7] as double?,
      time: fields[8] as double?,
      isMock: fields[9] as bool?,
      headingAccuracy: fields[10] as double?,
      elapsedRealtimeNanos: fields[11] as double?,
      elapsedRealtimeUncertaintyNanos: fields[12] as double?,
      satelliteNumber: fields[13] as int?,
      provider: fields[14] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LocationObject obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.latitude)
      ..writeByte(1)
      ..write(obj.longitude)
      ..writeByte(2)
      ..write(obj.accuracy)
      ..writeByte(3)
      ..write(obj.verticalAccuracy)
      ..writeByte(4)
      ..write(obj.altitude)
      ..writeByte(5)
      ..write(obj.speed)
      ..writeByte(6)
      ..write(obj.speedAccuracy)
      ..writeByte(7)
      ..write(obj.heading)
      ..writeByte(8)
      ..write(obj.time)
      ..writeByte(9)
      ..write(obj.isMock)
      ..writeByte(10)
      ..write(obj.headingAccuracy)
      ..writeByte(11)
      ..write(obj.elapsedRealtimeNanos)
      ..writeByte(12)
      ..write(obj.elapsedRealtimeUncertaintyNanos)
      ..writeByte(13)
      ..write(obj.satelliteNumber)
      ..writeByte(14)
      ..write(obj.provider);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LocationObject _$$_LocationObjectFromJson(Map<String, dynamic> json) =>
    _$_LocationObject(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      accuracy: (json['accuracy'] as num?)?.toDouble(),
      verticalAccuracy: (json['verticalAccuracy'] as num?)?.toDouble(),
      altitude: (json['altitude'] as num?)?.toDouble(),
      speed: (json['speed'] as num?)?.toDouble(),
      speedAccuracy: (json['speedAccuracy'] as num?)?.toDouble(),
      heading: (json['heading'] as num?)?.toDouble(),
      time: (json['time'] as num?)?.toDouble(),
      isMock: json['isMock'] as bool?,
      headingAccuracy: (json['headingAccuracy'] as num?)?.toDouble(),
      elapsedRealtimeNanos: (json['elapsedRealtimeNanos'] as num?)?.toDouble(),
      elapsedRealtimeUncertaintyNanos:
          (json['elapsedRealtimeUncertaintyNanos'] as num?)?.toDouble(),
      satelliteNumber: json['satelliteNumber'] as int?,
      provider: json['provider'] as String?,
    );

Map<String, dynamic> _$$_LocationObjectToJson(_$_LocationObject instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'accuracy': instance.accuracy,
      'verticalAccuracy': instance.verticalAccuracy,
      'altitude': instance.altitude,
      'speed': instance.speed,
      'speedAccuracy': instance.speedAccuracy,
      'heading': instance.heading,
      'time': instance.time,
      'isMock': instance.isMock,
      'headingAccuracy': instance.headingAccuracy,
      'elapsedRealtimeNanos': instance.elapsedRealtimeNanos,
      'elapsedRealtimeUncertaintyNanos':
          instance.elapsedRealtimeUncertaintyNanos,
      'satelliteNumber': instance.satelliteNumber,
      'provider': instance.provider,
    };
