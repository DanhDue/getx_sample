#!/bin/bash
set -e

fluttergen -c pubspec.yaml
melos format
