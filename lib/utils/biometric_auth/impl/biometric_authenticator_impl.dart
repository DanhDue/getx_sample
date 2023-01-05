// Copyright (c) 2023, one of the D3F outsourcing projects. All rights reserved.

// coverage:ignore-file

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

import '../biometric_authenticator.dart';

class BiometricAuthenticatorImpl extends BiometricAuthenticator {
  final LocalAuthentication auth = Get.find();

  @override
  Future<bool> deviceIsSupported() {
    return auth.isDeviceSupported();
  }

  @override
  Future<bool> checkBiometrics() async {
    bool canCheckBiometrics = false;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (exception) {
      exception.printError();
      canCheckBiometrics = false;
    }
    return canCheckBiometrics;
  }

  @override
  Future<List<BiometricType>?> getAvailableBiometrics() async {
    List<BiometricType>? availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (exception) {
      exception.printError();
    }
    return availableBiometrics;
  }

  @override
  Future<bool> authenticate(String? localizedReason) async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
          localizedReason: localizedReason ?? '',
          options: const AuthenticationOptions(stickyAuth: true));
    } on PlatformException catch (exception) {
      exception.printError();
    }
    return authenticated;
  }

  @override
  Future<bool> authenticateWithBiometrics(String? localizedReason) async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: localizedReason ?? '',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
    } on PlatformException catch (exception) {
      exception.printError();
    }

    return authenticated;
  }

  @override
  Future<void> cancelAuthentication() async {
    auth.stopAuthentication();
  }
}
