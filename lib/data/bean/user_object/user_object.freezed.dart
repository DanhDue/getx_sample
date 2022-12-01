// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserObject _$UserObjectFromJson(Map<String, dynamic> json) {
  return _UserObject.fromJson(json);
}

/// @nodoc
mixin _$UserObject {
  @HiveField(0)
  String? get iduser => throw _privateConstructorUsedError;
  @HiveField(1)
  int? get role => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get username => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get fullname => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get birthday => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get phone => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get email => throw _privateConstructorUsedError;
  @HiveField(7)
  String? get ccid => throw _privateConstructorUsedError;
  @HiveField(8)
  @JsonKey(name: 'access_token')
  String? get accessToken => throw _privateConstructorUsedError;
  @HiveField(9)
  @JsonKey(name: 'expires_in')
  String? get expiresIn => throw _privateConstructorUsedError;
  @HiveField(10)
  @JsonKey(name: 'token_type')
  String? get tokenType => throw _privateConstructorUsedError;
  @HiveField(11)
  @JsonKey(name: 'refresh_token')
  String? get refreshToken => throw _privateConstructorUsedError;
  @HiveField(12)
  String? get scope => throw _privateConstructorUsedError;
  @HiveField(13)
  bool? get biometricAuth => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserObjectCopyWith<UserObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserObjectCopyWith<$Res> {
  factory $UserObjectCopyWith(
          UserObject value, $Res Function(UserObject) then) =
      _$UserObjectCopyWithImpl<$Res, UserObject>;
  @useResult
  $Res call(
      {@HiveField(0) String? iduser,
      @HiveField(1) int? role,
      @HiveField(2) String? username,
      @HiveField(3) String? fullname,
      @HiveField(4) String? birthday,
      @HiveField(5) String? phone,
      @HiveField(6) String? email,
      @HiveField(7) String? ccid,
      @HiveField(8) @JsonKey(name: 'access_token') String? accessToken,
      @HiveField(9) @JsonKey(name: 'expires_in') String? expiresIn,
      @HiveField(10) @JsonKey(name: 'token_type') String? tokenType,
      @HiveField(11) @JsonKey(name: 'refresh_token') String? refreshToken,
      @HiveField(12) String? scope,
      @HiveField(13) bool? biometricAuth});
}

/// @nodoc
class _$UserObjectCopyWithImpl<$Res, $Val extends UserObject>
    implements $UserObjectCopyWith<$Res> {
  _$UserObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iduser = freezed,
    Object? role = freezed,
    Object? username = freezed,
    Object? fullname = freezed,
    Object? birthday = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? ccid = freezed,
    Object? accessToken = freezed,
    Object? expiresIn = freezed,
    Object? tokenType = freezed,
    Object? refreshToken = freezed,
    Object? scope = freezed,
    Object? biometricAuth = freezed,
  }) {
    return _then(_value.copyWith(
      iduser: freezed == iduser
          ? _value.iduser
          : iduser // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      fullname: freezed == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      ccid: freezed == ccid
          ? _value.ccid
          : ccid // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresIn: freezed == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenType: freezed == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      scope: freezed == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String?,
      biometricAuth: freezed == biometricAuth
          ? _value.biometricAuth
          : biometricAuth // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserObjectCopyWith<$Res>
    implements $UserObjectCopyWith<$Res> {
  factory _$$_UserObjectCopyWith(
          _$_UserObject value, $Res Function(_$_UserObject) then) =
      __$$_UserObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String? iduser,
      @HiveField(1) int? role,
      @HiveField(2) String? username,
      @HiveField(3) String? fullname,
      @HiveField(4) String? birthday,
      @HiveField(5) String? phone,
      @HiveField(6) String? email,
      @HiveField(7) String? ccid,
      @HiveField(8) @JsonKey(name: 'access_token') String? accessToken,
      @HiveField(9) @JsonKey(name: 'expires_in') String? expiresIn,
      @HiveField(10) @JsonKey(name: 'token_type') String? tokenType,
      @HiveField(11) @JsonKey(name: 'refresh_token') String? refreshToken,
      @HiveField(12) String? scope,
      @HiveField(13) bool? biometricAuth});
}

/// @nodoc
class __$$_UserObjectCopyWithImpl<$Res>
    extends _$UserObjectCopyWithImpl<$Res, _$_UserObject>
    implements _$$_UserObjectCopyWith<$Res> {
  __$$_UserObjectCopyWithImpl(
      _$_UserObject _value, $Res Function(_$_UserObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iduser = freezed,
    Object? role = freezed,
    Object? username = freezed,
    Object? fullname = freezed,
    Object? birthday = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? ccid = freezed,
    Object? accessToken = freezed,
    Object? expiresIn = freezed,
    Object? tokenType = freezed,
    Object? refreshToken = freezed,
    Object? scope = freezed,
    Object? biometricAuth = freezed,
  }) {
    return _then(_$_UserObject(
      iduser: freezed == iduser
          ? _value.iduser
          : iduser // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      fullname: freezed == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      ccid: freezed == ccid
          ? _value.ccid
          : ccid // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresIn: freezed == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenType: freezed == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      scope: freezed == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String?,
      biometricAuth: freezed == biometricAuth
          ? _value.biometricAuth
          : biometricAuth // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserObject implements _UserObject {
  _$_UserObject(
      {@HiveField(0) this.iduser,
      @HiveField(1) this.role,
      @HiveField(2) this.username,
      @HiveField(3) this.fullname,
      @HiveField(4) this.birthday,
      @HiveField(5) this.phone,
      @HiveField(6) this.email,
      @HiveField(7) this.ccid,
      @HiveField(8) @JsonKey(name: 'access_token') this.accessToken,
      @HiveField(9) @JsonKey(name: 'expires_in') this.expiresIn,
      @HiveField(10) @JsonKey(name: 'token_type') this.tokenType,
      @HiveField(11) @JsonKey(name: 'refresh_token') this.refreshToken,
      @HiveField(12) this.scope,
      @HiveField(13) this.biometricAuth});

  factory _$_UserObject.fromJson(Map<String, dynamic> json) =>
      _$$_UserObjectFromJson(json);

  @override
  @HiveField(0)
  final String? iduser;
  @override
  @HiveField(1)
  final int? role;
  @override
  @HiveField(2)
  final String? username;
  @override
  @HiveField(3)
  final String? fullname;
  @override
  @HiveField(4)
  final String? birthday;
  @override
  @HiveField(5)
  final String? phone;
  @override
  @HiveField(6)
  final String? email;
  @override
  @HiveField(7)
  final String? ccid;
  @override
  @HiveField(8)
  @JsonKey(name: 'access_token')
  final String? accessToken;
  @override
  @HiveField(9)
  @JsonKey(name: 'expires_in')
  final String? expiresIn;
  @override
  @HiveField(10)
  @JsonKey(name: 'token_type')
  final String? tokenType;
  @override
  @HiveField(11)
  @JsonKey(name: 'refresh_token')
  final String? refreshToken;
  @override
  @HiveField(12)
  final String? scope;
  @override
  @HiveField(13)
  final bool? biometricAuth;

  @override
  String toString() {
    return 'UserObject(iduser: $iduser, role: $role, username: $username, fullname: $fullname, birthday: $birthday, phone: $phone, email: $email, ccid: $ccid, accessToken: $accessToken, expiresIn: $expiresIn, tokenType: $tokenType, refreshToken: $refreshToken, scope: $scope, biometricAuth: $biometricAuth)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserObject &&
            (identical(other.iduser, iduser) || other.iduser == iduser) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.fullname, fullname) ||
                other.fullname == fullname) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.ccid, ccid) || other.ccid == ccid) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.scope, scope) || other.scope == scope) &&
            (identical(other.biometricAuth, biometricAuth) ||
                other.biometricAuth == biometricAuth));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      iduser,
      role,
      username,
      fullname,
      birthday,
      phone,
      email,
      ccid,
      accessToken,
      expiresIn,
      tokenType,
      refreshToken,
      scope,
      biometricAuth);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserObjectCopyWith<_$_UserObject> get copyWith =>
      __$$_UserObjectCopyWithImpl<_$_UserObject>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserObjectToJson(
      this,
    );
  }
}

