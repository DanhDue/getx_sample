#!/bin/bash
set -e

fvm flutter pub run flutter_native_splash:create

melos format
