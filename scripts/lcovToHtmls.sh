#!/bin/bash
set -e

genhtml coverage_report/lcov.info -o coverage_report/html
