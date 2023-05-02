// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'basis_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BasisObject _$BasisObjectFromJson(Map<String, dynamic> json) {
  return _BasisObject.fromJson(json);
}

/// @nodoc
mixin _$BasisObject {
  int? get index => throw _privateConstructorUsedError;
  String? get basis => throw _privateConstructorUsedError;
  @TextEditingControllerJsonConverter()
  TextEditingController? get editTextController => throw _privateConstructorUsedError;
  @FocusNodeJsonConverter()
  FocusNode? get focusNode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BasisObjectCopyWith<BasisObject> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasisObjectCopyWith<$Res> {
  factory $BasisObjectCopyWith(BasisObject value, $Res Function(BasisObject) then) =
      _$BasisObjectCopyWithImpl<$Res, BasisObject>;
  @useResult
  $Res call(
      {int? index,
      String? basis,
      @TextEditingControllerJsonConverter() TextEditingController? editTextController,
      @FocusNodeJsonConverter() FocusNode? focusNode});
}

/// @nodoc
class _$BasisObjectCopyWithImpl<$Res, $Val extends BasisObject>
    implements $BasisObjectCopyWith<$Res> {
  _$BasisObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = freezed,
    Object? basis = freezed,
    Object? editTextController = freezed,
    Object? focusNode = freezed,
  }) {
    return _then(_value.copyWith(
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      basis: freezed == basis
          ? _value.basis
          : basis // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_BasisObjectCopyWith<$Res> implements $BasisObjectCopyWith<$Res> {
  factory _$$_BasisObjectCopyWith(_$_BasisObject value, $Res Function(_$_BasisObject) then) =
      __$$_BasisObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? index,
      String? basis,
      @TextEditingControllerJsonConverter() TextEditingController? editTextController,
      @FocusNodeJsonConverter() FocusNode? focusNode});
}

/// @nodoc
class __$$_BasisObjectCopyWithImpl<$Res> extends _$BasisObjectCopyWithImpl<$Res, _$_BasisObject>
    implements _$$_BasisObjectCopyWith<$Res> {
  __$$_BasisObjectCopyWithImpl(_$_BasisObject _value, $Res Function(_$_BasisObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = freezed,
    Object? basis = freezed,
    Object? editTextController = freezed,
    Object? focusNode = freezed,
  }) {
    return _then(_$_BasisObject(
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      basis: freezed == basis
          ? _value.basis
          : basis // ignore: cast_nullable_to_non_nullable
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
class _$_BasisObject implements _BasisObject {
  _$_BasisObject(
      {this.index,
      this.basis,
      @TextEditingControllerJsonConverter() this.editTextController,
      @FocusNodeJsonConverter() this.focusNode});

  factory _$_BasisObject.fromJson(Map<String, dynamic> json) => _$$_BasisObjectFromJson(json);

  @override
  final int? index;
  @override
  final String? basis;
  @override
  @TextEditingControllerJsonConverter()
  final TextEditingController? editTextController;
  @override
  @FocusNodeJsonConverter()
  final FocusNode? focusNode;

  @override
  String toString() {
    return 'BasisObject(index: $index, basis: $basis, editTextController: $editTextController, focusNode: $focusNode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BasisObject &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.basis, basis) || other.basis == basis) &&
            (identical(other.editTextController, editTextController) ||
                other.editTextController == editTextController) &&
            (identical(other.focusNode, focusNode) || other.focusNode == focusNode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, index, basis, editTextController, focusNode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BasisObjectCopyWith<_$_BasisObject> get copyWith =>
      __$$_BasisObjectCopyWithImpl<_$_BasisObject>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BasisObjectToJson(
      this,
    );
  }
}

abstract class _BasisObject implements BasisObject {
  factory _BasisObject(
      {final int? index,
      final String? basis,
      @TextEditingControllerJsonConverter() final TextEditingController? editTextController,
      @FocusNodeJsonConverter() final FocusNode? focusNode}) = _$_BasisObject;

  factory _BasisObject.fromJson(Map<String, dynamic> json) = _$_BasisObject.fromJson;

  @override
  int? get index;
  @override
  String? get basis;
  @override
  @TextEditingControllerJsonConverter()
  TextEditingController? get editTextController;
  @override
  @FocusNodeJsonConverter()
  FocusNode? get focusNode;
  @override
  @JsonKey(ignore: true)
  _$$_BasisObjectCopyWith<_$_BasisObject> get copyWith => throw _privateConstructorUsedError;
}
