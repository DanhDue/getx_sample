// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_object.dart';

// **************************************************************************
// D3FBaseResponseJsonToTGenerator
// **************************************************************************

UserObject? jsonToNullableUserObject(Object? json) =>
    UserObject.fromJson(json as Map<String, dynamic>);

UserObject jsonToUserObject(Object? json) =>
    UserObject.fromJson(json as Map<String, dynamic>);

List<UserObject?> jsonToListNullableUserObjects(Object? json) =>
    List<Object>.from(json as List)
        .map((e) => UserObject.fromJson(e as Map<String, dynamic>))
        .toList();

List<UserObject> jsonToListUserObjects(Object? json) =>
    List<Object>.from(json as List)
        .map((e) => UserObject.fromJson(e as Map<String, dynamic>))
        .toList();

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserObjectAdapter extends TypeAdapter<UserObject> {
  @override
  final int typeId = 1;

  @override
  UserObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserObject(
      iduser: fields[0] as String?,
      role: fields[1] as int?,
      username: fields[2] as String?,
      fullname: fields[3] as String?,
      birthday: fields[4] as String?,
      phone: fields[5] as String?,
      email: fields[6] as String?,
      ccid: fields[7] as String?,
      accessToken: fields[8] as String?,
      expiresIn: fields[9] as String?,
      tokenType: fields[10] as String?,
      refreshToken: fields[11] as String?,
      scope: fields[12] as String?,
      biometricAuth: fields[13] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, UserObject obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.iduser)
      ..writeByte(1)
      ..write(obj.role)
      ..writeByte(2)
      ..write(obj.username)
      ..writeByte(3)
      ..write(obj.fullname)
      ..writeByte(4)
      ..write(obj.birthday)
      ..writeByte(5)
      ..write(obj.phone)
      ..writeByte(6)
      ..write(obj.email)
      ..writeByte(7)
      ..write(obj.ccid)
      ..writeByte(8)
      ..write(obj.accessToken)
      ..writeByte(9)
      ..write(obj.expiresIn)
      ..writeByte(10)
      ..write(obj.tokenType)
      ..writeByte(11)
      ..write(obj.refreshToken)
      ..writeByte(12)
      ..write(obj.scope)
      ..writeByte(13)
      ..write(obj.biometricAuth);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserObject _$$_UserObjectFromJson(Map<String, dynamic> json) =>
    _$_UserObject(
      iduser: json['iduser'] as String?,
      role: json['role'] as int?,
      username: json['username'] as String?,
      fullname: json['fullname'] as String?,
      birthday: json['birthday'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      ccid: json['ccid'] as String?,
      accessToken: json['access_token'] as String?,
      expiresIn: json['expires_in'] as String?,
      tokenType: json['token_type'] as String?,
      refreshToken: json['refresh_token'] as String?,
      scope: json['scope'] as String?,
      biometricAuth: json['biometricAuth'] as bool?,
    );

Map<String, dynamic> _$$_UserObjectToJson(_$_UserObject instance) =>
    <String, dynamic>{
      'iduser': instance.iduser,
      'role': instance.role,
      'username': instance.username,
      'fullname': instance.fullname,
      'birthday': instance.birthday,
      'phone': instance.phone,
      'email': instance.email,
      'ccid': instance.ccid,
      'access_token': instance.accessToken,
      'expires_in': instance.expiresIn,
      'token_type': instance.tokenType,
      'refresh_token': instance.refreshToken,
      'scope': instance.scope,
      'biometricAuth': instance.biometricAuth,
    };
