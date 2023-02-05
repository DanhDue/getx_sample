#!/bin/bash
set -e

fvm flutter pub get
fvm flutter pub run build_runner build --delete-conflicting-outputs
fluttergen -c pubspec.yaml
get generate locales assets/locales

fvm flutter build ipa --obfuscate --split-debug-info --split-per-abi \
--dart-define=DART_DEFINES_APP_NAME="GetXSample" \
--dart-define=DART_DEFINES_BASE_URL="https://danhdue.com/api/v1" \
--export-options-plist ./ios/fastlane/export_options/Release/ExportOptions.plist \
--release \
--verbose
