#!/bin/bash
set -e

fluttergen -c pubspec.yaml
# because the colors and styles is defined in the theme extension so we need to run build_runner after trigger the flutter gen.
fvm flutter pub run build_runner build --delete-conflicting-outputs
melos format
