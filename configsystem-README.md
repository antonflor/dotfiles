# Dotfiles Repository

This repository contains my personal dotfiles and various configuration files for my Linux system.

## Overview

Dotfiles are configuration files that customize the behavior and appearance of various command-line tools and applications. This repository helps me keep track of my custom settings and preferences across different systems.

## Usage

### Installation

To use these dotfiles on a new system, follow these steps:

1. Clone this repository to your home directory:

```
git clone https://github.com/your-username/dotfiles.git ~/.dotfiles   
```

1. Navigate to the repository directory:

   ```
   cd ~/.dotfiles
   ```

2. Run the configuration script to set up your environment:

   ```
   ./config_system.sh
   ```

3. Follow the on-screen prompts to install additional packages and configure your system.

4. After the script finishes, your custom settings, aliases, and packages will be added to your `~/.bashrc` file.

5. Reload your shell to apply the changes:

   ```
   source ~/.bashrc
   ```

6. Enjoy your customized environment!

### Sexy Bash Prompt

This repository also includes a customized bash prompt using the "sexy-bash-prompt" from https://github.com/twolfson/sexy-bash-prompt.

To install the "sexy-bash-prompt," follow these steps:

1. Open your terminal.

2. Run the following command to install "sexy-bash-prompt" (requires `git` and `make`):

   ```
   (cd /tmp && ([[ -d sexy-bash-prompt ]] || git clone --depth 1 --config core.autocrlf=false https://github.com/twolfson/sexy-bash-prompt) && cd sexy-bash-prompt && make install) && source ~/.bashrc
   ```

3. The "sexy-bash-prompt" will be installed and automatically sourced in your `~/.bashrc` file.

4. Reload your shell to apply the changes:

   ```
   source ~/.bashrc
   ```

5. You now have a stylish and customizable bash prompt!

## Customization

Feel free to modify the dotfiles and configuration files to suit your preferences. You can add your own aliases, environment variables, and other customizations.

## Credits

The "sexy-bash-prompt" is created by [twolfson](https://github.com/twolfson).
