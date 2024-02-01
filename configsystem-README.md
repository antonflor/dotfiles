# Configuration System Script

## Overview

This script is designed to configure your Linux system by adding aliases, customizing your prompt, and installing additional packages if desired. It also creates a "Scripts" folder in your home directory if it doesn't exist.

## Files

- `config_system.sh`: The main script that performs the system configuration.
- `aliases.sh`: A file containing custom aliases that you want to add to your shell configuration.
- `packages.txt`: A file listing additional packages that you want to install on your system.

## Usage

1. Place the `config_system.sh` script along with `aliases.sh` and `packages.txt` in a directory of your choice.
2. Open the `aliases.sh` file and add your custom aliases, following the provided format.
3. Open the `packages.txt` file and list additional packages you want to install, one package per line.

## Running the Script

1. Open a terminal and navigate to the directory containing the script and associated files.
2. Run the script using the following command: ./config_system.sh
3. Follow the on-screen prompts to configure your system.

## Customization

- You can modify the `aliases.sh` file to include your own aliases, which will be added to your shell configuration.
- Customize the appearance of your shell prompt by modifying the `PS1` variable in the `config_system.sh` script.

## Notes

- This script is designed for Debian-based Linux distributions. If you're using a different distribution, you may need to adjust package management commands accordingly.

Feel free to modify and enhance this script according to your specific needs. Enjoy your customized Linux environment!
