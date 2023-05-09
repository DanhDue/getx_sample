// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auto_gen_text_response_object.dart';

// **************************************************************************
// D3FBaseResponseJsonToTGenerator
// **************************************************************************

AutoGenTextResponseObject? jsonToNullableAutoGenTextResponseObject(
        Object? json) =>
    AutoGenTextResponseObject.fromJson(json as Map<String, dynamic>);

AutoGenTextResponseObject jsonToAutoGenTextResponseObject(Object? json) =>
    AutoGenTextResponseObject.fromJson(json as Map<String, dynamic>);

List<AutoGenTextResponseObject?> jsonToListNullableAutoGenTextResponseObjects(
        Object? json) =>
    List<Object>.from(json as List)
        .map((e) =>
            AutoGenTextResponseObject.fromJson(e as Map<String, dynamic>))
        .toList();

List<AutoGenTextResponseObject> jsonToListAutoGenTextResponseObjects(
        Object? json) =>
    List<Object>.from(json as List)
        .map((e) =>
            AutoGenTextResponseObject.fromJson(e as Map<String, dynamic>))
        .toList();

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AutoGenTextResponseObject _$$_AutoGenTextResponseObjectFromJson(
        Map<String, dynamic> json) =>
    _$_AutoGenTextResponseObject(
      result: json['result'] as String?,
    );

Map<String, dynamic> _$$_AutoGenTextResponseObjectToJson(
        _$_AutoGenTextResponseObject instance) =>
    <String, dynamic>{
      'result': instance.result,
    };
