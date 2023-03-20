// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_object.dart';

// **************************************************************************
// D3FBaseResponseJsonToTGenerator
// **************************************************************************

UserObject? jsonToNullableUserObject(Object? json) =>
    UserObject.fromJson(json as Map<String, dynamic>);

UserObject jsonToUserObject(Object? json) => UserObject.fromJson(json as Map<String, dynamic>);

List<UserObject?> jsonToListNullableUserObjects(Object? json) => List<Object>.from(json as List)
    .map((e) => UserObject.fromJson(e as Map<String, dynamic>))
    .toList();

List<UserObject> jsonToListUserObjects(Object? json) => List<Object>.from(json as List)
    .map((e) => UserObject.fromJson(e as Map<String, dynamic>))
    .toList();

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserObjectAdapter extends TypeAdapter<UserObject> {
  @override
  final int typeId = 222;

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
      sex: fields[3] as String?,
      fullname: fields[4] as String?,
      birthday: fields[5] as String?,
      phone: fields[6] as String?,
      email: fields[7] as String?,
      ccid: fields[8] as String?,
      accessToken: fields[9] as String?,
      expiresIn: fields[10] as String?,
      tokenType: fields[11] as String?,
      scope: fields[12] as String?,
      hedaotao: fields[13] as String?,
      khoa: fields[14] as String?,
      nganh: fields[15] as String?,
      nienkhoa: fields[16] as String?,
      hocham: fields[17] as String?,
      namphonghocham: fields[18] as String?,
      linhvucnghiencuu: fields[19] as String?,
      chucdanhnghiencuu: fields[20] as String?,
      biometricAuth: fields[21] as bool?,
      avatar: fields[22] as String?,
      password: fields[23] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserObject obj) {
    writer
      ..writeByte(24)
      ..writeByte(0)
      ..write(obj.iduser)
      ..writeByte(1)
      ..write(obj.role)
      ..writeByte(2)
      ..write(obj.username)
      ..writeByte(3)
      ..write(obj.sex)
      ..writeByte(4)
      ..write(obj.fullname)
      ..writeByte(5)
      ..write(obj.birthday)
      ..writeByte(6)
      ..write(obj.phone)
      ..writeByte(7)
      ..write(obj.email)
      ..writeByte(8)
      ..write(obj.ccid)
      ..writeByte(9)
      ..write(obj.accessToken)
      ..writeByte(10)
      ..write(obj.expiresIn)
      ..writeByte(11)
      ..write(obj.tokenType)
      ..writeByte(12)
      ..write(obj.scope)
      ..writeByte(13)
      ..write(obj.hedaotao)
      ..writeByte(14)
      ..write(obj.khoa)
      ..writeByte(15)
      ..write(obj.nganh)
      ..writeByte(16)
      ..write(obj.nienkhoa)
      ..writeByte(17)
      ..write(obj.hocham)
      ..writeByte(18)
      ..write(obj.namphonghocham)
      ..writeByte(19)
      ..write(obj.linhvucnghiencuu)
      ..writeByte(20)
      ..write(obj.chucdanhnghiencuu)
      ..writeByte(21)
      ..write(obj.biometricAuth)
      ..writeByte(22)
      ..write(obj.avatar)
      ..writeByte(23)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserObjectAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserObject _$$_UserObjectFromJson(Map<String, dynamic> json) => _$_UserObject(
      iduser: json['iduser'] as String?,
      role: json['role'] as int?,
      username: json['username'] as String?,
      sex: json['sex'] as String?,
      fullname: json['fullname'] as String?,
      birthday: json['birthday'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      ccid: json['ccid'] as String?,
      accessToken: json['access_token'] as String?,
      expiresIn: json['expires_in'] as String?,
      tokenType: json['token_type'] as String?,
      scope: json['scope'] as String?,
      hedaotao: json['hedaotao'] as String?,
      khoa: json['khoa'] as String?,
      nganh: json['nganh'] as String?,
      nienkhoa: json['nienkhoa'] as String?,
      hocham: json['hocham'] as String?,
      namphonghocham: json['namphonghocham'] as String?,
      linhvucnghiencuu: json['linhvucnghiencuu'] as String?,
      chucdanhnghiencuu: json['chucdanhnghiencuu'] as String?,
      biometricAuth: json['biometricAuth'] as bool?,
      avatar: json['avatar'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$$_UserObjectToJson(_$_UserObject instance) => <String, dynamic>{
      'iduser': instance.iduser,
      'role': instance.role,
      'username': instance.username,
      'sex': instance.sex,
      'fullname': instance.fullname,
      'birthday': instance.birthday,
      'phone': instance.phone,
      'email': instance.email,
      'ccid': instance.ccid,
      'access_token': instance.accessToken,
      'expires_in': instance.expiresIn,
      'token_type': instance.tokenType,
      'scope': instance.scope,
      'hedaotao': instance.hedaotao,
      'khoa': instance.khoa,
      'nganh': instance.nganh,
      'nienkhoa': instance.nienkhoa,
      'hocham': instance.hocham,
      'namphonghocham': instance.namphonghocham,
      'linhvucnghiencuu': instance.linhvucnghiencuu,
      'chucdanhnghiencuu': instance.chucdanhnghiencuu,
      'biometricAuth': instance.biometricAuth,
      'avatar': instance.avatar,
      'password': instance.password,
    };
