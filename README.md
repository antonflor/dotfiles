# Dotfiles Repository

This repository contains my personal dotfiles and various configuration files for my Linux system.

## Overview

Dotfiles are configuration files that customize the behavior and appearance of various command-line tools and applications. This repository helps me keep track of my custom settings and preferences across different systems.

## Usage

### Installation

To use these dotfiles on a new system, follow these steps:

1. Clone this repository to your home directory:

   ```
   bash
   git clone https://github.com/your-username/dotfiles.git ~/Github/dotfiles
   ```

2. Change into the dotfiles directory:

   ```
   cd ~/Github/dotfiles
   ```

3. Run the configuration script to set up your environment:
   
   ```
   ./config-system.sh
   ```

4. Follow the prompts to customize your environment, add aliases, and install additional packages.

5. Once the script finishes, your environment will be configured as per your preferences.

### Updating

To update your dotfiles to the latest version in the repository:

1. Change into the dotfiles directory:

   ```
   cd ~/Github/dotfiles
   ```

2. Change into the dotfiles directory:

   ```
   git pull
   ```

3. Run the configuration script again if needed:
   
   ```
   ./config-system.sh
   ```

### License

This repository is open-source and available under the MIT License.
