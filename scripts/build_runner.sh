#!/bin/bash
set -e

fvm flutter pub run build_runner build --delete-conflicting-outputs
melos format
