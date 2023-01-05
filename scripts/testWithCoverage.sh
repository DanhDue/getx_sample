#!/bin/bash
set -e

fvm flutter test --coverage
melos run combineTestCoverages
melos run lcovToHtmls
