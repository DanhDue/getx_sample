// Copyright (c) 2023, one of the D3F outsourcing projects. All rights reserved.

// coverage:ignore-file

// ignore_for_file: constant_identifier_names

class EnvironmentConfig {
  static const APP_NAME =
      String.fromEnvironment('DART_DEFINES_APP_NAME', defaultValue: "GetX Sample");
  static const APP_SUFFIX = String.fromEnvironment('DART_DEFINES_APP_SUFFIX');
  static const BASE_URL =
      String.fromEnvironment('DART_DEFINES_BASE_URL', defaultValue: "https://danhdue.com");
  static const DOCUMENT_URL = String.fromEnvironment('DART_DEFINES_DOCUMENT_URL',
      defaultValue: "https://1187-14-162-199-43.ngrok-free.app");
}
