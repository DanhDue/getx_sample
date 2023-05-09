// Copyright (c) 2023, one of the D3F outsourcing projects. All rights reserved.

// coverage:ignore-file

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getx_sample/app/modules/infiniteListSample/data/repository/impl/photo_repository_impl.dart';
import 'package:getx_sample/app/modules/infiniteListSample/data/repository/photo_repository.dart';
import 'package:getx_sample/data/bean/app_configurations.dart';
import 'package:getx_sample/data/bean/location_object/location_object.dart';
import 'package:getx_sample/data/bean/user_object/user_object.dart';
import 'package:getx_sample/data/repositories/app_configs_repository.dart';
import 'package:getx_sample/data/repositories/document_basis_repository.dart';
import 'package:getx_sample/data/repositories/impl/app_configs_repository_impl.dart';
import 'package:getx_sample/data/repositories/impl/document_basis_repository_impl.dart';
import 'package:getx_sample/data/repositories/impl/user_repository_impl.dart';
import 'package:getx_sample/data/repositories/user_repository.dart';
import 'package:getx_sample/utils/biometric_auth/biometric_authenticator.dart';
import 'package:getx_sample/utils/biometric_auth/impl/biometric_authenticator_impl.dart';
import 'package:hive/hive.dart';
import 'package:local_auth/local_auth.dart';

class AppGlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Dio());
    Hive.registerAdapter(AppConfigurationsAdapter());
    Hive.registerAdapter(UserObjectAdapter());
    Hive.registerAdapter(LocationObjectAdapter());
    Get.lazyPut<AppConfigsRepository>(() => AppConfigurationsRepositoryImpl(), fenix: true);
    Get.lazyPut<UserRepository>(() => UserRepositoryImpl(), fenix: true);
    Get.lazyPut<DocumentBasisRepository?>(() => DocumentBasisRepositoryImpl(), fenix: true);
    Get.lazyPut<LocalAuthentication>(() => LocalAuthentication(), fenix: true);
    Get.lazyPut<BiometricAuthenticator>(() => BiometricAuthenticatorImpl(), fenix: true);
    Get.lazyPut<PhotoRepository>(() => PhotoRepositoryImpl(), fenix: true);
  }
}
