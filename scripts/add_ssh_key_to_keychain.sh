#!/bin/bash
set -e

ssh-add --apple-load-keychain --apple-use-keychain ~/.ssh/id_ed25519
# ssh-add -AK ~/.ssh/id_ed25519
