#!/usr/bin/env bash

escapedPath="$(echo `pwd` | sed 's/\//\\\//g')"

if grep flutter pubspec.yaml > /dev/null; then
  if [ -d "coverage" ]; then
    # combine line coverage info from package tests to a common file
    if [ ! -d "$MELOS_ROOT_PATH/coverage_report" ]; then
      mkdir "$MELOS_ROOT_PATH/coverage_report"
    fi
    sed "s/^SF:lib/SF:$escapedPath\/lib/g" coverage/lcov.info >> "$MELOS_ROOT_PATH/coverage_report/lcov.info"
    rm -rf "coverage"
  fi
fi

# You can also install lcov and convert the lcov.info file to HTML pages and then see the result in the browser with sorting option.
# 1. Installation
# 1.1. Installing in Ubuntu

# sudo apt-get update -qq -y
# sudo apt-get install lcov -y

# 1.2. Installing in Mac

# brew install lcov

# 2. Run tests, generate coverage files and convert to HTML

# flutter test --coverage
# genhtml coverage/lcov.info -o coverage/html

# Note This way you can add it to circleci artifacts and coveralls as well.
