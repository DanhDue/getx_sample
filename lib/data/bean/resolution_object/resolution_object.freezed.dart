// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'resolution_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResolutionObject _$ResolutionObjectFromJson(Map<String, dynamic> json) {
  return _ResolutionObject.fromJson(json);
}

/// @nodoc
mixin _$ResolutionObject {
  int? get index => throw _privateConstructorUsedError;
  String? get resolution => throw _privateConstructorUsedError;
  @TextEditingControllerJsonConverter()
  TextEditingController? get editTextController =>
      throw _privateConstructorUsedError;
  @FocusNodeJsonConverter()
  FocusNode? get focusNode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResolutionObjectCopyWith<ResolutionObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResolutionObjectCopyWith<$Res> {
  factory $ResolutionObjectCopyWith(
          ResolutionObject value, $Res Function(ResolutionObject) then) =
      _$ResolutionObjectCopyWithImpl<$Res, ResolutionObject>;
  @useResult
  $Res call(
      {int? index,
      String? resolution,
      @TextEditingControllerJsonConverter()
          TextEditingController? editTextController,
      @FocusNodeJsonConverter()
          FocusNode? focusNode});
}

/// @nodoc
class _$ResolutionObjectCopyWithImpl<$Res, $Val extends ResolutionObject>
    implements $ResolutionObjectCopyWith<$Res> {
  _$ResolutionObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = freezed,
    Object? resolution = freezed,
    Object? editTextController = freezed,
    Object? focusNode = freezed,
  }) {
    return _then(_value.copyWith(
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      resolution: freezed == resolution
          ? _value.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as String?,
      editTextController: freezed == editTextController
          ? _value.editTextController
          : editTextController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      focusNode: freezed == focusNode
          ? _value.focusNode
          : focusNode // ignore: cast_nullable_to_non_nullable
              as FocusNode?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResolutionObjectCopyWith<$Res>
    implements $ResolutionObjectCopyWith<$Res> {
  factory _$$_ResolutionObjectCopyWith(
          _$_ResolutionObject value, $Res Function(_$_ResolutionObject) then) =
      __$$_ResolutionObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? index,
      String? resolution,
      @TextEditingControllerJsonConverter()
          TextEditingController? editTextController,
      @FocusNodeJsonConverter()
          FocusNode? focusNode});
}

/// @nodoc
class __$$_ResolutionObjectCopyWithImpl<$Res>
    extends _$ResolutionObjectCopyWithImpl<$Res, _$_ResolutionObject>
    implements _$$_ResolutionObjectCopyWith<$Res> {
  __$$_ResolutionObjectCopyWithImpl(
      _$_ResolutionObject _value, $Res Function(_$_ResolutionObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = freezed,
    Object? resolution = freezed,
    Object? editTextController = freezed,
    Object? focusNode = freezed,
  }) {
    return _then(_$_ResolutionObject(
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      resolution: freezed == resolution
          ? _value.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as String?,
      editTextController: freezed == editTextController
          ? _value.editTextController
          : editTextController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      focusNode: freezed == focusNode
          ? _value.focusNode
          : focusNode // ignore: cast_nullable_to_non_nullable
              as FocusNode?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResolutionObject implements _ResolutionObject {
  _$_ResolutionObject(
      {this.index,
      this.resolution,
      @TextEditingControllerJsonConverter() this.editTextController,
      @FocusNodeJsonConverter() this.focusNode});

  factory _$_ResolutionObject.fromJson(Map<String, dynamic> json) =>
      _$$_ResolutionObjectFromJson(json);

  @override
  final int? index;
  @override
  final String? resolution;
  @override
  @TextEditingControllerJsonConverter()
  final TextEditingController? editTextController;
  @override
  @FocusNodeJsonConverter()
  final FocusNode? focusNode;

  @override
  String toString() {
    return 'ResolutionObject(index: $index, resolution: $resolution, editTextController: $editTextController, focusNode: $focusNode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResolutionObject &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.resolution, resolution) ||
                other.resolution == resolution) &&
            (identical(other.editTextController, editTextController) ||
                other.editTextController == editTextController) &&
            (identical(other.focusNode, focusNode) ||
                other.focusNode == focusNode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, index, resolution, editTextController, focusNode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResolutionObjectCopyWith<_$_ResolutionObject> get copyWith =>
      __$$_ResolutionObjectCopyWithImpl<_$_ResolutionObject>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResolutionObjectToJson(
      this,
    );
  }
}

abstract class _ResolutionObject implements ResolutionObject {
  factory _ResolutionObject(
      {final int? index,
      final String? resolution,
      @TextEditingControllerJsonConverter()
          final TextEditingController? editTextController,
      @FocusNodeJsonConverter()
          final FocusNode? focusNode}) = _$_ResolutionObject;

  factory _ResolutionObject.fromJson(Map<String, dynamic> json) =
      _$_ResolutionObject.fromJson;

  @override
  int? get index;
  @override
  String? get resolution;
  @override
  @TextEditingControllerJsonConverter()
  TextEditingController? get editTextController;
  @override
  @FocusNodeJsonConverter()
  FocusNode? get focusNode;
  @override
  @JsonKey(ignore: true)
  _$$_ResolutionObjectCopyWith<_$_ResolutionObject> get copyWith =>
      throw _privateConstructorUsedError;
}