abstract class _UserObject implements UserObject {
  factory _UserObject(
      {@HiveField(0) final String? iduser,
      @HiveField(1) final int? role,
      @HiveField(2) final String? username,
      @HiveField(3) final String? fullname,
      @HiveField(4) final String? birthday,
      @HiveField(5) final String? phone,
      @HiveField(6) final String? email,
      @HiveField(7) final String? ccid,
      @HiveField(8) @JsonKey(name: 'access_token') final String? accessToken,
      @HiveField(9) @JsonKey(name: 'expires_in') final String? expiresIn,
      @HiveField(10) @JsonKey(name: 'token_type') final String? tokenType,
      @HiveField(11) @JsonKey(name: 'refresh_token') final String? refreshToken,
      @HiveField(12) final String? scope,
      @HiveField(13) final bool? biometricAuth}) = _$_UserObject;

  factory _UserObject.fromJson(Map<String, dynamic> json) =
      _$_UserObject.fromJson;

  @override
  @HiveField(0)
  String? get iduser;
  @override
  @HiveField(1)
  int? get role;
  @override
  @HiveField(2)
  String? get username;
  @override
  @HiveField(3)
  String? get fullname;
  @override
  @HiveField(4)
  String? get birthday;
  @override
  @HiveField(5)
  String? get phone;
  @override
  @HiveField(6)
  String? get email;
  @override
  @HiveField(7)
  String? get ccid;
  @override
  @HiveField(8)
  @JsonKey(name: 'access_token')
  String? get accessToken;
  @override
  @HiveField(9)
  @JsonKey(name: 'expires_in')
  String? get expiresIn;
  @override
  @HiveField(10)
  @JsonKey(name: 'token_type')
  String? get tokenType;
  @override
  @HiveField(11)
  @JsonKey(name: 'refresh_token')
  String? get refreshToken;
  @override
  @HiveField(12)
  String? get scope;
  @override
  @HiveField(13)
  bool? get biometricAuth;
  @override
  @JsonKey(ignore: true)
  _$$_UserObjectCopyWith<_$_UserObject> get copyWith =>
      throw _privateConstructorUsedError;
}
