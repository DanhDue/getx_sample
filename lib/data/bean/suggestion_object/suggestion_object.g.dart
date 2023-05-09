// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggestion_object.dart';

// **************************************************************************
// D3FBaseResponseJsonToTGenerator
// **************************************************************************

SuggestionObject? jsonToNullableSuggestionObject(Object? json) =>
    SuggestionObject.fromJson(json as Map<String, dynamic>);

SuggestionObject jsonToSuggestionObject(Object? json) =>
    SuggestionObject.fromJson(json as Map<String, dynamic>);

List<SuggestionObject?> jsonToListNullableSuggestionObjects(Object? json) =>
    List<Object>.from(json as List)
        .map((e) => SuggestionObject.fromJson(e as Map<String, dynamic>))
        .toList();

List<SuggestionObject> jsonToListSuggestionObjects(Object? json) => List<Object>.from(json as List)
    .map((e) => SuggestionObject.fromJson(e as Map<String, dynamic>))
    .toList();

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SuggestionObject _$$_SuggestionObjectFromJson(Map<String, dynamic> json) => _$_SuggestionObject(
      link: json['link'] as String?,
      id: json['id'] as String?,
      tieude: json['tieude'] as String?,
    );

Map<String, dynamic> _$$_SuggestionObjectToJson(_$_SuggestionObject instance) => <String, dynamic>{
      'link': instance.link,
      'id': instance.id,
      'tieude': instance.tieude,
    };
