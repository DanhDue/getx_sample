// Copyright (c) 2023, one of the D3F outsourcing projects. All rights reserved.

import 'package:getx_sample/data/bean/app_configurations.dart';
import 'package:getx_sample/data/repositories/user_repository.dart';
import 'package:getx_sample/utils/biometric_auth/biometric_authenticator.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';

export 'repositories.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<Box<AppConfigurations>>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<UserRepository>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BiometricAuthenticator>(onMissingStub: OnMissingStub.returnDefault),
])
var _repositories;
