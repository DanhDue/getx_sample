// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'photo_client.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PhotoClient {
  int? get pageNumber => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? pageNumber) loadPhotos,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? pageNumber)? loadPhotos,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? pageNumber)? loadPhotos,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadPhotos value) loadPhotos,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadPhotos value)? loadPhotos,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadPhotos value)? loadPhotos,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PhotoClientCopyWith<PhotoClient> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoClientCopyWith<$Res> {
  factory $PhotoClientCopyWith(PhotoClient value, $Res Function(PhotoClient) then) =
      _$PhotoClientCopyWithImpl<$Res, PhotoClient>;
  @useResult
  $Res call({int? pageNumber});
}

/// @nodoc
class _$PhotoClientCopyWithImpl<$Res, $Val extends PhotoClient>
    implements $PhotoClientCopyWith<$Res> {
  _$PhotoClientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageNumber = freezed,
  }) {
    return _then(_value.copyWith(
      pageNumber: freezed == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoadPhotosCopyWith<$Res> implements $PhotoClientCopyWith<$Res> {
  factory _$$_LoadPhotosCopyWith(_$_LoadPhotos value, $Res Function(_$_LoadPhotos) then) =
      __$$_LoadPhotosCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? pageNumber});
}

/// @nodoc
class __$$_LoadPhotosCopyWithImpl<$Res> extends _$PhotoClientCopyWithImpl<$Res, _$_LoadPhotos>
    implements _$$_LoadPhotosCopyWith<$Res> {
  __$$_LoadPhotosCopyWithImpl(_$_LoadPhotos _value, $Res Function(_$_LoadPhotos) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageNumber = freezed,
  }) {
    return _then(_$_LoadPhotos(
      freezed == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_LoadPhotos extends _LoadPhotos {
  _$_LoadPhotos(this.pageNumber) : super._();

  @override
  final int? pageNumber;

  @override
  String toString() {
    return 'PhotoClient.loadPhotos(pageNumber: $pageNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadPhotos &&
            (identical(other.pageNumber, pageNumber) || other.pageNumber == pageNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadPhotosCopyWith<_$_LoadPhotos> get copyWith =>
      __$$_LoadPhotosCopyWithImpl<_$_LoadPhotos>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? pageNumber) loadPhotos,
  }) {
    return loadPhotos(pageNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? pageNumber)? loadPhotos,
  }) {
    return loadPhotos?.call(pageNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? pageNumber)? loadPhotos,
    required TResult orElse(),
  }) {
    if (loadPhotos != null) {
      return loadPhotos(pageNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadPhotos value) loadPhotos,
  }) {
    return loadPhotos(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadPhotos value)? loadPhotos,
  }) {
    return loadPhotos?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadPhotos value)? loadPhotos,
    required TResult orElse(),
  }) {
    if (loadPhotos != null) {
      return loadPhotos(this);
    }
    return orElse();
  }
}

abstract class _LoadPhotos extends PhotoClient {
  factory _LoadPhotos(final int? pageNumber) = _$_LoadPhotos;
  _LoadPhotos._() : super._();

  @override
  int? get pageNumber;
  @override
  @JsonKey(ignore: true)
  _$$_LoadPhotosCopyWith<_$_LoadPhotos> get copyWith => throw _privateConstructorUsedError;
}
