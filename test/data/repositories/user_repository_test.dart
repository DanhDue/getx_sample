// Copyright (c) 2023, one of the D3F outsourcing projects. All rights reserved.

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:getx_sample/data/repositories/user_repository.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/repositories.mocks.dart';

void main() {
  test('testUserPermissionsRetrieving()', () async {
    final userRepo = Get.put<UserRepository>(MockUserRepository());
    userRepo.retrieveUserPermission();
    verifyNever(userRepo.retrieveUserInfo());
  });
}
