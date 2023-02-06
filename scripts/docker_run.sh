#!/bin/bash
set -e

docker run -v $(pwd):/src -it getxsample:latest
