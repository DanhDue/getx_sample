#!/bin/bash
set -e

# fvm flutter pub get
fvm flutter pub run build_runner build --delete-conflicting-outputs
fluttergen -c pubspec.yaml
get generate locales assets/locales
melos format
