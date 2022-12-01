import 'package:getx_sample/data/bean/user_object/user_object.dart';
import 'package:getx_sample/data/local/storage_keys.dart';
import 'package:getx_sample/data/remote/clients/user_client.dart';
import 'package:getx_sample/data/remote/interfaces/base_response_object.dart';
import 'package:getx_sample/data/remote/layers/network_executor.dart';
import 'package:getx_sample/data/remote/wrappers/network_error.dart';
import 'package:getx_sample/data/remote/wrappers/result.dart';
import 'package:getx_sample/data/repositories/user_repository.dart';
import 'package:hive/hive.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Future<void> saveUserInfo(UserObject? userObject) async {
    if (userObject == null) return;
    final box = await Hive.openBox<UserObject>(StorageKeys.userBoxName);
    box.put(StorageKeys.userKey, userObject);
  }

  @override
  Future<UserObject?> retrieveUserInfo() async {
    final box = await Hive.openBox<UserObject>(StorageKeys.userBoxName);
    return box.get(StorageKeys.userKey);
  }

  @override
  Future<UserPermission?> retrieveUserPermission() async {
    final userObject = await retrieveUserInfo();
    if (userObject?.role == UserPermission.student.value) return UserPermission.student;
    if (userObject?.role == UserPermission.parent.value) return UserPermission.parent;
    // default teacher
    return UserPermission.teacher;
  }

  @override
  Future<void> toggleBiometricLogin(bool? enable) async {
    var userObject = await retrieveUserInfo();
    saveUserInfo(userObject?.copyWith(biometricAuth: enable) ?? UserObject(biometricAuth: enable));
  }

  @override
  Future<Result<BaseResponseObject<UserObject?>, NetworkError>> login(
      String? userName, String? password) {
    return NetworkExecutor.execute<BaseResponseObject<UserObject?>,
            BaseResponseObject<UserObject?>>(
        route: UserClient.login(userName, password),
        responseType: const BaseResponseObject<UserObject?>());
  }
}
