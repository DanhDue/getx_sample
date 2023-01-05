#!/bin/bash
set -e

GREEN_BOLD="\033[1;32m"
RESET_FORMATING="\033[0m"

mkdir ~/tools/git-scripts
cp ./scripts/git/* ~/tools/git-scripts
sudo chmod +x ~/tools/git-scripts
echo -e "# git-scripts\nPATH=\$HOME/tools/git-scripts:\$PATH\n\n$(cat ~/.zshrc)" > ~/.zshrc
echo -e "\033[7;32m                                       \033[0m"
echo -e "\033[7;32m Restart the VSCode to run this tools. \033[0m"
echo -e "\033[7;32m                                       \033[0m"