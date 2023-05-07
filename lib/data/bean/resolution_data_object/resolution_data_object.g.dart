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
      basises: (json['basises'] as List<dynamic>?)
          ?.map((e) => e == null ? null : BasisObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      resolve: json['resolve'] as String?,
      resolveDescription: json['resolveDescription'] as String?,
      resolutions: (json['resolutions'] as List<dynamic>?)
          ?.map((e) => e == null ? null : ResolutionObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      consumers: (json['consumers'] as List<dynamic>?)
          ?.map((e) => e == null ? null : ConsumerObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      rightPositionOfDelegate: json['rightPositionOfDelegate'] as String?,
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
      'resolve': instance.resolve,
      'resolveDescription': instance.resolveDescription,
      'resolutions': instance.resolutions,
      'consumers': instance.consumers,
      'rightPositionOfDelegate': instance.rightPositionOfDelegate,
      'delegate': instance.delegate,
    };
