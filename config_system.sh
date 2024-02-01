#!/bin/bash

# Header indicating the aliases, PS1 settings, and packages were added by this script
echo "# Aliases, PS1 settings, and packages added by config_system.sh" >> ~/.bashrc

# Create a "Scripts" folder if it doesn't exist
SCRIPTS_DIR="$HOME/Scripts"
if [ ! -d "$SCRIPTS_DIR" ]; then
    mkdir -p "$SCRIPTS_DIR"
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

# Check if in a Git repository and add Git branch and status
PS1+="\$(git_branch_status)"

# Add custom error indicator if the last command failed
PS1+="\$(error_indicator)"

# Add a custom prompt character (e.g., ➜)
PS1+="➜ ${RESET_COLOR}"

# Function to get Git branch and status
git_branch_status() {
  local git_info="$(git symbolic-ref --short HEAD 2>/dev/null)"
  if [ -n "$git_info" ]; then
    echo " ${GIT_COLOR}${GIT_BRANCH_SYMBOL}${git_info}${RESET_COLOR}"
  fi
}

# Function to display an error indicator if the last command failed
error_indicator() {
  if [ $? -ne 0 ]; then
    echo " ${ERROR_COLOR}✘${RESET_COLOR}"
  fi
}

# Define the aliases to add to .bashrc
ALIASES=$(cat << 'EOL'
# Basic Navigation
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias ..='cd ..'
alias ...='cd ../..'

# Directory Shortcuts
alias home='cd ~'
alias docs='cd ~/Documents'
alias scripts='cd ~/Scripts'  # Alias for the "Scripts" folder

# Safety Measures
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Git Aliases
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gd='git diff'
alias gco='git checkout'

# Common Tools
alias grep='grep --color=auto'
alias psg='ps aux | grep'
alias top='htop'

# System Information
alias df='df -h'
alias du='du -h'
alias free='free -h'

# Text Editing
alias edit='nano'

# Network Tools
alias myip='curl ifconfig.me'
alias ping='ping -c 5'

# Compression/Extraction
alias untar='tar -xvf'
alias unzip='unzip'

# Package Management (Ubuntu/Debian)
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'
alias install='sudo apt-get install'
alias remove='sudo apt-get remove'

# Custom Aliases for File Copying with rsync
alias cpv='rsync -ah --info=progress2'   # Copy with progress info
alias cpvs='rsync -ah --info=progress2 --stats'   # Copy with progress info and stats

EOL
)

# Check if aliases already exist in .bashrc and add only if not present
for alias_line in "$ALIASES"; do
    if ! grep -qF "$alias_line" ~/.bashrc; then
        echo "$alias_line" >> ~/.bashrc
    fi
done

# Prompt to install additional packages
read -p "Do you want to install additional packages (wget htop vnstat iotop socat iperf ntop git python3 tmux)? [Y/n] " response
if [[ "$response" =~ ^[Yy]$ ]] || [ -z "$response" ]; then
    # Install additional packages
    sudo apt-get install -y wget htop vnstat iotop socat iperf ntop git python3 tmux
    echo "Additional packages installed."
else
    echo "Skipping the installation of additional packages."
fi

# Add PS1 settings to .bashrc with a comment
echo "$PS1" >> ~/.bashrc

# Footer indicating the settings, aliases, and packages were added by this script
echo "# End of settings, aliases, and packages added by config_system.sh" >> ~/.bashrc

# Reload the shell
source ~/.bashrc

echo "Aliases, PS1 settings, and other configurations have been added to ~/.bashrc, the 'Scripts' folder has been created (if necessary), and the shell has been reloaded."
