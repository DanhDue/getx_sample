// Copyright (c) 2023, one of the D3F outsourcing projects. All rights reserved.

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:getx_sample/data/repositories/user_repository.dart';

import '../../mocks/repositories.mocks.dart';

void main() {
  test('user repository ...', () async {
    final userRepo = Get.put<UserRepository>(MockUserRepository());
  });
}
