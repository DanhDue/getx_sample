#!/bin/bash
set -e

# install the FVM(Flutter Version Management)
brew tap leoafarias/fvm
brew install fvm

fvm install 3.7.12
fvm use 3.7.12

# install flutter_gen
dart pub global activate flutter_gen

# install get_cli
dart pub global activate get_cli

# install lcov to convert the lcov.info file to HTML pages.
brew install lcov

# install cloc to tracking file types.
brew install cloc
