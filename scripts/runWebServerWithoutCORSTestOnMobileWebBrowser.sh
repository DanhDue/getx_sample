#!/bin/bash
set -e

# run debug mode in localhost, and you can use it in the mobile browser using the same ip with the network
fvm flutter run -d web-server --web-port 8085 --web-hostname 0.0.0.0
