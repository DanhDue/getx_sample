// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resolution_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResolutionObject _$$_ResolutionObjectFromJson(Map<String, dynamic> json) =>
    _$_ResolutionObject(
      index: json['index'] as int?,
      resolution: json['resolution'] as String?,
      editTextController: const TextEditingControllerJsonConverter()
          .fromJson(json['editTextController'] as String?),
      focusNode:
          const FocusNodeJsonConverter().fromJson(json['focusNode'] as String?),
    );

Map<String, dynamic> _$$_ResolutionObjectToJson(_$_ResolutionObject instance) =>
    <String, dynamic>{
      'index': instance.index,
      'resolution': instance.resolution,
      'editTextController': const TextEditingControllerJsonConverter()
          .toJson(instance.editTextController),
      'focusNode': const FocusNodeJsonConverter().toJson(instance.focusNode),
    };
