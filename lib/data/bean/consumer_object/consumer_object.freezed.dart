// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'consumer_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConsumerObject _$ConsumerObjectFromJson(Map<String, dynamic> json) {
  return _ConsumerObject.fromJson(json);
}

/// @nodoc
mixin _$ConsumerObject {
  int? get index => throw _privateConstructorUsedError;
  String? get consumer => throw _privateConstructorUsedError;
  @TextEditingControllerJsonConverter()
  TextEditingController? get editTextController => throw _privateConstructorUsedError;
  @FocusNodeJsonConverter()
  FocusNode? get focusNode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsumerObjectCopyWith<ConsumerObject> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsumerObjectCopyWith<$Res> {
  factory $ConsumerObjectCopyWith(ConsumerObject value, $Res Function(ConsumerObject) then) =
      _$ConsumerObjectCopyWithImpl<$Res, ConsumerObject>;
  @useResult
  $Res call(
      {int? index,
      String? consumer,
      @TextEditingControllerJsonConverter() TextEditingController? editTextController,
      @FocusNodeJsonConverter() FocusNode? focusNode});
}

/// @nodoc
class _$ConsumerObjectCopyWithImpl<$Res, $Val extends ConsumerObject>
    implements $ConsumerObjectCopyWith<$Res> {
  _$ConsumerObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = freezed,
    Object? consumer = freezed,
    Object? editTextController = freezed,
    Object? focusNode = freezed,
  }) {
    return _then(_value.copyWith(
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      consumer: freezed == consumer
          ? _value.consumer
          : consumer // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_ConsumerObjectCopyWith<$Res> implements $ConsumerObjectCopyWith<$Res> {
  factory _$$_ConsumerObjectCopyWith(
          _$_ConsumerObject value, $Res Function(_$_ConsumerObject) then) =
      __$$_ConsumerObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? index,
      String? consumer,
      @TextEditingControllerJsonConverter() TextEditingController? editTextController,
      @FocusNodeJsonConverter() FocusNode? focusNode});
}

/// @nodoc
class __$$_ConsumerObjectCopyWithImpl<$Res>
    extends _$ConsumerObjectCopyWithImpl<$Res, _$_ConsumerObject>
    implements _$$_ConsumerObjectCopyWith<$Res> {
  __$$_ConsumerObjectCopyWithImpl(_$_ConsumerObject _value, $Res Function(_$_ConsumerObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = freezed,
    Object? consumer = freezed,
    Object? editTextController = freezed,
    Object? focusNode = freezed,
  }) {
    return _then(_$_ConsumerObject(
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      consumer: freezed == consumer
          ? _value.consumer
          : consumer // ignore: cast_nullable_to_non_nullable
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
class _$_ConsumerObject implements _ConsumerObject {
  _$_ConsumerObject(
      {this.index,
      this.consumer,
      @TextEditingControllerJsonConverter() this.editTextController,
      @FocusNodeJsonConverter() this.focusNode});

  factory _$_ConsumerObject.fromJson(Map<String, dynamic> json) =>
      _$$_ConsumerObjectFromJson(json);

  @override
  final int? index;
  @override
  final String? consumer;
  @override
  @TextEditingControllerJsonConverter()
  final TextEditingController? editTextController;
  @override
  @FocusNodeJsonConverter()
  final FocusNode? focusNode;

  @override
  String toString() {
    return 'ConsumerObject(index: $index, consumer: $consumer, editTextController: $editTextController, focusNode: $focusNode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConsumerObject &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.consumer, consumer) || other.consumer == consumer) &&
            (identical(other.editTextController, editTextController) ||
                other.editTextController == editTextController) &&
            (identical(other.focusNode, focusNode) || other.focusNode == focusNode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, index, consumer, editTextController, focusNode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConsumerObjectCopyWith<_$_ConsumerObject> get copyWith =>
      __$$_ConsumerObjectCopyWithImpl<_$_ConsumerObject>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConsumerObjectToJson(
      this,
    );
  }
}

abstract class _ConsumerObject implements ConsumerObject {
  factory _ConsumerObject(
      {final int? index,
      final String? consumer,
      @TextEditingControllerJsonConverter() final TextEditingController? editTextController,
      @FocusNodeJsonConverter() final FocusNode? focusNode}) = _$_ConsumerObject;

  factory _ConsumerObject.fromJson(Map<String, dynamic> json) = _$_ConsumerObject.fromJson;

  @override
  int? get index;
  @override
  String? get consumer;
  @override
  @TextEditingControllerJsonConverter()
  TextEditingController? get editTextController;
  @override
  @FocusNodeJsonConverter()
  FocusNode? get focusNode;
  @override
  @JsonKey(ignore: true)
  _$$_ConsumerObjectCopyWith<_$_ConsumerObject> get copyWith => throw _privateConstructorUsedError;
}
