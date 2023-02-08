#!/bin/bash
set -e

fvm flutter test --coverage
melos run combineTestCoverages
melos run lcovToHtmls
mkdir .ci-reports
mv coverage_report .ci-reports
rm -rf coverage
