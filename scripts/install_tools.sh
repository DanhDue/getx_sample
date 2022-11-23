#!/bin/bash
set -e

# install the FVM(Flutter Version Management)
brew tap leoafarias/fvm
brew install fvm

fvm install 3.3.8
fvm use 3.3.8

# install flutter_gen
dart pub global activate flutter_gen

# install get_cli
dart pub global activate get_cli
