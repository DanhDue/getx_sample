// Copyright (c) 2023, one of the D3F outsourcing projects. All rights reserved.

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:getx_sample/data/local/storage_keys.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:location/location.dart';

part 'location_object.freezed.dart';
part 'location_object.g.dart';

@freezed
@HiveType(typeId: StorageKeys.locationHiveTypeId)
class LocationObject with _$LocationObject {
  factory LocationObject({
    @HiveField(0) double? latitude,
    @HiveField(1) double? longitude,
    @HiveField(2) double? accuracy,
    @HiveField(3) double? verticalAccuracy,
    @HiveField(4) double? altitude,
    @HiveField(5) double? speed,
    @HiveField(6) double? speedAccuracy,
    @HiveField(7) double? heading,
    @HiveField(8) double? time,
    @HiveField(9) bool? isMock,
    @HiveField(10) double? headingAccuracy,
    @HiveField(11) double? elapsedRealtimeNanos,
    @HiveField(12) double? elapsedRealtimeUncertaintyNanos,
    @HiveField(13) int? satelliteNumber,
    @HiveField(14) String? provider,
  }) = _LocationObject;

  factory LocationObject.fromJson(Map<String, dynamic> json) => _$LocationObjectFromJson(json);
}

extension LocationDataExt on LocationData {
  LocationObject? toLocalLocationObject() => LocationObject(
        latitude: latitude,
        longitude: longitude,
        accuracy: accuracy,
        verticalAccuracy: verticalAccuracy,
        altitude: altitude,
        speed: speed,
        speedAccuracy: speedAccuracy,
        heading: heading,
        time: time,
        isMock: isMock,
        headingAccuracy: headingAccuracy,
        elapsedRealtimeNanos: elapsedRealtimeNanos,
        elapsedRealtimeUncertaintyNanos: elapsedRealtimeUncertaintyNanos,
        satelliteNumber: satelliteNumber,
        provider: provider,
      );
}

extension LocationExt on LocationObject {
  LatLng? toLatLng() => LatLng(latitude ?? 0.0, longitude ?? 0.0);
}
