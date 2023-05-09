// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auto_gen_text_response_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AutoGenTextResponseObject _$AutoGenTextResponseObjectFromJson(
    Map<String, dynamic> json) {
  return _AutoGenTextResponseObject.fromJson(json);
}

/// @nodoc
mixin _$AutoGenTextResponseObject {
  String? get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AutoGenTextResponseObjectCopyWith<AutoGenTextResponseObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AutoGenTextResponseObjectCopyWith<$Res> {
  factory $AutoGenTextResponseObjectCopyWith(AutoGenTextResponseObject value,
          $Res Function(AutoGenTextResponseObject) then) =
      _$AutoGenTextResponseObjectCopyWithImpl<$Res, AutoGenTextResponseObject>;
  @useResult
  $Res call({String? result});
}

/// @nodoc
class _$AutoGenTextResponseObjectCopyWithImpl<$Res,
        $Val extends AutoGenTextResponseObject>
    implements $AutoGenTextResponseObjectCopyWith<$Res> {
  _$AutoGenTextResponseObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = freezed,
  }) {
    return _then(_value.copyWith(
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AutoGenTextResponseObjectCopyWith<$Res>
    implements $AutoGenTextResponseObjectCopyWith<$Res> {
  factory _$$_AutoGenTextResponseObjectCopyWith(
          _$_AutoGenTextResponseObject value,
          $Res Function(_$_AutoGenTextResponseObject) then) =
      __$$_AutoGenTextResponseObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? result});
}

/// @nodoc
class __$$_AutoGenTextResponseObjectCopyWithImpl<$Res>
    extends _$AutoGenTextResponseObjectCopyWithImpl<$Res,
        _$_AutoGenTextResponseObject>
    implements _$$_AutoGenTextResponseObjectCopyWith<$Res> {
  __$$_AutoGenTextResponseObjectCopyWithImpl(
      _$_AutoGenTextResponseObject _value,
      $Res Function(_$_AutoGenTextResponseObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = freezed,
  }) {
    return _then(_$_AutoGenTextResponseObject(
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AutoGenTextResponseObject implements _AutoGenTextResponseObject {
  _$_AutoGenTextResponseObject({this.result});

  factory _$_AutoGenTextResponseObject.fromJson(Map<String, dynamic> json) =>
      _$$_AutoGenTextResponseObjectFromJson(json);

  @override
  final String? result;

  @override
  String toString() {
    return 'AutoGenTextResponseObject(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AutoGenTextResponseObject &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AutoGenTextResponseObjectCopyWith<_$_AutoGenTextResponseObject>
      get copyWith => __$$_AutoGenTextResponseObjectCopyWithImpl<
          _$_AutoGenTextResponseObject>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AutoGenTextResponseObjectToJson(
      this,
    );
  }
}

abstract class _AutoGenTextResponseObject implements AutoGenTextResponseObject {
  factory _AutoGenTextResponseObject({final String? result}) =
      _$_AutoGenTextResponseObject;

  factory _AutoGenTextResponseObject.fromJson(Map<String, dynamic> json) =
      _$_AutoGenTextResponseObject.fromJson;

  @override
  String? get result;
  @override
  @JsonKey(ignore: true)
  _$$_AutoGenTextResponseObjectCopyWith<_$_AutoGenTextResponseObject>
      get copyWith => throw _privateConstructorUsedError;
}
