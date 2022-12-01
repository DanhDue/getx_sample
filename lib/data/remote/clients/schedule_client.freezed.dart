// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'schedule_client.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ScheduleClient {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() test,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? test,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? test,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Test value) test,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Test value)? test,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Test value)? test,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleClientCopyWith<$Res> {
  factory $ScheduleClientCopyWith(
          ScheduleClient value, $Res Function(ScheduleClient) then) =
      _$ScheduleClientCopyWithImpl<$Res, ScheduleClient>;
}

/// @nodoc
class _$ScheduleClientCopyWithImpl<$Res, $Val extends ScheduleClient>
    implements $ScheduleClientCopyWith<$Res> {
  _$ScheduleClientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_TestCopyWith<$Res> {
  factory _$$_TestCopyWith(_$_Test value, $Res Function(_$_Test) then) =
      __$$_TestCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_TestCopyWithImpl<$Res>
    extends _$ScheduleClientCopyWithImpl<$Res, _$_Test>
    implements _$$_TestCopyWith<$Res> {
  __$$_TestCopyWithImpl(_$_Test _value, $Res Function(_$_Test) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Test extends _Test {
  const _$_Test() : super._();

  @override
  String toString() {
    return 'ScheduleClient.test()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Test);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() test,
  }) {
    return test();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? test,
  }) {
    return test?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? test,
    required TResult orElse(),
  }) {
    if (test != null) {
      return test();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Test value) test,
  }) {
    return test(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Test value)? test,
  }) {
    return test?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Test value)? test,
    required TResult orElse(),
  }) {
    if (test != null) {
      return test(this);
    }
    return orElse();
  }
}

abstract class _Test extends ScheduleClient {
  const factory _Test() = _$_Test;
  const _Test._() : super._();
}
