#!/bin/bash
# https://git-scm.com/docs/git-update-index
# git update-index --assume-unchanged <file>/<folder>
# git update-index --no-assume-unchanged <file>/<folder>
set -e

git update-index --assume-unchanged .gitmodules
git update-index --assume-unchanged d3f_core
git update-index --assume-unchanged d3f_dependency_manager
git update-index --assume-unchanged d3f_inapp_purchase
git update-index --assume-unchanged d3f_login
git update-index --assume-unchanged d3f_modular
git update-index --assume-unchanged d3f_networking
git update-index --assume-unchanged d3f_shared

git submodule foreach 'git update-index --assume-unchanged .gitremotes'
