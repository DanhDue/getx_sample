// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'recent_activity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecentActivity _$RecentActivityFromJson(Map<String, dynamic> json) {
  return _RecentActivity.fromJson(json);
}

/// @nodoc
mixin _$RecentActivity {
  String? get title => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecentActivityCopyWith<RecentActivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentActivityCopyWith<$Res> {
  factory $RecentActivityCopyWith(
          RecentActivity value, $Res Function(RecentActivity) then) =
      _$RecentActivityCopyWithImpl<$Res, RecentActivity>;
  @useResult
  $Res call({String? title, String? icon, String? content});
}

/// @nodoc
class _$RecentActivityCopyWithImpl<$Res, $Val extends RecentActivity>
    implements $RecentActivityCopyWith<$Res> {
  _$RecentActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? icon = freezed,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecentActivityCopyWith<$Res>
    implements $RecentActivityCopyWith<$Res> {
  factory _$$_RecentActivityCopyWith(
          _$_RecentActivity value, $Res Function(_$_RecentActivity) then) =
      __$$_RecentActivityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, String? icon, String? content});
}

/// @nodoc
class __$$_RecentActivityCopyWithImpl<$Res>
    extends _$RecentActivityCopyWithImpl<$Res, _$_RecentActivity>
    implements _$$_RecentActivityCopyWith<$Res> {
  __$$_RecentActivityCopyWithImpl(
      _$_RecentActivity _value, $Res Function(_$_RecentActivity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? icon = freezed,
    Object? content = freezed,
  }) {
    return _then(_$_RecentActivity(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecentActivity implements _RecentActivity {
  _$_RecentActivity({this.title, this.icon, this.content});

  factory _$_RecentActivity.fromJson(Map<String, dynamic> json) =>
      _$$_RecentActivityFromJson(json);

  @override
  final String? title;
  @override
  final String? icon;
  @override
  final String? content;

  @override
  String toString() {
    return 'RecentActivity(title: $title, icon: $icon, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecentActivity &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, icon, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecentActivityCopyWith<_$_RecentActivity> get copyWith =>
      __$$_RecentActivityCopyWithImpl<_$_RecentActivity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecentActivityToJson(
      this,
    );
  }
}

abstract class _RecentActivity implements RecentActivity {
  factory _RecentActivity(
      {final String? title,
      final String? icon,
      final String? content}) = _$_RecentActivity;

  factory _RecentActivity.fromJson(Map<String, dynamic> json) =
      _$_RecentActivity.fromJson;

  @override
  String? get title;
  @override
  String? get icon;
  @override
  String? get content;
  @override
  @JsonKey(ignore: true)
  _$$_RecentActivityCopyWith<_$_RecentActivity> get copyWith =>
      throw _privateConstructorUsedError;
}
