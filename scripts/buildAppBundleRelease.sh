#!/bin/bash
set -e

fvm flutter build appbundle --obfuscate --split-debug-info --split-per-abi \
--dart-define=DART_DEFINES_APP_NAME="GetXSample" \
--dart-define=DART_DEFINES_BASE_URL="https://danhdue.com/api/v1" \
--release \
--verbose
