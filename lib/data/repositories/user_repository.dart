import 'package:getx_sample/data/bean/user_object/user_object.dart';
import 'package:getx_sample/data/remote/interfaces/base_response_object.dart';
import 'package:getx_sample/data/remote/wrappers/network_error.dart';
import 'package:getx_sample/data/remote/wrappers/result.dart';

abstract class UserRepository {
  Future<void> saveUserInfo(UserObject? userObject);
  Future<UserObject?> retrieveUserInfo();
  Future<UserPermission?> retrieveUserPermission();
  Future<void> toggleBiometricLogin(bool? enable);
  Future<Result<BaseResponseObject<UserObject?>, NetworkError>> login(
      String? userName, String? password);
}
