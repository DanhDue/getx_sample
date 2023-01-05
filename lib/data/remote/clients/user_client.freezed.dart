// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_client.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserClient {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? refreshToken) refreshToken,
    required TResult Function(UserObject? user) updateInfo,
    required TResult Function(String? userName, String? password) login,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? refreshToken)? refreshToken,
    TResult? Function(UserObject? user)? updateInfo,
    TResult? Function(String? userName, String? password)? login,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? refreshToken)? refreshToken,
    TResult Function(UserObject? user)? updateInfo,
    TResult Function(String? userName, String? password)? login,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Refresh value) refreshToken,
    required TResult Function(_UpdateInfo value) updateInfo,
    required TResult Function(_Login value) login,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Refresh value)? refreshToken,
    TResult? Function(_UpdateInfo value)? updateInfo,
    TResult? Function(_Login value)? login,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Refresh value)? refreshToken,
    TResult Function(_UpdateInfo value)? updateInfo,
    TResult Function(_Login value)? login,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserClientCopyWith<$Res> {
  factory $UserClientCopyWith(UserClient value, $Res Function(UserClient) then) =
      _$UserClientCopyWithImpl<$Res, UserClient>;
}

/// @nodoc
class _$UserClientCopyWithImpl<$Res, $Val extends UserClient>
    implements $UserClientCopyWith<$Res> {
  _$UserClientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_RefreshCopyWith<$Res> {
  factory _$$_RefreshCopyWith(_$_Refresh value, $Res Function(_$_Refresh) then) =
      __$$_RefreshCopyWithImpl<$Res>;
  @useResult
  $Res call({String? refreshToken});
}

/// @nodoc
class __$$_RefreshCopyWithImpl<$Res> extends _$UserClientCopyWithImpl<$Res, _$_Refresh>
    implements _$$_RefreshCopyWith<$Res> {
  __$$_RefreshCopyWithImpl(_$_Refresh _value, $Res Function(_$_Refresh) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refreshToken = freezed,
  }) {
    return _then(_$_Refresh(
      freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Refresh extends _Refresh {
  const _$_Refresh(this.refreshToken) : super._();

  @override
  final String? refreshToken;

  @override
  String toString() {
    return 'UserClient.refreshToken(refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Refresh &&
            (identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, refreshToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RefreshCopyWith<_$_Refresh> get copyWith =>
      __$$_RefreshCopyWithImpl<_$_Refresh>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? refreshToken) refreshToken,
    required TResult Function(UserObject? user) updateInfo,
    required TResult Function(String? userName, String? password) login,
  }) {
    return refreshToken(this.refreshToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? refreshToken)? refreshToken,
    TResult? Function(UserObject? user)? updateInfo,
    TResult? Function(String? userName, String? password)? login,
  }) {
    return refreshToken?.call(this.refreshToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? refreshToken)? refreshToken,
    TResult Function(UserObject? user)? updateInfo,
    TResult Function(String? userName, String? password)? login,
    required TResult orElse(),
  }) {
    if (refreshToken != null) {
      return refreshToken(this.refreshToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Refresh value) refreshToken,
    required TResult Function(_UpdateInfo value) updateInfo,
    required TResult Function(_Login value) login,
  }) {
    return refreshToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Refresh value)? refreshToken,
    TResult? Function(_UpdateInfo value)? updateInfo,
    TResult? Function(_Login value)? login,
  }) {
    return refreshToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Refresh value)? refreshToken,
    TResult Function(_UpdateInfo value)? updateInfo,
    TResult Function(_Login value)? login,
    required TResult orElse(),
  }) {
    if (refreshToken != null) {
      return refreshToken(this);
    }
    return orElse();
  }
}

abstract class _Refresh extends UserClient {
  const factory _Refresh(final String? refreshToken) = _$_Refresh;
  const _Refresh._() : super._();

