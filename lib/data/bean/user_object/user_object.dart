import 'package:annotations/annotations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:getx_sample/data/local/storage_keys.dart';
import 'package:hive/hive.dart';

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
    @HiveField(13) bool? biometricAuth,
  }) = _UserObject;

  factory UserObject.fromJson(Map<String, dynamic> json) => _$UserObjectFromJson(json);
}

enum UserPermission { parent, student, teacher }

extension UserPermissionExt on UserPermission {
  int get value {
    switch (this) {
      case UserPermission.student:
        return 2;
      case UserPermission.parent:
        return 3;
      default: // default UserPermission.teacher
        return 1;
    }
  }
}
