#!/bin/sh
# Manjaro-only stuff. Abort if not Manjaro.
# is_manjaro || return 1

# installers_path="$DOTFILES/caches/installers"

#############################
# WHAT DO WE NEED TO INSTALL?
#############################

# Misc.
packages+=(
  docker
  go
  godep
  maven
  octopi
  thefuck
  tilix
  python
  yaourt
  tree
  lastpass-cli
)

aur_packages+=(
  gcc5
  google-chrome
  postman
  nerd-fonts-source-code-pro
  nvm
  slack-desktop
  teamviewer
  visual-studio-code-bin
  watchman
)

# Install APT packages.

sudo pacman -Syu
installed_packages="$(pacman -Qi | awk '/^Name/{name=$3} {print name}' | uniq)"
packages=($(setdiff "${packages[*]}" "$installed_packages"))

if (( ${#packages[@]} > 0 )); then
  e_header "Installing packages (${#packages[@]})"
  sudo pacman -S "${#packages[*]}"
fi

sudo yaourt -Syu
installed_aur_packages="$(yaourt -Qm | awk -F'[/ ]' '{print $2}')"
aur_packages=($(setdiff "${aur_packages[*]}" "$installed_aur_packages"))

if (( ${#packages[@]} > 0 )); then
  e_header "Installing packages (${#aur_packages[@]})"
  sudo pacman -S "(${#aur_packages[@]})"
fi