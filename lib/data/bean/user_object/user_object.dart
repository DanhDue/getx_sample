// Copyright (c) 2023, one of the D3F outsourcing projects. All rights reserved.

// coverage:ignore-file

import 'package:annotations/annotations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:getx_sample/data/local/storage_keys.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jiffy/jiffy.dart';

part 'user_object.freezed.dart';
part 'user_object.g.dart';

@freezed
@HiveType(typeId: StorageKeys.userHiveTypeId)
@genJsonToThisOne
class UserObject with _$UserObject {
  factory UserObject({
    @HiveField(0) String? iduser,
    @HiveField(1) int? role,
    @HiveField(2) String? username,
    @HiveField(3) String? sex,
    @HiveField(4) String? fullname,
    @HiveField(5) String? birthday,
    @HiveField(6) String? phone,
    @HiveField(7) String? email,
    @HiveField(8) String? ccid,
    @HiveField(9) @JsonKey(name: 'access_token') String? accessToken,
    @HiveField(10) @JsonKey(name: 'expires_in') String? expiresIn,
    @HiveField(11) @JsonKey(name: 'token_type') String? tokenType,
    @HiveField(12) String? scope,
    @HiveField(13) String? hedaotao,
    @HiveField(14) String? khoa,
    @HiveField(15) String? nganh,
    @HiveField(16) String? nienkhoa,
    @HiveField(17) String? hocham,
    @HiveField(18) String? namphonghocham,
    @HiveField(19) String? linhvucnghiencuu,
    @HiveField(20) String? chucdanhnghiencuu,
    @HiveField(21) bool? biometricAuth,
    @HiveField(22) String? avatar,
    @HiveField(23) String? password,
  }) = _UserObject;

  factory UserObject.fromJson(Map<String, dynamic> json) => _$UserObjectFromJson(json);
}

enum UserPermission { none, parent, student, teacher }

extension UserPermissionExt on UserPermission {
  int get value {
    switch (this) {
      case UserPermission.teacher:
        return 1;
      case UserPermission.student:
        return 2;
      case UserPermission.parent:
        return 3;
      default: // default UserPermission.none
        return 0;
    }
  }
}

extension UserExtension on UserObject {
  UserPermission retrievePermission() {
    if (role == UserPermission.parent.value) return UserPermission.parent;
    if (role == UserPermission.teacher.value) return UserPermission.teacher;
    if (role == UserPermission.student.value) return UserPermission.student;
    return UserPermission.none;
  }
}
