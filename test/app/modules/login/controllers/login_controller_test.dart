// Copyright (c) 2023, one of the D3F outsourcing projects. All rights reserved.

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:getx_sample/app/modules/login/controllers/login_controller.dart';
import 'package:getx_sample/data/bean/user_object/user_object.dart';
import 'package:getx_sample/data/repositories/user_repository.dart';
import 'package:getx_sample/utils/biometric_auth/biometric_authenticator.dart';
import 'package:mockito/mockito.dart';

import '../../../../mocks/repositories.mocks.dart';

void main() {
  test('checkBiometricAuthentication()', () async {
    final userRepo = Get.put<UserRepository>(MockUserRepository());
    final biometricAuthenticator = Get.put<BiometricAuthenticator>(MockBiometricAuthenticator());
    final loginController = Get.put<LoginController>(LoginController());

    when(biometricAuthenticator.deviceIsSupported())
        .thenAnswer((realInvocation) => Future.value(true));

    final expectedUser = UserObject(username: 'Nguyễn Văn An');
    when(userRepo.retrieveUserInfo()).thenAnswer((realInvocation) => Future.value(expectedUser));

    await loginController.checkBiometricAuthentication();
    expect(loginController.userObject, expectedUser);
  });
}
