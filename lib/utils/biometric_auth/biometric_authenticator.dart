// Copyright (c) 2023, one of the D3F outsourcing projects. All rights reserved.

// coverage:ignore-file

import 'package:local_auth/local_auth.dart';

abstract class BiometricAuthenticator {
  Future<bool> deviceIsSupported();
  Future<bool> checkBiometrics();
  Future<List<BiometricType>?> getAvailableBiometrics();
  Future<bool> authenticate(String? localizedReason);
  Future<bool> authenticateWithBiometrics(String? localizedReason);
  Future<void> cancelAuthentication();
}
