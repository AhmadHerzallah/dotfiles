#!/bin/bash

RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
MAGENTA="\033[35m"
WHITE="\033[37m"
NORMAL="\033[0;39m"

printf "Confirming \n"
eval 'sudo echo confirmed!'


printf "\n${WHITE}==============================================================================
SETTING UP 
==============================================================================${NORMAL}\n"



printf "Updating..."
eval "sudo apt update"
printf "Installing requirments"
eval 'sudo apt install software-properties-common apt-transport-https wget'

# Install VSCode
printf "\n${BLUE}Installing VSCode...${NORMAL}\n"
eval 'wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -'
eval 'sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"'
eval "sudo apt update"
eval "sudo apt install code"


# Install NVM
printf "\n${GREEN}Installing NVM...${NORMAL}\n"
eval "curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash"
eval "nvm install node --lts"
eval "nvm alias default node"

# Install Node & Npm
printf "\n ${GREEN}Installing Node & Npm...${NORMAL}\n"
eval "nvm install node"

# Install Oh My Zsh
printf "\n${BLUE}Installing Oh My Zsh...${NORMAL}\n"
eval "sh -c '$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)'"

# Copy ZSH config
printf "${YELLOW}Copying ZSH config into ~/.zshrc...${NORMAL}\n"
eval "cp ./zshrc ~/.zshrc"

# Install fonts
eval "sh scripts/fonts.sh"

# Set up VS Code Settings and Extensions
eval "sh scripts/vscode.sh"


# Add global NPM packages
printf "\n${GREEN}Installing global npm packages for Spaceship ZSH Prompt, Trash CLI, Gulp CLI, Docker CLI, Gatsby CLI, Vue CLI...${NORMAL}\n"
eval "npm install -g spaceship-prompt trash-cli"

# Add terminal profiles
printf "\n${GREEN} Adding terminal profiles"
eval "./gnome-terminal-profile.sh import profiles/codespace.txt"
eval "./gnome-terminal-profile.sh import profiles/halcyon.txt"

# Refresh ZSH config
eval "source ~/.zshrc"


# Browsers
eval "xdg-open https://www.google.com/chrome/"
eval "xdg-open https://www.google.com/chrome/canary/"
eval "xdg-open https://www.mozilla.org/en-US/firefox/new/"
eval "xdg-open https://www.mozilla.org/en-US/firefox/developer/"

# Communication
eval "open https://slack.com/downloads/linux"
eval "open https://github.com/chrisknepper/android-messages-desktop"

# Miscellaneous
eval "open https://www.spotify.com/us/download/linux/"


# Follow the instructions on GitHub to generate a new SSH key and add it to your Github account.
printf "\n${WHITE}==============================================================================
${GREEN}All set!
${WHITE}Make sure to follow the instructions on GitHub to generate a new SSH key and then add the key to your GitHub account.
==============================================================================${NORMAL}\n"

eval "open https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#generating-a-new-ssh-key"
eval "open https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account"
