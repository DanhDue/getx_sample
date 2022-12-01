#!/bin/bash
set -e

get generate locales assets/locales
melos format
