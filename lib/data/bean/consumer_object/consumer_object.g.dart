// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consumer_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ConsumerObject _$$_ConsumerObjectFromJson(Map<String, dynamic> json) =>
    _$_ConsumerObject(
      index: json['index'] as int?,
      consumer: json['consumer'] as String?,
      editTextController: const TextEditingControllerJsonConverter()
          .fromJson(json['editTextController'] as String?),
      focusNode:
          const FocusNodeJsonConverter().fromJson(json['focusNode'] as String?),
    );

Map<String, dynamic> _$$_ConsumerObjectToJson(_$_ConsumerObject instance) =>
    <String, dynamic>{
      'index': instance.index,
      'consumer': instance.consumer,
      'editTextController': const TextEditingControllerJsonConverter()
          .toJson(instance.editTextController),
      'focusNode': const FocusNodeJsonConverter().toJson(instance.focusNode),
    };
