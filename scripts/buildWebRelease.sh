#!/bin/bash
set -e

fvm flutter pub get
fvm flutter pub run build_runner build --delete-conflicting-outputs
fluttergen -c pubspec.yaml
get generate locales assets/locales
git ls-files -z -- '*.dart' | xargs -0 dart format "$@" -l 99

fvm flutter build web --web-renderer canvaskit \
--dart-define=DART_DEFINES_APP_NAME="Documents" \
--dart-define=DART_DEFINES_BASE_URL="https://danhdue.com/api/v1" \
--dart-define=DART_DEFINES_DOCUMENT_URL="https://api.nlphust.ngrok.io" \
--release