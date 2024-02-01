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
