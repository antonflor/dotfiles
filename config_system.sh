#!/bin/bash

# Header indicating the aliases and packages were added by config_system.sh
echo "# Aliases and packages added by config_system.sh" >> ~/.bashrc

# Create a "Scripts" folder if it doesn't exist
SCRIPTS_DIR="$HOME/Scripts"
if [ ! -d "$SCRIPTS_DIR" ]; then
    mkdir -p "$SCRIPTS_DIR"
fi

# Path to .bash_aliases
BASH_ALIASES="$HOME/.bash_aliases"

# Check if aliases.sh exists
if [ -f aliases.sh ]; then
    # Check if .bash_aliases exists, create if not
    if [ ! -f "$BASH_ALIASES" ]; then
        touch "$BASH_ALIASES"
    fi

    # Append contents of aliases.sh to .bash_aliases
    cat aliases.sh >> "$BASH_ALIASES"
    echo "Aliases from aliases.sh appended to .bash_aliases."
else
    echo "Aliases file 'aliases.sh' not found."
fi

# Load packages from the packages file
if [ -f packages.txt ]; then
    packages_to_install=$(cat packages.txt)
else
    echo "Packages file 'packages.txt' not found. No additional packages to install."
fi

# List packages to be installed
if [ -n "$packages_to_install" ]; then
    echo "Packages to be installed: $packages_to_install"
else
    echo "No additional packages to install."
fi

# Prompt to install additional packages
read -p "Do you want to install these additional packages? [Y/n] " response
if [[ "$response" =~ ^[Yy]$ ]] || [ -z "$response" ]; then
    if [ -n "$packages_to_install" ]; then
        # Install packages
        sudo apt-get update && sudo apt-get install -y $packages_to_install
        echo "Additional packages installed."
    else
        echo "No additional packages to install."
    fi
else
    echo "Skipping the installation of additional packages."
fi

# Separator before waiting
echo "=================================================="

# Wait for 5 seconds
echo "Waiting for 5 seconds..."
sleep 5

# Separator after waiting
echo "=================================================="

# Install sexy-bash-prompt from GitHub
(cd /tmp && ([[ -d sexy-bash-prompt ]] || git clone --depth 1 --config core.autocrlf=false https://github.com/twolfson/sexy-bash-prompt) && cd sexy-bash-prompt && make install) && source ~/.bashrc

# Separator before waiting
echo "=================================================="

# Wait for 5 seconds
echo "Waiting for 5 seconds..."
sleep 5

# Separator after waiting
echo "=================================================="

# Reload the shell (reload again to double check)
source ~/.bashrc

# Confirmation messages
echo "Completed Modifications, Please Logout and Log back in"
