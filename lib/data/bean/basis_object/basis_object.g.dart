// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basis_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BasisObject _$$_BasisObjectFromJson(Map<String, dynamic> json) =>
    _$_BasisObject(
      index: json['index'] as int?,
      basis: json['basis'] as String?,
      editTextController: const TextEditingControllerJsonConverter()
          .fromJson(json['editTextController'] as String?),
      focusNode:
          const FocusNodeJsonConverter().fromJson(json['focusNode'] as String?),
    );

Map<String, dynamic> _$$_BasisObjectToJson(_$_BasisObject instance) =>
    <String, dynamic>{
      'index': instance.index,
      'basis': instance.basis,
      'editTextController': const TextEditingControllerJsonConverter()
          .toJson(instance.editTextController),
      'focusNode': const FocusNodeJsonConverter().toJson(instance.focusNode),
    };
