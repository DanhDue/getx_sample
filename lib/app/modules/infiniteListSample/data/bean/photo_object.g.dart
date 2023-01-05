// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_object.dart';

// **************************************************************************
// D3FBaseResponseJsonToTGenerator
// **************************************************************************

PhotoObject? jsonToNullablePhotoObject(Object? json) =>
    PhotoObject.fromJson(json as Map<String, dynamic>);

PhotoObject jsonToPhotoObject(Object? json) => PhotoObject.fromJson(json as Map<String, dynamic>);

List<PhotoObject?> jsonToListNullablePhotoObjects(Object? json) => List<Object>.from(json as List)
    .map((e) => PhotoObject.fromJson(e as Map<String, dynamic>))
    .toList();

List<PhotoObject> jsonToListPhotoObjects(Object? json) => List<Object>.from(json as List)
    .map((e) => PhotoObject.fromJson(e as Map<String, dynamic>))
    .toList();

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PhotoObject _$$_PhotoObjectFromJson(Map<String, dynamic> json) => _$_PhotoObject(
      albumId: json['albumId'] as int?,
      id: json['id'] as int?,
      title: json['title'] as String?,
      url: json['url'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      color: const ColorJsonConverter().fromJson(json['color'] as String?),
    );

Map<String, dynamic> _$$_PhotoObjectToJson(_$_PhotoObject instance) => <String, dynamic>{
      'albumId': instance.albumId,
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
      'color': const ColorJsonConverter().toJson(instance.color),
    };
