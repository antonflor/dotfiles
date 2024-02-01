#!/bin/bash

# Header indicating the aliases, PS1 settings, and packages were added by this script
echo "# Aliases, PS1 settings, and packages added by config_system.sh" >> ~/.bashrc

# Create a "Scripts" folder if it doesn't exist
SCRIPTS_DIR="$HOME/Scripts"
if [ ! -d "$SCRIPTS_DIR" ]; then
    mkdir -p "$SCRIPTS_DIR"
fi

# Load aliases from the aliases file
if [ -f aliases.sh ]; then
    source aliases.sh
else
    echo "Aliases file 'aliases.sh' not found."
fi

# Define colors using ANSI escape codes
TIME_COLOR="\[\033[1;94m\]"     # Blue
USER_COLOR="\[\033[1;91m\]"     # Red
HOST_COLOR="\[\033[1;92m\]"     # Green
DIR_COLOR="\[\033[1;94m\]"      # Blue
GIT_COLOR="\[\033[1;96m\]"      # Cyan for Git
ERROR_COLOR="\[\033[1;31m\]"    # Red for error

# Define Git prompt symbols
GIT_BRANCH_SYMBOL=""

# Construct the PS1
PS1="${RESET_COLOR}|${TIME_COLOR}\t${RESET_COLOR}|"
PS1+="${USER_COLOR}\u${RESET_COLOR}@${HOST_COLOR}\h${RESET_COLOR}:"
PS1+="${DIR_COLOR}\W"

# Check if aliases already exist in .bashrc and add only if not present
while read -r alias_line; do
    # Check if the alias_line is not already in .bashrc
    if ! grep -qF "$alias_line" ~/.bashrc; then
        echo "Alias added: $alias_line"
        echo "$alias_line" >> ~/.bashrc
    fi
done < "aliases.sh"

# Prompt to install additional packages
read -p "Do you want to install additional packages? [Y/n] " response
if [[ "$response" =~ ^[Yy]$ ]] || [ -z "$response" ]; then
    # Load packages from the packages file and install them
    if [ -f packages.txt ]; then
        sudo apt-get install -y $(cat packages.txt)
        echo "Additional packages installed."
    else
        echo "Packages file 'packages.txt' not found. No additional packages installed."
    fi
else
    echo "Skipping the installation of additional packages."
fi

# Add PS1 settings to .bashrc with a comment
echo "$PS1" >> ~/.bashrc

# Footer indicating the settings, aliases, and packages were added by this script
echo "# End of settings, aliases, and packages added by config_system.sh" >> ~/.bashrc

# Reload the shell
source ~/.bashrc

# Confirmation messages
echo "Aliases, PS1 settings, and other configurations have been added to ~/.bashrc."
echo "The 'Scripts' folder has been created (if necessary)."
echo "The shell has been reloaded."
