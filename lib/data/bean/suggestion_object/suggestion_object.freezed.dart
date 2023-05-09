// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'suggestion_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SuggestionObject _$SuggestionObjectFromJson(Map<String, dynamic> json) {
  return _SuggestionObject.fromJson(json);
}

/// @nodoc
mixin _$SuggestionObject {
  String? get link => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get tieude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SuggestionObjectCopyWith<SuggestionObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestionObjectCopyWith<$Res> {
  factory $SuggestionObjectCopyWith(
          SuggestionObject value, $Res Function(SuggestionObject) then) =
      _$SuggestionObjectCopyWithImpl<$Res, SuggestionObject>;
  @useResult
  $Res call({String? link, String? id, String? tieude});
}

/// @nodoc
class _$SuggestionObjectCopyWithImpl<$Res, $Val extends SuggestionObject>
    implements $SuggestionObjectCopyWith<$Res> {
  _$SuggestionObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = freezed,
    Object? id = freezed,
    Object? tieude = freezed,
  }) {
    return _then(_value.copyWith(
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      tieude: freezed == tieude
          ? _value.tieude
          : tieude // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SuggestionObjectCopyWith<$Res>
    implements $SuggestionObjectCopyWith<$Res> {
  factory _$$_SuggestionObjectCopyWith(
          _$_SuggestionObject value, $Res Function(_$_SuggestionObject) then) =
      __$$_SuggestionObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? link, String? id, String? tieude});
}

/// @nodoc
class __$$_SuggestionObjectCopyWithImpl<$Res>
    extends _$SuggestionObjectCopyWithImpl<$Res, _$_SuggestionObject>
    implements _$$_SuggestionObjectCopyWith<$Res> {
  __$$_SuggestionObjectCopyWithImpl(
      _$_SuggestionObject _value, $Res Function(_$_SuggestionObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = freezed,
    Object? id = freezed,
    Object? tieude = freezed,
  }) {
    return _then(_$_SuggestionObject(
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      tieude: freezed == tieude
          ? _value.tieude
          : tieude // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SuggestionObject implements _SuggestionObject {
  _$_SuggestionObject({this.link, this.id, this.tieude});

  factory _$_SuggestionObject.fromJson(Map<String, dynamic> json) =>
      _$$_SuggestionObjectFromJson(json);

  @override
  final String? link;
  @override
  final String? id;
  @override
  final String? tieude;

  @override
  String toString() {
    return 'SuggestionObject(link: $link, id: $id, tieude: $tieude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SuggestionObject &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tieude, tieude) || other.tieude == tieude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, link, id, tieude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuggestionObjectCopyWith<_$_SuggestionObject> get copyWith =>
      __$$_SuggestionObjectCopyWithImpl<_$_SuggestionObject>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SuggestionObjectToJson(
      this,
    );
  }
}

abstract class _SuggestionObject implements SuggestionObject {
  factory _SuggestionObject(
      {final String? link,
      final String? id,
      final String? tieude}) = _$_SuggestionObject;

  factory _SuggestionObject.fromJson(Map<String, dynamic> json) =
      _$_SuggestionObject.fromJson;

  @override
  String? get link;
  @override
  String? get id;
  @override
  String? get tieude;
  @override
  @JsonKey(ignore: true)
  _$$_SuggestionObjectCopyWith<_$_SuggestionObject> get copyWith =>
      throw _privateConstructorUsedError;
}