  String? get refreshToken;
  @JsonKey(ignore: true)
  _$$_RefreshCopyWith<_$_Refresh> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateInfoCopyWith<$Res> {
  factory _$$_UpdateInfoCopyWith(_$_UpdateInfo value, $Res Function(_$_UpdateInfo) then) =
      __$$_UpdateInfoCopyWithImpl<$Res>;
  @useResult
  $Res call({UserObject? user});

  $UserObjectCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_UpdateInfoCopyWithImpl<$Res> extends _$UserClientCopyWithImpl<$Res, _$_UpdateInfo>
    implements _$$_UpdateInfoCopyWith<$Res> {
  __$$_UpdateInfoCopyWithImpl(_$_UpdateInfo _value, $Res Function(_$_UpdateInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$_UpdateInfo(
      freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserObject?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserObjectCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserObjectCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$_UpdateInfo extends _UpdateInfo {
  const _$_UpdateInfo(this.user) : super._();

  @override
  final UserObject? user;

  @override
  String toString() {
    return 'UserClient.updateInfo(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateInfo &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateInfoCopyWith<_$_UpdateInfo> get copyWith =>
      __$$_UpdateInfoCopyWithImpl<_$_UpdateInfo>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? refreshToken) refreshToken,
    required TResult Function(UserObject? user) updateInfo,
    required TResult Function(String? userName, String? password) login,
  }) {
    return updateInfo(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? refreshToken)? refreshToken,
    TResult? Function(UserObject? user)? updateInfo,
    TResult? Function(String? userName, String? password)? login,
  }) {
    return updateInfo?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? refreshToken)? refreshToken,
    TResult Function(UserObject? user)? updateInfo,
    TResult Function(String? userName, String? password)? login,
    required TResult orElse(),
  }) {
    if (updateInfo != null) {
      return updateInfo(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Refresh value) refreshToken,
    required TResult Function(_UpdateInfo value) updateInfo,
    required TResult Function(_Login value) login,
  }) {
    return updateInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Refresh value)? refreshToken,
    TResult? Function(_UpdateInfo value)? updateInfo,
    TResult? Function(_Login value)? login,
  }) {
    return updateInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Refresh value)? refreshToken,
    TResult Function(_UpdateInfo value)? updateInfo,
    TResult Function(_Login value)? login,
    required TResult orElse(),
  }) {
    if (updateInfo != null) {
      return updateInfo(this);
    }
    return orElse();
  }
}

abstract class _UpdateInfo extends UserClient {
  const factory _UpdateInfo(final UserObject? user) = _$_UpdateInfo;
  const _UpdateInfo._() : super._();

  UserObject? get user;
  @JsonKey(ignore: true)
  _$$_UpdateInfoCopyWith<_$_UpdateInfo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoginCopyWith<$Res> {
  factory _$$_LoginCopyWith(_$_Login value, $Res Function(_$_Login) then) =
      __$$_LoginCopyWithImpl<$Res>;
  @useResult
  $Res call({String? userName, String? password});
}

/// @nodoc
class __$$_LoginCopyWithImpl<$Res> extends _$UserClientCopyWithImpl<$Res, _$_Login>
    implements _$$_LoginCopyWith<$Res> {
  __$$_LoginCopyWithImpl(_$_Login _value, $Res Function(_$_Login) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = freezed,
    Object? password = freezed,
  }) {
    return _then(_$_Login(
      freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Login extends _Login {
  const _$_Login(this.userName, this.password) : super._();

  @override
  final String? userName;
  @override
  final String? password;

  @override
  String toString() {
    return 'UserClient.login(userName: $userName, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Login &&
            (identical(other.userName, userName) || other.userName == userName) &&
            (identical(other.password, password) || other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userName, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginCopyWith<_$_Login> get copyWith => __$$_LoginCopyWithImpl<_$_Login>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? refreshToken) refreshToken,
    required TResult Function(UserObject? user) updateInfo,
    required TResult Function(String? userName, String? password) login,
  }) {
    return login(userName, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? refreshToken)? refreshToken,
    TResult? Function(UserObject? user)? updateInfo,
    TResult? Function(String? userName, String? password)? login,
  }) {
    return login?.call(userName, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? refreshToken)? refreshToken,
    TResult Function(UserObject? user)? updateInfo,
    TResult Function(String? userName, String? password)? login,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(userName, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Refresh value) refreshToken,
    required TResult Function(_UpdateInfo value) updateInfo,
    required TResult Function(_Login value) login,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Refresh value)? refreshToken,
    TResult? Function(_UpdateInfo value)? updateInfo,
    TResult? Function(_Login value)? login,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Refresh value)? refreshToken,
    TResult Function(_UpdateInfo value)? updateInfo,
    TResult Function(_Login value)? login,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class _Login extends UserClient {
  const factory _Login(final String? userName, final String? password) = _$_Login;
  const _Login._() : super._();

  String? get userName;
  String? get password;
  @JsonKey(ignore: true)
  _$$_LoginCopyWith<_$_Login> get copyWith => throw _privateConstructorUsedError;
}
