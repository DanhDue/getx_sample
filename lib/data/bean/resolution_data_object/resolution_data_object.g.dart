// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resolution_data_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResolutionDataObject _$$_ResolutionDataObjectFromJson(Map<String, dynamic> json) =>
    _$_ResolutionDataObject(
      organization: json['organization'] as String?,
      docNumber: json['docNumber'] as String?,
      createdAt: json['createdAt'] as String?,
      resolution: json['resolution'] as String?,
      resolutionDes: json['resolutionDes'] as String?,
      author: json['author'] as String?,
      basises: (json['basises'] as List<dynamic>?)?.map((e) => e as String).toList(),
      resolutions: (json['resolutions'] as List<dynamic>?)?.map((e) => e as String).toList(),
      consumers: (json['consumers'] as List<dynamic>?)?.map((e) => e as String).toList(),
      delegate: json['delegate'] as String?,
    );

Map<String, dynamic> _$$_ResolutionDataObjectToJson(_$_ResolutionDataObject instance) =>
    <String, dynamic>{
      'organization': instance.organization,
      'docNumber': instance.docNumber,
      'createdAt': instance.createdAt,
      'resolution': instance.resolution,
      'resolutionDes': instance.resolutionDes,
      'author': instance.author,
      'basises': instance.basises,
      'resolutions': instance.resolutions,
      'consumers': instance.consumers,
      'delegate': instance.delegate,
    };
